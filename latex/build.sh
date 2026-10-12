#!/bin/bash
# Rebuild paper.pdf from DRAFT.md. Requires: pandoc, tectonic, python3.
set -e
cd "$(dirname "$0")"
# assemble build input: DRAFT (minus its own H1 - metadata title covers it) + RESULTS.md as Appendix C
{ tail -n +2 ../DRAFT.md; printf '\n\n# APPENDIX C, MEASURED RESULTS (verbatim instrument record, measured 2026-10-07)\n\n'; tail -n +2 ../RESULTS.md; } > build_input.md
pandoc build_input.md -f gfm -t latex -s \
  --metadata title="Agentic Institutions: Mandates, Capabilities, Constraints, and Escalation for Machine Economic Actors" \
  --metadata author="Nikola Stojanow" \
  --metadata date="October 9, 2026 (v1.4.6)" -o DRAFT.tex
python3 postprocess.py DRAFT.tex paper.tex
tectonic paper.tex
echo "OK: $(pdfinfo paper.pdf | grep Pages)"
