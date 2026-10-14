#!/bin/bash
# Rebuild paper.pdf from ../DRAFT.md (v1.5 layout: appendices live inside DRAFT.md; RESULTS.md is the instrument record, not a build input).
# Requires: pandoc, tectonic, python3, Menlo (mono) available to fontspec. Rebuild the figure first if figure.tex changed: tectonic figure.tex
set -e
cd "$(dirname "$0")"
pandoc ../DRAFT.md -f gfm+implicit_figures -t latex -s --shift-heading-level-by=-1 \
  --metadata title="Agentic Institutions: Mandates, Capabilities, Constraints, and Escalation for Machine Economic Actors" \
  --metadata author="Nikola Stojanow" \
  --metadata keywords="delegated cognition, agentic institutions, hub-and-worker, context admission, provenance audit, rent-or-buy" \
  --metadata date="October 14, 2026 (v1.8.2, tag v1.8.2)" -o DRAFT.tex
LC_ALL=en_US.UTF-8 bash ../scripts/check_table1.sh ../DRAFT.md
python3 postprocess.py DRAFT.tex paper.tex
tectonic paper.tex
echo "OK: $(pdfinfo paper.pdf | grep Pages)"
