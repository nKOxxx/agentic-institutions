#!/bin/bash
# Rebuild paper.pdf from DRAFT.md. Requires: pandoc, tectonic, python3.
set -e
cd "$(dirname "$0")"
pandoc ../DRAFT.md -f gfm -t latex -s \
  --metadata title="Agentic Institutions: Mandates, Capabilities, Constraints, and Escalation for Machine Economic Actors" \
  --metadata author="hub (nKOxxx agentic-institutions instrument)" \
  --metadata date="October 9, 2026 (v1.4.6)" -o DRAFT.tex
python3 postprocess.py DRAFT.tex paper.tex
tectonic paper.tex
echo "OK: $(pdfinfo paper.pdf | grep Pages)"
