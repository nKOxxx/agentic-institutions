#!/usr/bin/env bash
# Recompute Table 1 from instrument/hf_stats.tsv and assert DRAFT.md carries the same cells (added after INC-007).
set -u
export LC_ALL=en_US.UTF-8
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; TSV="$ROOT/instrument/hf_stats.tsv"; DRAFT="${1:-$ROOT/DRAFT.md}"
fail=0
check(){ grep -q -F -- "$2" "$DRAFT" && echo "ok   $1 = $2" || { echo "FAIL $1: '$2' not in DRAFT.md"; fail=1; }; }
# per-wave produced bytes (instrument) and wall maxima; rows: w1=1,2 w2=3,4 w3=5,6 w4=8-13
sum(){ awk -F'\t' -v r="$1" 'BEGIN{split(r,a,",")} NR>1{for(i in a) if(NR-1==a[i]+0) s+=$6} END{print s}' "$TSV"; }
mx(){  awk -F'\t' -v r="$1" 'BEGIN{split(r,a,",")} NR>1{for(i in a) if(NR-1==a[i]+0 && $5+0>m) m=$5+0} END{print m}' "$TSV"; }
fmt(){ printf "%'d" "$1"; }
check "wave1 instrument bytes" "$(fmt $(sum 1,2))"; check "wave2 instrument bytes" "$(fmt $(sum 3,4))"; check "wave3 produced" "$(fmt $(sum 5,6))"; check "wave4 instrument bytes" "$(fmt $(sum 8,9,10,11,12,13))"
W1=$(mx 1,2); W2=$(mx 3,4); W3=$(mx 5,6); W4=$(mx 8,9,10,11,12,13); TOT=$((W1+W2+W3+W4))
check "wall max w1" "| $W1 |"; check "wall max w2" "| $W2 |"; check "wall max w3" "| $W3 |"; check "wall max w4" "| $W4 |"; check "wall total" "$TOT (Σ max)"
check "resolver bytes" "$(fmt $(sum 14))"
[ $fail -eq 0 ] && echo "PASS: Table 1 cells match the instrument" || exit 1
