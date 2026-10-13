#!/usr/bin/env bash
# De-duplicate the frozen T archive: rows that share a second-resolution timestamp with >= 5 other rows
# are compaction rewrites, not conversational turns (ids step by 2 inside each burst). Prints raw, bulk, distinct.
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CSV="${1:-$ROOT/data/t_freeze_2026-10-09T0416.csv}"
RAW=$(($(wc -l < "$CSV") - 1))
BULK=$(tail -n +2 "$CSV" | cut -d, -f2 | sort | uniq -c | awk '$1>=5{s+=$1} END{print s+0}')
echo "raw rows        : $RAW"
echo "bulk rows (>=5 same second): $BULK"
echo "distinct turns  : $((RAW - BULK))"
tail -n +2 "$CSV" | cut -d, -f2 | sort | uniq -c | awk '$1>=5{printf "  burst %s rows at %s %s\n",$1,$2,$3}'
