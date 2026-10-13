#!/bin/bash
# hf_admit.sh <key> <admitted_chars>: record the hub's admitted character count against a v2 row after adjudication.
set -u
KEY="${1:?usage: hf_admit.sh <key> <admitted_chars>}"; ADM="${2:?}"
STATS="${HF_STATS:-$HOME/.hermes/scripts/hf_stats_v2.tsv}"
LOCK="$STATS.lock"; i=0
until mkdir "$LOCK" 2>/dev/null; do i=$((i+1)); [ $i -gt 200 ] && { echo "HF FAIL: lock timeout"; exit 2; }; sleep 0.05; done
awk -F'\t' -v OFS='\t' -v k="$KEY" -v a="$ADM" '$17==k{$15=a} {print}' "$STATS" > "$STATS.tmp" && mv "$STATS.tmp" "$STATS"
rmdir "$LOCK"
echo "admitted=$ADM recorded for $KEY"
