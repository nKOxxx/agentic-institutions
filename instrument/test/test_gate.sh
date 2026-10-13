#!/bin/bash
# Runs the v2.1 response extraction and needle gate (same awk/sed/grep as hf_dispatch.sh) over the fixture.
set -u
D="$(cd "$(dirname "$0")" && pwd)"; RAW="$D/fixture_q_path.txt"; NEEDLE="SECTION-S3B-OK"
RESP=$(awk '/^Resume this session with:/ { exit } /^Query: / && !seen { seen=1; next } { print }' "$RAW" | sed -e 's/^[│╭╮╰╯├┤┬┴─ \t]*//' -e 's/[│─ \t]*$//')
LAST=$(printf '%s\n' "$RESP" | grep -v '^$' | tail -1)
SESSION=$(grep -o '^Session:[[:space:]]*[A-Za-z0-9_]*' "$RAW" | tail -1 | awk '{print $2}')
MSGS=$(grep -o 'Messages:[[:space:]]*[0-9]*' "$RAW" | tail -1 | grep -o '[0-9]*$')
ECHO_IN_RESP=$(printf '%s\n' "$RESP" | grep -c 'End with exactly')
printf 'last line      : %s\nneedle         : %s\nsession        : %s\nmsgs           : %s\necho in resp   : %s\n' "$LAST" "$([ "$LAST" = "$NEEDLE" ] && echo hit || echo miss)" "$SESSION" "$MSGS" "$ECHO_IN_RESP"
[ "$LAST" = "$NEEDLE" ] && [ "$SESSION" = "20261013_000000_deadbeef" ] && [ "$MSGS" = "3" ] && [ "$ECHO_IN_RESP" = "0" ] && echo PASS || { echo FAIL; exit 1; }
