#!/bin/bash
# Runs the v2.2 response extraction and needle gate (same commands as hf_dispatch.sh) over generated fixtures.
set -u
D="$(cd "$(dirname "$0")" && pwd)"; NEEDLE="SECTION-S3B-OK"; fail=0
python3 "$D/gen_fixtures.py" >/dev/null
gate(){ RESP=$(tr -d '\r' < "$1" | sed -e 's/[[:blank:]]*$//' | grep -v '^$'); LAST=$(printf '%s\n' "$RESP" | tail -1); FIRST=$(printf '%s\n' "$RESP" | head -1); [ "$LAST" = "$NEEDLE" ] && echo hit || echo miss; }
for f in fixture_Q_plain.out fixture_Q_crlf.out; do r=$(gate "$D/$f"); printf '%-22s %s\n' "$f" "$r"; [ "$r" = hit ] || fail=1; done
r=$(gate "$D/fixture_Q_miss.out"); printf '%-22s %s\n' fixture_Q_miss.out "$r"; [ "$r" = miss ] || fail=1
FIRST=$(tr -d '\r' < "$D/fixture_Q_plain.out" | sed -e 's/[[:blank:]]*$//' | grep -v '^$' | head -1); [ "${FIRST:0:5}" = "touch" ] && echo "leading-t line intact" || { echo "FAIL: leading t stripped"; fail=1; }
S=$(grep -o 'session_id:[[:space:]]*[A-Za-z0-9_]*' "$D/fixture_Q.err" | tail -1 | awk '{print $2}'); [ "$S" = "20261013_000000_deadbeef" ] && echo "session parsed" || { echo "FAIL: session"; fail=1; }
[ $fail -eq 0 ] && echo PASS || { echo FAIL; exit 1; }
