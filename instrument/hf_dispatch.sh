#!/bin/bash
# hf_dispatch.sh v2 (2026-10-13): one-shot free-lane worker dispatch with an instrumented, needle-gated row.
# v1 (as run for all 26 rows of hf_stats.tsv) is preserved verbatim as hf_dispatch_v1_as_run.sh.
# Changes from v1, each answering a finding of the 2026-10-13 external review:
#   - row is written AFTER the acceptance grep; verdict is OK / NEEDLE-MISS / TIMEOUT / ERROR and the numeric rc is logged
#   - needle must be the last non-empty line of the worker's final message; its line position is logged
#   - timestamps are UTC (date -u) with a Z suffix
#   - every dispatch keeps its own raw output and stderr under $HF_OUT_DIR (no shared /tmp file)
#   - brief bytes and dispatch-output bytes are logged (the b and o terms of the cost model)
#   - the append is serialised with flock; the header is created once under the same lock
#   - v2 rows go to hf_stats_v2.tsv; the v1 table is frozen under its snapshot hash
# usage: hf_dispatch.sh <brief-file> [deepseek|minimax] [needle] [budget_s]
set -u
BRIEF="${1:?usage: hf_dispatch.sh <brief-file> [deepseek|minimax] [needle] [budget_s]}"
WORKER="${2:-deepseek}"; NEEDLE="${3:-}"; BUDGET="${4:-850}"
case "$WORKER" in
  deepseek) MODEL="deepseek-ai/DeepSeek-V4-Flash-0731"; PROV="hyper-deepseek" ;;
  minimax)  MODEL="MiniMaxAI/MiniMax-M2.7";             PROV="hyper-minimax" ;;
  *) echo "HF FAIL: unknown worker '$WORKER' (no registry; add it here explicitly)"; exit 2 ;;
esac
STATS="${HF_STATS:-$HOME/.hermes/scripts/hf_stats_v2.tsv}"
OUT_DIR="${HF_OUT_DIR:-$HOME/.hermes/scripts/hf_out}"; mkdir -p "$OUT_DIR"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"; KEY="${STAMP}_$(basename "$BRIEF" .md)_$$"
OUT_FILE="$OUT_DIR/$KEY.out"; ERR_FILE="$OUT_DIR/$KEY.err"
BRIEF_B=$(wc -c < "$BRIEF" | tr -d ' ')
T0=$SECONDS
perl -e 'alarm shift @ARGV; exec @ARGV' "$BUDGET" \
  hermes chat -m "$MODEL" --provider "$PROV" -q "$(cat "$BRIEF")" > "$OUT_FILE" 2> "$ERR_FILE"
RC=$?
DUR=$((SECONDS - T0))
OUT_B=$(wc -c < "$OUT_FILE" | tr -d ' ')
MSGS=$(grep -o 'Messages:[[:space:]]*[0-9]*' "$OUT_FILE" | tail -1 | grep -o '[0-9]*$')
SESSION=$(grep -o 'session_id:[[:space:]]*[A-Za-z0-9_]*' "$ERR_FILE" | tail -1 | awk '{print $2}')
# needle gate: strip CLI box chrome, take the last non-empty line, compare to NEEDLE exactly
NEEDLE_STATUS="none"; NEEDLE_POS=""
if [ -n "$NEEDLE" ]; then
  LAST=$(sed -e 's/^[│╭╮╰╯├┤┬┴─ \t]*//' -e 's/[│─ \t]*$//' "$OUT_FILE" | grep -v '^[A-Z][a-z]*: [0-9]' | grep -v '^$' | tail -1)
  TOTAL=$(wc -l < "$OUT_FILE" | tr -d ' ')
  POS=$(grep -n -F -- "$NEEDLE" "$OUT_FILE" | tail -1 | cut -d: -f1)
  NEEDLE_POS="${POS:-0}/$TOTAL"
  if [ "$LAST" = "$NEEDLE" ]; then NEEDLE_STATUS="hit"; else NEEDLE_STATUS="miss"; fi
fi
if   [ "$RC" -eq 142 ] || [ "$RC" -eq 14 ]; then VERDICT="TIMEOUT"
elif [ "$RC" -ne 0 ];   then VERDICT="ERROR"
elif [ "$NEEDLE_STATUS" = "miss" ]; then VERDICT="NEEDLE-MISS"
else VERDICT="OK"; fi
ARTIFACT_B=""
if [ "$NEEDLE_STATUS" = "hit" ]; then
  # artifact = cleaned text of the final message up to and including the needle line
  ARTIFACT_B=$(sed -e 's/^[│╭╮╰╯├┤┬┴─ \t]*//' -e 's/[│─ \t]*$//' "$OUT_FILE" | grep -v '^[A-Z][a-z]*: [0-9]' | grep -v '^$' | wc -c | tr -d ' ')
fi
(
  flock 9
  [ -s "$STATS" ] || printf 'date_utc\tworker\tbrief\tbudget_s\tdur_s\tout_bytes\tmsgs\trc\tverdict\tneedle\tneedle_pos\tartifact_bytes\tbrief_bytes\tadmitted_chars\tsession_id\tout_file\n' >> "$STATS"
  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$STAMP" "$WORKER" "$(basename "$BRIEF")" "$BUDGET" "$DUR" "$OUT_B" "${MSGS:-?}" "$RC" "$VERDICT" \
    "$NEEDLE_STATUS" "$NEEDLE_POS" "${ARTIFACT_B:-}" "$BRIEF_B" "" "${SESSION:-}" "$KEY" >> "$STATS"
) 9>"$STATS.lock"
# hf_admit.sh <out_file key> <admitted_chars> fills admitted_chars after hub adjudication (same lock).
tail -25 "$OUT_FILE"
[ "$VERDICT" = "OK" ] || { echo "HF FAIL: verdict=$VERDICT rc=$RC needle=$NEEDLE_STATUS"; exit 1; }
