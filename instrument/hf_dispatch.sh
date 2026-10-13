#!/bin/bash
# hf_dispatch.sh v2.1 (2026-10-13): one-shot free-lane worker dispatch with an instrumented, needle-gated row.
# v1 (as run for all 26 rows of hf_stats.tsv) is preserved verbatim as hf_dispatch_v1_as_run.sh.
# v2/v2.1 answer the 2026-10-13 panel findings (round 1 and round 2):
#   - the hermes single-query path (-q) echoes the full brief to stdout as "Query: ..." and ends stdout with an
#     exit summary ("Resume this session with:" ... "Session:" "Duration:" "Messages:"). v1's whole-transcript grep
#     could therefore be satisfied by the echo. v2.1 cuts the transcript at the exit summary and drops the echo
#     before any gate or byte count.
#   - row is written AFTER the gate; verdict is OK / NEEDLE-MISS / TIMEOUT / ERROR; numeric rc logged
#   - needle must be the last non-empty line of the response; its line position is logged
#   - timestamps are UTC (date -u) with a Z suffix; per-dispatch stdout and stderr are kept under $HF_OUT_DIR
#   - b (brief bytes) and o (bytes this script returns into the hub's context) are logged; out_bytes is the raw transcript
#   - the append is serialised with a portable mkdir lock; perl exec failure is loud; empty output is never OK
#   - HERMES_KANBAN_TASK must be unset (hermes maps SIGALRM to exit 0 when it is set)
#   - v2 rows go to hf_stats_v2.tsv; the v1 table is frozen under its snapshot hash
# Scope is still enforced by instruction in the brief, not by this script (no write allow-list, jail, or tool policy).
# usage: hf_dispatch.sh <brief-file> [deepseek|minimax] [needle] [budget_s]
set -u
BRIEF="${1:?usage: hf_dispatch.sh <brief-file> [deepseek|minimax] [needle] [budget_s]}"
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
RAW="$OUT_DIR/$KEY.raw"; RESP="$OUT_DIR/$KEY.resp"; ERR="$OUT_DIR/$KEY.err"
BRIEF_B=$(wc -c < "$BRIEF" | tr -d ' ')
T0=$SECONDS
perl -e 'alarm shift @ARGV; exec @ARGV or die "exec failed: $!\n"' "$BUDGET" \
  hermes chat -m "$MODEL" --provider "$PROV" -q "$(cat "$BRIEF")" > "$RAW" 2> "$ERR"
RC=$?
DUR=$((SECONDS - T0))
OUT_B=$(wc -c < "$RAW" | tr -d ' ')
# --- response = transcript minus the CLI's brief echo and minus the exit summary (hermes cli.py: "Query:" line,
#     then the response panel, then "Resume this session with:" / Session: / Duration: / Messages:)
awk '
  /^Resume this session with:/ { exit }
  /^Query: / && !seen { seen=1; next }
  { print }
' "$RAW" | sed -e 's/^[│╭╮╰╯├┤┬┴─ \t]*//' -e 's/[│─ \t]*$//' > "$RESP"
MSGS=$(grep -o 'Messages:[[:space:]]*[0-9]*' "$RAW" | tail -1 | grep -o '[0-9]*$')
SESSION=$(grep -o '^Session:[[:space:]]*[A-Za-z0-9_]*' "$RAW" | tail -1 | awk '{print $2}')
NEEDLE_STATUS="none"; NEEDLE_POS=""
if [ -n "$NEEDLE" ]; then
  LAST=$(grep -v '^$' "$RESP" | tail -1)
  TOTAL=$(wc -l < "$RESP" | tr -d ' ')
  POS=$(grep -n -F -- "$NEEDLE" "$RESP" | tail -1 | cut -d: -f1)
  NEEDLE_POS="${POS:-0}/$TOTAL"
  if [ "$LAST" = "$NEEDLE" ]; then NEEDLE_STATUS="hit"; else NEEDLE_STATUS="miss"; fi
fi
if   [ "$RC" -eq 142 ]; then VERDICT="TIMEOUT"
elif [ "$RC" -ne 0 ] || [ ! -s "$RAW" ]; then VERDICT="ERROR"
elif [ "$NEEDLE_STATUS" = "miss" ]; then VERDICT="NEEDLE-MISS"
else VERDICT="OK"; fi
ARTIFACT_B=""
[ "$NEEDLE_STATUS" = "hit" ] && ARTIFACT_B=$(grep -v '^$' "$RESP" | wc -c | tr -d ' ')
# --- artifact_bytes above = the echo-free response through its last non-empty line, which on a hit is the needle line
# --- what this script returns into the hub's context (the o term): the response tail plus the status line
RETURN=$(grep -v '^$' "$RESP" | tail -25; echo "HF $VERDICT rc=$RC needle=$NEEDLE_STATUS key=$KEY")
O_B=$(printf '%s\n' "$RETURN" | wc -c | tr -d ' ')
# --- portable lock (mkdir is atomic on POSIX filesystems; flock(1) is absent on macOS)
LOCK="$STATS.lock"; i=0
until mkdir "$LOCK" 2>/dev/null; do i=$((i+1)); [ $i -gt 200 ] && { echo "HF FAIL: lock timeout"; exit 2; }; sleep 0.05; done
trap 'rmdir "$LOCK" 2>/dev/null' EXIT
[ -s "$STATS" ] || printf 'date_utc\tworker\tbrief\tbudget_s\tdur_s\tout_bytes\tmsgs\trc\tverdict\tneedle\tneedle_pos\tartifact_bytes\tbrief_bytes\to_bytes\tadmitted_chars\tsession_id\tkey\n' >> "$STATS"
printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
  "$STAMP" "$WORKER" "$(basename "$BRIEF")" "$BUDGET" "$DUR" "$OUT_B" "${MSGS:-?}" "$RC" "$VERDICT" \
  "$NEEDLE_STATUS" "$NEEDLE_POS" "${ARTIFACT_B:-}" "$BRIEF_B" "$O_B" "" "${SESSION:-}" "$KEY" >> "$STATS"
rmdir "$LOCK" 2>/dev/null; trap - EXIT
printf '%s\n' "$RETURN"
[ "$VERDICT" = "OK" ] || exit 1
