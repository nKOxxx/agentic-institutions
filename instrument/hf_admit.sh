#!/bin/bash
# hf_admit.sh <key> <admitted_chars>: record the hub's admitted character count against a v2 row after adjudication.
set -u
KEY="${1:?usage: hf_admit.sh <key> <admitted_chars>}"; ADM="${2:?}"
STATS="${HF_STATS:-$HOME/.hermes/scripts/hf_stats_v2.tsv}"
LOCK="$STATS.lock"; i=0
until mkdir "$LOCK" 2>/dev/null; do i=$((i+1)); [ $i -gt 200 ] && { echo "HF FAIL: lock $LOCK held >10s"; exit 2; }; sleep 0.05; done
trap 'rmdir "$LOCK" 2>/dev/null' EXIT
N=$(awk -F'\t' -v k="$KEY" '$17==k' "$STATS" | wc -l | tr -d ' ')
[ "$N" -eq 1 ] || { echo "HF FAIL: $N rows match key $KEY"; exit 1; }
awk -F'\t' -v OFS='\t' -v k="$KEY" -v a="$ADM" '$17==k{$15=a} {print}' "$STATS" > "$STATS.tmp" && mv "$STATS.tmp" "$STATS"
echo "admitted=$ADM recorded for $KEY"
