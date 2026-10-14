#!/bin/bash
# hf_dispatch.sh v2.3 (2026-10-14): one-shot free-lane worker dispatch with an instrumented, needle-gated row.
# v1 (as run for all 26 rows of hf_stats.tsv) is preserved verbatim as hf_dispatch_v1_as_run.sh.
# Column legend of hf_stats_v2.tsv (one line per column):
#   date_utc        UTC timestamp of the row, Z-suffixed
#   worker          deepseek | minimax (unknown names are rejected; there is no registry)
#   brief           basename of the brief file
#   budget_s        wall-clock alarm in seconds
#   dur_s           measured wall-clock seconds
#   out_bytes       bytes of the worker's raw stdout (the quiet path prints the final response only)
#   msgs            not available on the quiet path; always "n/a" (v1 rows parsed it from the exit summary)
#   rc              numeric exit status of the worker process (142 = killed by the alarm)
#   verdict         OK | NEEDLE-MISS | TIMEOUT | ERROR, decided after the gate
#   needle          hit | miss | none (none when no needle was given)
#   needle_pos      line of the last needle occurrence / total non-empty response lines
#   artifact_bytes  bytes of the non-empty response lines, on a hit (ends at the needle line)
#   brief_bytes     bytes of the brief file (the b term of the cost model)
#   o_bytes         bytes this script prints to the hub (the o term): response tail + status line
#   admitted_chars  filled later by hf_admit.sh after hub adjudication
#   session_id      worker session id, parsed from stderr ("session_id: ...")
#   key             per-dispatch key; raw stdout is $HF_OUT_DIR/<key>.out, stderr <key>.err
# Why the quiet path: hermes `chat -q` echoes the full brief to stdout, boxes the response, and appends an exit
# summary, and its terminal library writes CRLF line endings when stdout is a file; v1's whole-transcript grep could
# be satisfied by the echo (INC-008). `chat -Q -q <brief>` prints the final response alone (-Q is a flag; the brief still goes through -q) with a plain print and the session id
# to stderr. Line endings are normalised anyway. Scope is still enforced by instruction, not by this script.
# usage: hf_dispatch.sh <brief-file> [deepseek|minimax] [needle] [budget_s]
set -u
BRIEF="${1:?usage: hf_dispatch.sh <brief-file> [deepseek|minimax] [needle] [budget_s]}"
[ -r "$BRIEF" ] || { echo "HF FAIL: brief not readable: $BRIEF"; exit 2; }
WORKER="${2:-deepseek}"; NEEDLE="${3:-}"; BUDGET="${4:-850}"
[ -z "${HERMES_KANBAN_TASK:-}" ] || { echo "HF FAIL: HERMES_KANBAN_TASK is set; budget timeouts would exit 0"; exit 2; }
command -v hermes >/dev/null 2>&1 || { echo "HF FAIL: hermes not on PATH"; exit 2; }
case "$WORKER" in
  deepseek) MODEL="deepseek-ai/DeepSeek-V4-Flash-0731"; PROV="hyper-deepseek" ;;
  minimax)  MODEL="MiniMaxAI/MiniMax-M2.7";             PROV="hyper-minimax" ;;
  *) echo "HF FAIL: unknown worker '$WORKER' (no registry; add it here explicitly)"; exit 2 ;;
esac
STATS="${HF_STATS:-$HOME/.hermes/scripts/hf_stats_v2.tsv}"
OUT_DIR="${HF_OUT_DIR:-$HOME/.hermes/scripts/hf_out}"; mkdir -p "$OUT_DIR"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"; KEY="${STAMP}_$(basename "$BRIEF" .md)_$$"
RAW="$OUT_DIR/$KEY.out"; ERR="$OUT_DIR/$KEY.err"
BRIEF_B=$(wc -c < "$BRIEF" | tr -d ' ')
T0=$SECONDS
perl -e 'alarm shift @ARGV; exec @ARGV or die "exec failed: $!\n"' "$BUDGET" \
  hermes chat -m "$MODEL" --provider "$PROV" -Q -q "$(cat "$BRIEF")" > "$RAW" 2> "$ERR"
RC=$?
DUR=$((SECONDS - T0))
OUT_B=$(wc -c < "$RAW" | tr -d ' ')
# response = stdout with CR removed and trailing blanks trimmed; non-empty lines only for the gate
RESP=$(tr -d '\r' < "$RAW" | sed -e 's/[[:blank:]]*$//' | grep -v '^$')
SESSION=$(grep -o 'session_id:[[:space:]]*[A-Za-z0-9_]*' "$ERR" | tail -1 | awk '{print $2}')
NEEDLE_STATUS="none"; NEEDLE_POS=""
if [ -n "$NEEDLE" ]; then
  LAST=$(printf '%s\n' "$RESP" | tail -1)
  TOTAL=$(printf '%s\n' "$RESP" | grep -c '')
  POS=$(printf '%s\n' "$RESP" | grep -n -F -- "$NEEDLE" | tail -1 | cut -d: -f1)
  NEEDLE_POS="${POS:-0}/$TOTAL"
  if [ "$LAST" = "$NEEDLE" ]; then NEEDLE_STATUS="hit"; else NEEDLE_STATUS="miss"; fi
fi
if   [ "$RC" -eq 142 ]; then VERDICT="TIMEOUT"
elif [ "$RC" -ne 0 ] || [ -z "$RESP" ]; then VERDICT="ERROR"
elif [ "$NEEDLE_STATUS" = "miss" ]; then VERDICT="NEEDLE-MISS"
else VERDICT="OK"; fi
ARTIFACT_B=""
[ "$NEEDLE_STATUS" = "hit" ] && ARTIFACT_B=$(printf '%s\n' "$RESP" | wc -c | tr -d ' ')
RETURN=$(printf '%s\n' "$RESP" | tail -25; echo "HF $VERDICT rc=$RC needle=$NEEDLE_STATUS key=$KEY")
O_B=$(printf '%s\n' "$RETURN" | wc -c | tr -d ' ')
ROW=$(printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s' \
  "$STAMP" "$WORKER" "$(basename "$BRIEF")" "$BUDGET" "$DUR" "$OUT_B" "n/a" "$RC" "$VERDICT" \
  "$NEEDLE_STATUS" "$NEEDLE_POS" "${ARTIFACT_B:-}" "$BRIEF_B" "$O_B" "" "${SESSION:-}" "$KEY")
HEADER='date_utc\tworker\tbrief\tbudget_s\tdur_s\tout_bytes\tmsgs\trc\tverdict\tneedle\tneedle_pos\tartifact_bytes\tbrief_bytes\to_bytes\tadmitted_chars\tsession_id\tkey'
# portable lock (mkdir is atomic; flock(1) is absent on macOS). A stale lock older than the budget is removed.
LOCK="$STATS.lock"
if [ -d "$LOCK" ] && [ -n "$(find "$LOCK" -maxdepth 0 -mmin +$(( (BUDGET+59)/60 )) 2>/dev/null)" ]; then rmdir "$LOCK" 2>/dev/null; fi
i=0
until mkdir "$LOCK" 2>/dev/null; do
  i=$((i+1))
  if [ $i -gt 200 ]; then printf '%s\n' "$ROW" >> "$STATS.pending"; echo "HF WARN: lock $LOCK held >10s; row appended to $STATS.pending"; break; fi
  sleep 0.05
done
if [ $i -le 200 ]; then
  trap 'rmdir "$LOCK" 2>/dev/null' EXIT
  [ -s "$STATS" ] || printf "$HEADER\n" >> "$STATS"
  printf '%s\n' "$ROW" >> "$STATS"
  rmdir "$LOCK" 2>/dev/null; trap - EXIT
fi
printf '%s\n' "$RETURN"
[ "$VERDICT" = "OK" ] || exit 1
