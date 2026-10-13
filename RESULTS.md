# RESULTS, measured 2026-10-07 (single hub, one day of operation). F1/F4 corrected v1.3 after round-2 review; Table 1/F2/F3 frozen v1.1. RESULTS is revision-controlled from v1.4 (paper dir under git; commit 4f7b8e8 carries the F2 wave label + F1 provenance note).

All numbers from `~/.hermes/state.db` + `hf_stats.tsv`. [M] = measured,
[B] = bounded estimate, stated method inline.

## Table 1, Delegation waves [M]

| Wave | N | produced (chars) | admitted | α | wall |
|---|---|---|---|---|---|
| Drafting (outline+related) | 2 | 22,824 (TSV: 2,835) | 3,853 | 0.17 | 80s |
| Intro+citations | 2 | 23,440 | 4,447 | 0.19 | 133s |
| Novelty trawl+strike | 2 | 50,567 | 7,000 | 0.14 | 969s |
| N=6 body sections | 6 | 40,447 | ~3,500 | ~0.09 | 419s |
| **Total (4 waves, 12 dispatches)** | **12** | **137,278** | **18,800** | **0.137** | 1,601s |

**F1 [M], α is stable at ~1/6.** Three independent task classes land in
α ∈ [0.14, 0.19]. The admission ratio is not tuning noise; it behaves like a
stable hub policy parameter of needle-based verification (v1.2: 'structural constant'
retired after external review, four waves, 2.1× range), and 1/α spans 5.3–11.1× across all four waves (5.9–7.1× within these three classes), matching Part III's parameter.

   *PROVENANCE (v1.4, per INC-004 doctrine): of the per-wave produced-char sums,
   only wave 3's matches hf_stats.tsv exactly (50,567); waves 1/2/4 diverge
   (22,824 vs 2,835; 23,440 vs 20,692; 40,447 vs 40,441) because TSV `chars`
   logs first-pass dispatch output while several artifacts grew at weave time.
   No admitted-char values are instrument-logged for waves 1–4 (per-dispatch
   artifact/admitted logging began 2026-10-08); α is hub-audited at wave level
   and is NOT per-dispatch TSV-recomputable for the frozen waves. Hub-side
   figures derive from ~/.hermes/state.db, session 20260725_131848_6f3bc9c8.*

**F2 [M], p-hat = 1.00 (7/7 first-try needle accepts).** Acceptance needles (opening calibration run; cumulative frozen rate 14/14, see §III.6)
+ structure counts accepted every dispatch, including 27- and 70-tool-call
research sweeps. n small; instrument now accumulates continuously (§III.6).

**F3 [M], the hub's own log is the cost law made visible.** Lifetime hub
session (since 2026-07-25, multiple compactions): **17.39 MB, 27,775 messages -
75.6% raw tool output**. Worker side, two honest denominators (regenerable via
`hf_paper_stats.py`): worker *session traffic* 7.60 MB → hub:worker = **2×**;
worker *deliverable artifacts* (final output per session) 94.2 KB →
hub:artifact = **185×**. The persistent hub pays every char repeatedly; workers
pay once. [Correction 2026-10-07: an earlier draft cited 75× with a
non-reproducible denominator, replaced by these computed figures. Corrected by
the instrument itself on first run.] The premise of the dominance
inequality, persistent, compounding hub-side traffic vs one-shot worker cost -
is not an assumption; it is the institution's own bookkeeping. Each compaction
event is a visible re-payment of the accumulated tail.

**F4 [M], duration scales with internal tool-use, not output size.** 2-msg
drafts: 24–43s. 18-msg citation sweep: 109s. Research sweeps: 479–525s at
70/27 msgs. Pooled over 16 dispatches, duration correlates with both output chars (r=0.89) and message count (r=0.86); within the deepseek-only subsample output chars dominates (0.91 vs 0.82). The v1.1 claim that message count was the predictor is superseded (round-2 review, reviewer A); free workers spend
their (zero-cost) budget on verification tool calls, mirroring the paper's
claim that verification is where cognition's work migrates.

**F5 [B], inline counterfactual for the audit alone ≈ 3–4× the admitted
traffic.** Method: 35 hub turns × 554-char mean substantive message ≈ 19.4K
hub chars vs 7K admitted; but inline turns carry FULL tool transcripts (the
75.6% pattern), so 19.4K is a floor; plausible inline ≈ 30–60K. Delegation
saves even in the bounded reading, dominates in the realistic one.

## What we can already show a reader
1. A live institution, run by one human + free workers, produced a 37K-char
   verified paper draft + a two-sweep novelty audit in one day. [M]
2. Its pooled admission ratio was 0.137 (1/α ≈ 7.3) across all 12 then-measured dispatches. [M]
3. Its own 17MB hub log demonstrates the re-payment mechanism the math
   formalizes. [M]
4. First-try acceptance via machine-checkable needles: 7/7. [M, small n]

## Update (Step 2, N=6 wave) [M]
- 6/6 needle accepts, 626-1,211 words each, 22 CITE placeholders, 5 workers
  finished in 24-26s (2-msg drafts); s4 took 163s/20 msgs (self-extended scope,
  see INC-001). p-hat now 13/13 = 1.00. Admitted ratio fell to ~0.09.
- **INC-001: first observed mandate drift** - a worker satisfied its needle while
  exceeding scope (unauthorized DRAFT.md insert, variant needle signature).
  Contained in 1 hub pass. Live demonstration of why the paper's acceptance +
  escalation anatomy is NECESSARY, not decorative. Logged in INCIDENT_LOG.md.
- Concurrency: 6 workers sharing one stats TSV - zero corruption, 5 appends
  within 2s. Free lane held under contention.
