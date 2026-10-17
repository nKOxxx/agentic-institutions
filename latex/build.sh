#!/bin/bash
# Rebuild paper.pdf from ../DRAFT.md (v1.5 layout: appendices live inside DRAFT.md; RESULTS.md is the instrument record, not a build input).
# Requires: pandoc, tectonic, python3, Menlo (mono) available to fontspec. Rebuild the figure first if figure.tex changed: tectonic figure.tex
set -e
cd "$(dirname "$0")"
pandoc ../DRAFT.md -f gfm+implicit_figures -t latex -s --shift-heading-level-by=-1 \
  --metadata title="Agentic Institutions: Mandates, Capabilities, Constraints, and Escalation for Machine Economic Actors" \
  --metadata author="Nikola Stojanow" \
  --metadata keywords="delegated cognition, agentic institutions, hub-and-worker, context admission, provenance audit, rent-or-buy" \
  --metadata date="October 17, 2026 (v1.10.1, tag v1.10.1)" -o DRAFT.tex
LC_ALL=en_US.UTF-8 bash ../scripts/check_table1.sh ../DRAFT.md
python3 -I ../experiments/ab-2026-10/ab_stats.py | cmp - ../experiments/ab-2026-10/RESULTS.md
python3 -I ../experiments/ab-2026-10/ab_counterfactual.py | cmp - ../experiments/ab-2026-10/COUNTERFACTUAL.md
python3 -I ../scripts/check_ab.py ../DRAFT.md
python3 postprocess.py DRAFT.tex paper.tex
tectonic paper.tex 2>&1 | tee build.log
# fifth check (v1.10.1): an overfull box means a table or line runs past the margin; the v1.10 checker table did and the build said OK
if grep -q "Overfull" build.log; then echo "FAIL: overfull box in build.log"; exit 1; fi
echo "OK: $(pdfinfo paper.pdf | grep Pages)"
