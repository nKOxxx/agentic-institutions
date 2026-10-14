#!/bin/bash
# hf_dispatch.sh, one-shot Hyperfusion worker dispatch (FREE lane, zero main-model burn per worker turn)
# usage: hf_dispatch.sh <brief-file> [deepseek|minimax] [accept-grep-needle] [budget_seconds]
#   brief-file : file containing the full task brief (deliverables + acceptance + trailer instruction)
#   worker     : deepseek (default, fast) | minimax (deep reasoning)
#   needle     : optional string that MUST appear in output, else exit 1 (acceptance grep)
#   budget     : worker alarm budget in seconds (default 850; keep --timeout above it)
set -u
BRIEF="${1:?usage: hf_dispatch.sh <brief-file> [deepseek|minimax] [needle] [budget_s]}"
WORKER="${2:-deepseek}"; NEEDLE="${3:-}"; BUDGET="${4:-850}"
case "$WORKER" in
  deepseek) MODEL="deepseek-ai/DeepSeek-V4-Flash-0731"; PROV="hyper-deepseek" ;;
  minimax)  MODEL="MiniMaxAI/MiniMax-M2.7";             PROV="hyper-minimax" ;;
  *) MODEL="$WORKER"; PROV="hyper-deepseek" ;;
esac
OUT_FILE="${5:-/tmp/hf_last_out.txt}"
T0=$SECONDS
OUT=$(perl -e 'alarm shift @ARGV; exec @ARGV' "$BUDGET" \
  hermes chat -m "$MODEL" --provider "$PROV" -q "$(cat "$BRIEF")" 2>/dev/null)
RC=$?
DUR=$((SECONDS - T0))
printf '%s\n' "$OUT" > "$OUT_FILE"   # full raw output preserved for hub extraction
# p/T instrumentation: one row per attempt (paper dataset, p-hat = OK/total over the log)
# v1.2: + artifact_s (cleaned deliverable chars: text after last needle occurrence, chrome
# stripped) + admitted_s (chars hub actually admitted; filled post-adjudication, else empty).
# alpha = admitted_s / artifact_s becomes recomputable per row (reviewer finding B4).
STATS="${HF_STATS:-$HOME/.hermes/scripts/hf_stats.tsv}"
[ -f "$STATS" ] || printf 'date\tworker\tbrief\tbudget_s\tdur_s\tchars\tmsgs\tverdict\tartifact_s\tadmitted_s\n' >> "$STATS"
MSGS=$(printf '%s' "$OUT" | grep -o 'Messages:[[:space:]]*[0-9]*' | tail -1 | grep -o '[0-9]*$')
ARTIFACT_S=""
if [ -n "$NEEDLE" ]; then
  ARTIFACT_S=$(printf '%s' "$OUT" | awk -v nd="$NEEDLE" '
    { buf[NR]=$0 }
    END {
      start=0
      for (i=1;i<=NR;i++) if (index(buf[i], nd) > 0) start=i
      if (start==0) { print ""; exit }
      out=""
      for (i=start;i<=NR;i++) {
        line=buf[i]
        sub(/^[│╭╮╰╯├┤┬┴─ \t]+/, "", line)
        sub(/─+[ \t]*$/, "", line)
        gsub(/^[ \t]+|[ \t]+$/, "", line)
        if (line != "" && line !~ /^[A-Z][a-z]+: [0-9]/) out = out line "\n"
      }
      printf "%d", length(out)
    }')
fi
printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
  "$(date +%FT%T)" "$WORKER" "$(basename "$BRIEF")" "$BUDGET" "$DUR" "$(printf '%s' "$OUT" | wc -c | tr -d ' ')" \
  "${MSGS:-?}" \
  "$([ $RC -eq 0 ] && echo OK || echo TIMEOUT)" \
  "${ARTIFACT_S:-}" \
  "${HF_ADMITTED:-}" >> "$STATS"
# worker's report = tail of its final message (CLI box-draws output; never line-anchor greps)
echo "$OUT" | tail -25
if [ -n "$NEEDLE" ]; then
  echo "$OUT" | grep -q "$NEEDLE" || { echo "HF FAIL: acceptance '$NEEDLE' not in output (rc=$RC)"; exit 1; }
fi
[ "$RC" -eq 0 ] || { echo "HF FAIL: worker rc=$RC"; exit 1; }
echo "HF OK ($WORKER, budget ${BUDGET}s)"
