# Agentic Institutions: Mandates, Capabilities, Constraints, and Escalation for Machine Economic Actors

Companion repository for the paper by Nikola Stojanow (v1.5, October 13, 2026).

The paper studies institutions for AI agents: a cost model for delegated cognition
and the mandate / capability-registry / constraints / escalation anatomy it
rationalises, grounded in a live hub-and-worker measurement. One orchestrating hub model
delegated artifact drafting to free-tier worker models, verified every delivery
against machine-checkable acceptance needles, and logged the whole run. The
paper's economics (admission ratio alpha, cost asymmetry, breakeven thresholds)
are computed from the instruments in this repository.

## What is in here

| Path | What it is |
|---|---|
| `DRAFT.md` | Full paper source (Markdown), v1.5 |
| `latex/` | Pandoc + tectonic build pipeline (`build.sh`), figure source (`figure.tex`), built `paper.pdf` (14 pp) |
| `RESULTS.md` | Measured results as recorded during the run: Table 1 (delegation waves), findings F1-F5. The paper's Table 1 and Appendix A derive from it |
| `instrument/hf_dispatch.sh` | The dispatch script: one-shot worker call with budget alarm, acceptance-needle gate, per-attempt TSV logging |
| `instrument/hf_stats.tsv` | The instrument table: all 26 dispatch attempts, one row per attempt (the paper's frozen snapshot is the first 16 rows; rows 17-26 are review-round dispatches, two of them TIMEOUT) |
| `instrument/hf_paper_stats.py` | Regenerates the paper's derived stats from the TSV |
| `data/t_freeze_2026-10-09T0416.csv` | Frozen message-id archive: the 343 qualifying assistant turns behind the paper's T figure (SHA-256 receipt in Section III.3) |
| `scripts/verify_t.sh` | Recounts the frozen archive against the stored hash; run it |
| `INCIDENT_LOG.md` | INC-001 through INC-006 and the INC-004 addendum (paper Appendix B) |
| `REVISION_LOG.md` | Every reviewer finding and its disposition across five review rounds |
| `reviews/` | Full reviewer transcripts: three personas (methods, econ, multi-agent systems), five rounds, from 4/10 scores to 8/8/8 |
| `sections/` | Section-level source files and the assembly log |
| `figure/stack.svg` | The v1.4.6 ASCII-era figure, superseded by `latex/figure.tex` |
| `NUMBER_SNAPSHOT.json`, `stats_live.md`, `prior_art_trawl.md`, `novelty_strike.md`, `part3_math.md` | Frozen numbers snapshot, live stats readout, prior-art trawl, novelty audit, math part source |

## Reproducing the headline numbers

```bash
# 1. Verify the frozen T archive (row count + SHA-256)
bash scripts/verify_t.sh

# 2. Regenerate paper stats from the instrument table
python3 instrument/hf_paper_stats.py

# 3. Rebuild the PDF (requires pandoc, tectonic, python3)
cd latex && ./build.sh
```

Key measured quantities (all from `instrument/hf_stats.tsv` + hub log, see
`RESULTS.md` for provenance): first-try needle acceptance 14/14 (Clopper-Pearson
95% CI [0.77, 1.00]); pooled admission ratio alpha = 0.137 across 4 waves /
12 dispatches; hub:worker traffic asymmetry 2x (185x against deliverable
artifacts); T = 343 frozen assistant turns, clearing every breakeven threshold.

## Provenance note

Per-wave produced-char figures are hub-audited at wave level; the instrument's
per-dispatch `chars` column logs first-pass dispatch output (artifacts grew at
weave time). Table 1 dual-sources the Wave-1 row (22,824 hub-audited; TSV
2,835 instrument-logged) and the provenance note in `RESULTS.md` details every
divergence. Per-dispatch artifact/admitted auto-logging began 2026-10-08; the
frozen waves are not per-dispatch TSV-recomputable, and the paper says so.

## License

Code and instruments: MIT. Paper text and figures: CC BY 4.0.
