#!/bin/bash
# ab_admit.sh <key> <ACCEPT|REJECT> <reason-code> [admitted-file]
# Records the hub's adjudication for one row of the A/B wave and its admitted character count.
# admitted-file is the excerpt the hub would weave (see PROTOCOL.md); for REJECT it is omitted and admitted = 0.
# Writes: ab_adjudication.tsv (append) and the admitted_chars column of ab_stats_v2.tsv via instrument/hf_admit.sh.
set -u
HERE="$(cd "$(dirname "$0")" && pwd)"; ROOT="$(cd "$HERE/../.." && pwd)"
KEY="${1:?usage: ab_admit.sh <key> <ACCEPT|REJECT> <reason-code> [admitted-file]}"
VERDICT="${2:?}"; REASON="${3:?}"; FILE="${4:-}"
case "$VERDICT" in ACCEPT|REJECT) ;; *) echo "AB FAIL: verdict must be ACCEPT or REJECT"; exit 2 ;; esac
case "$REASON" in OK|FAB|SCOPE|NEEDLE|LEN|OTHER) ;; *) echo "AB FAIL: reason must be OK|FAB|SCOPE|NEEDLE|LEN|OTHER"; exit 2 ;; esac
[ "$VERDICT" = "ACCEPT" ] && [ "$REASON" != "OK" ] && { echo "AB FAIL: ACCEPT takes reason OK"; exit 2; }
[ "$VERDICT" = "REJECT" ] && [ "$REASON" = "OK" ] && { echo "AB FAIL: REJECT needs a reason code"; exit 2; }
export HF_STATS="$HERE/ab_stats_v2.tsv"
ADM=0
if [ "$VERDICT" = "ACCEPT" ]; then
  [ -n "$FILE" ] && [ -f "$FILE" ] && [ -s "$FILE" ] || { echo "AB FAIL: ACCEPT needs a non-empty admitted file"; exit 2; }
  ADM=$(wc -c < "$FILE" | tr -d ' ')
fi
bash "$ROOT/instrument/hf_admit.sh" "$KEY" "$ADM" || exit 1
LOG="$HERE/ab_adjudication.tsv"
[ -s "$LOG" ] || printf 'date_utc\tkey\tverdict\treason\tadmitted_chars\tadmitted_file\n' >> "$LOG"
printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$(date -u +%Y%m%dT%H%M%SZ)" "$KEY" "$VERDICT" "$REASON" "$ADM" "${FILE:+$(basename "$FILE")}" >> "$LOG"
echo "AB $VERDICT $REASON admitted=$ADM key=$KEY"
