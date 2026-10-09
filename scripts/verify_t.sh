#!/usr/bin/env bash
# T-measurement verifier (v1.4.6). Run from any clone of this repo.
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CSV="$ROOT/data/t_freeze_2026-10-09T0416.csv"
WANT_HASH="5572cf45f6c551739a4e7ed5afabebaf45f40deae28c27b85f0eafcd55eb4258"
[ -f "$CSV" ] || { echo "FAIL: archive missing: $CSV"; exit 1; }
ARCH=$(($(wc -l < "$CSV") - 1))
echo "archive recount : $ARCH"
if [ "$ARCH" -ne 343 ]; then echo "FAIL: archive != frozen 343"; exit 1; fi
if command -v sha256sum >/dev/null 2>&1; then HASH=$(sha256sum "$CSV" | cut -d' ' -f1)
else HASH=$(shasum -a 256 "$CSV" | cut -d' ' -f1); fi
if [ "$HASH" != "$WANT_HASH" ]; then
  echo "FAIL: archive content hash mismatch — tamper or wrong file."
  echo "      got      $HASH"
  echo "      expected $WANT_HASH"
  exit 1
fi
echo "PASS: archive == frozen 343 (row count + SHA-256 content verified)"
DB="$HOME/.hermes/state.db"
LIVE=$(sqlite3 "$DB" "SELECT COUNT(*) FROM messages WHERE session_id='20260725_131848_6f3bc9c8' AND role='assistant' AND timestamp >= strftime('%s','2026-10-07 13:18:00')" 2>/dev/null || echo unavailable)
echo "live store      : $LIVE (walks by design: compaction evicts + turns accrue; see the III.3 receipt and INC-006)"
