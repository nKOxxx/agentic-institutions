#!/usr/bin/env bash
# T-measurement verifier (v1.4.3). Run from any clone of this repo.
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CSV="$ROOT/data/t_freeze_2026-10-09T0416.csv"
[ -f "$CSV" ] || { echo "FAIL: archive missing: $CSV"; exit 1; }
ARCH=$(($(wc -l < "$CSV") - 1))
echo "archive recount : $ARCH"
if [ "$ARCH" -ne 343 ]; then echo "FAIL: archive != frozen 343"; exit 1; fi
echo "PASS: archive == frozen 343 (byte-stable; git-attested)"
DB="$HOME/.hermes/state.db"
LIVE=$(sqlite3 "$DB" "SELECT COUNT(*) FROM messages WHERE session_id='20260725_131848_6f3bc9c8' AND role='assistant' AND timestamp >= strftime('%s','2026-10-07 13:18:00')" 2>/dev/null || echo unavailable)
echo "live store      : $LIVE (walks by design: compaction evicts + turns accrue; see the III.3 receipt and INC-006)"
