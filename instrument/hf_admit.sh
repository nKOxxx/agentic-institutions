#!/bin/bash
# hf_admit.sh <row key (out_file column)> <admitted_chars>: record the hub's admitted character count after adjudication.
set -u
KEY="${1:?usage: hf_admit.sh <key> <admitted_chars>}"; ADM="${2:?}"
STATS="${HF_STATS:-$HOME/.hermes/scripts/hf_stats_v2.tsv}"
( flock 9; awk -F'\t' -v OFS='\t' -v k="$KEY" -v a="$ADM" '$16==k{$14=a} {print}' "$STATS" > "$STATS.tmp" && mv "$STATS.tmp" "$STATS" ) 9>"$STATS.lock"
grep -c -P "\t$KEY$" "$STATS" >/dev/null && echo "admitted=$ADM recorded for $KEY"
