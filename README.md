# Agentic Institutions: Mandates, Capabilities, Constraints, and Escalation for Machine Economic Actors

Companion repository for the paper by Nikola Stojanow (v1.7, October 13, 2026).

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
| `DRAFT.md` | Full paper source (Markdown), v1.7 |
| `latex/` | Pandoc + tectonic build pipeline (`build.sh`), figure source (`figure.tex`), built `paper.pdf` (20 pp) |
| `RESULTS.md` | Measured results as recorded during the run (v1.4.6), superseded by the paper's Table 1 and Appendix A; kept for provenance with a banner |
| `instrument/hf_dispatch.sh` | Dispatch script v2.1 (2026-10-13): cuts the CLI's brief echo and exit summary before the gate, row written after the gate, verdict OK/NEEDLE-MISS/TIMEOUT/ERROR plus numeric rc, needle position, UTC stamps, per-dispatch output files, portable lock, b and o bytes. Writes `hf_stats_v2.tsv`. Tested against `instrument/test/fixture_q_path.txt` (`instrument/test/test_gate.sh`); not yet run against a live worker |
| `instrument/hf_dispatch_v1_as_run.sh` | The v1 script exactly as it ran for all 26 rows of `hf_stats.tsv`. Its verdict column records exit status only; the needle outcome was not logged |
| `instrument/hf_admit.sh` | Records the hub's admitted character count against a v2 row after adjudication |
| `instrument/hf_stats.tsv` | The v1 instrument table, frozen: 26 attempts, one row per attempt. The paper's snapshot is the first 16 rows (13 briefs, 3 probes), all exit-zero; rows 17-26 are review-round dispatches, two of them TIMEOUT. `verdict` = exit status; `admitted_s` is empty in every row |
| `instrument/hf_paper_stats.py` | Regenerates TSV-derived stats from the repo copy by default (`python3 instrument/hf_paper_stats.py [TSV [DB [OUT]]]`); the store-derived figures (Appendix A F3) need the hub's private `state.db` and are skipped without it |
| `reviews/citation_check_2026-10-13.md` | Citation verification transcript for the 34 references |
| `scripts/check_table1.sh` | Recomputes every instrument-derived Table 1 cell from the instrument table and fails the PDF build if DRAFT.md disagrees (added after INC-007; invoked by `latex/build.sh`) |
| `data/t_freeze_2026-10-09T0416.csv` | Frozen message-id archive: the 343 archived rows behind the paper's T figure, 221 of them distinct turns (SHA-256 receipt in paper §3.3) |
| `scripts/verify_t.sh` | Recounts the frozen archive (343 raw rows) against the stored hash; run it |
| `scripts/dedup_t.sh` | Removes the 122 compaction-rewrite rows (four single-second bursts) and prints the 221 distinct turns the paper uses |
| `INCIDENT_LOG.md` | INC-001 through INC-006 and the INC-004 addendum (paper Appendix B) |
| `REVISION_LOG.md` | Every reviewer finding and its disposition across five review rounds |
| `reviews/` | Full transcripts of the five rounds of hub-dispatched LLM reviewer agents (three personas; rounds 3-5 ran on the same DeepSeek worker as the drafting). Not peer review; the scores inside are uncalibrated self-reports |
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

Key measured quantities (from `instrument/hf_stats.tsv`, the frozen archive, and the
hub log; see `NUMBER_SNAPSHOT.json` supplement_v1_6): 16/16 exit-zero completions
at the frozen 16-row snapshot (the v1 verdict column records exit status, not the
needle outcome; needle status is hub-attested at 12/13 briefs and mandate-compliant
first-try acceptance is at most 11/13 given INC-001 and INC-004); hub-audited
admission fraction alpha in [0.09, 0.19] across 4 drafting waves, 0.137 pooled, with
no admitted count instrument-logged; hub:worker traffic asymmetry 2.3x (185x against
deliverable artifacts), from the private hub store; T = 343 raw archived rows of
which 221 are distinct turns (122 are compaction rewrites; `scripts/dedup_t.sh`),
both clearing every breakeven horizon in the paper's grid.

## Provenance note

Per-wave produced-char figures are hub-audited at wave level; the instrument's
per-dispatch `chars` column logs first-pass dispatch output (artifacts grew at
weave time). Table 1 dual-sources the Wave-1 row (22,824 hub-audited; TSV
2,835 instrument-logged) and the provenance note in `RESULTS.md` details every
divergence. Per-dispatch artifact/admitted auto-logging began 2026-10-08; the
frozen waves are not per-dispatch TSV-recomputable, and the paper says so.

## License

Code and instruments: MIT. Paper text and figures: CC BY 4.0.
