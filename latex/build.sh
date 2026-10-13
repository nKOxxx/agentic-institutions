#!/bin/bash
# Rebuild paper.pdf from ../DRAFT.md (v1.5 layout: appendices live inside DRAFT.md; RESULTS.md is the instrument record, not a build input).
# Requires: pandoc, tectonic, python3, Menlo (mono) available to fontspec. Rebuild the figure first if figure.tex changed: tectonic figure.tex
set -e
cd "$(dirname "$0")"
pandoc ../DRAFT.md -f gfm+implicit_figures -t latex -s --shift-heading-level-by=-1 \
  --metadata title="Agentic Institutions: Mandates, Capabilities, Constraints, and Escalation for Machine Economic Actors" \
  --metadata author="Nikola Stojanow" \
  --metadata date="October 13, 2026 (v1.5)" -o DRAFT.tex
python3 postprocess.py DRAFT.tex paper.tex
tectonic paper.tex
echo "OK: $(pdfinfo paper.pdf | grep Pages)"
