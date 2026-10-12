# REVIEW ROUND 3, REVIEWER A (Empirical Methods), HOSTILE RE-REVIEW of v1.3

**Manuscript:** DRAFT.md v1.3 (2026-10-08, 76,968 chars) + REVISION_LOG.md, NUMBER_SNAPSHOT.json, RESULTS.md, INCIDENT_LOG.md, part3_math.md, `~/.hermes/scripts/hf_stats.tsv` (16 rows), `hf_paper_stats.py`, `~/.hermes/state.db`.
**Role:** unchanged, hostile senior empirical-methods reviewer. Rounds 1-2 scored 4 and 5. The hub claims every round-2 finding is now fixed. Prove otherwise if you can.
**Confidence:** 5/5, every number below re-derived in this session from the raw TSV, state.db, and the instrument source. Nothing taken from REVISION_LOG on faith.

**Recommendation: MINOR REVISE.** **Score: 6 / 10.**
The round-2 *mechanical* blockers (B3/stale table, "All BLOCKERs resolved" overclaim, IV.5 κ-term) are genuinely resolved in the manuscript, and the mathematics now reproduces. But the one substantive methods finding I have now flagged **twice**, that regime (2)'s T is asserted rather than measured, survives verbatim under an unchanged "all measured or bounded" banner, and the revision answered it by inserting a specific number ("296 further assistant turns") that **does not reproduce from state.db** under any natural counting. That is a regrowth of the exact defect class I flagged (R2-3), now wearing a precise unreproducible figure. One new arithmetic error sits inside the newly-corrected table itself (T=40 parenthetical, §III.3).

---

## T1, DISPOSITION OF MY ROUND-2 FINDINGS

Severity tags = my round-2 tags. Verdict = FIXED / PARTIAL / NOT-FIXED in v1.3, one verbatim v1.3 quote each.

### R2-1 (BLOCKER, mechanical), stale breakeven table + garbled "57/15/…", **FIXED**
The corrected table is now in DRAFT §III.3, and every cell re-derives correctly from (★) at α=0.17 (see T2a). `grep -F '57/15'` and `'T ≈ 61'` → 0 hits.
V1.3 verbatim (L181): `p = 0.3: T > 59.2 / 79.3 / 119.5 for w/h = 15/20/30 (min integer T ≥ 60/80/120)`
V1.3 verbatim (L183): `p = 0.7: T > 24.8 / 33.4 / 50.6 for w/h = 15/20/30 (min integer T ≥ 25/34/51)`

### R2-2 (MAJOR), "All BLOCKER findings are resolved" overclaim, **FIXED**
The provenance note and §IX.b now state the true disposition chain.
V1.3 verbatim (L40): `Round-1 BLOCKER findings are dispositioned in this revision (the second review then found the breakeven repair had not reached the manuscript, fixed in v1.3)`
V1.3 verbatim (L423-424): `breakeven table recomputed and propagated into §III.3 (v1.3, the v1.2 pass had fixed the side file only)`

### R2-3 (MAJOR), T unmeasured under "all measured or bounded", **NOT-FIXED** (and worsened)
The banner I explicitly required to change is verbatim unchanged, and the revision answered the measurement demand with a number that fails provenance-or-silence. I re-derived from state.db (hub session 20260725_131848_6f3bc9c8): hub **assistant turns on all of 2026-10-07 = 267**; **after the first worker artifact that day = 164**; after first artifact to present = 342. **None of these is 296.** There is no in-DRAFT query definition, log pointer, or distribution for "296". The very sentence I required to be demoted still asserts measurement.
V1.3 verbatim (L174): `Three regimes, all measured or bounded:`
V1.3 verbatim (L186-187): `the hub logged 296 further assistant turns after the first artifact wave (2026-10-07), clearing every threshold`
The one-line fix I prescribed in round 2 (banner → "measured, bounded, or asserted (T)", plus the turns-after-artifact query **as a reproducible query in the manuscript**) was not delivered; instead a bare, unreproducible constant took the place of the old bare "40–80 turns" (now gone from DRAFT, 0 hits, but still live in part3_math.md L57, itself a cross-document drift artifact).

### R2-4 (MINOR→MAJOR), IV.5 escalation κ-term not derived, **FIXED**
The exact term and its status are now stated without the false derivation.
V1.3 verbatim (L279): `(w/h) < p·(1+T)·(1−α) − heuristic κ-form (the exact marginal from (★) is ε(1−p)/S; the κ-form is a first-pass overlay, not an inequality)`
Clean fix via option (b) of my round-2 required item 4.

### R2-5 (MINOR), surviving chrome (four enumerated items), **FIXED** (for the enumerated set; residual elsewhere)
`INTRO-OK` → 0 hits; `RELATED-WORK-OK` → 0 hits; the line-48 A2A resolver fragment is gone; `plain text draft`/`~900 words` → 0 hits.
V1.3 verbatim (L50): `Google's A2A protocol [A2A] standardizes how agentic services discover and transact with one another.`
Residual (NEW, MINOR): two acceptance-needle signatures still ship, `PAPER-OUTLINE-OK` (L522, Appendix A) and `CITATIONS-RESOLVED-OK` (L581, Appendix B, printed immediately after the bracketed note `*(resolver tail chrome stripped in v1.2)*`, the literal string remains despite the claim). Both live in explicitly-frozen/verbatim appendices, so downgraded; but the paper's own IV.4 says a needle signature in the shipped manuscript constitutes a calibration event, so leaving the strings in is self-consistent stagecraft that should be cleaned.

### R2-6 (MINOR), RESULTS.md not revision-controlled, **PARTIAL**
Header now stamps corrected-vs-frozen; F4 is corrected and I re-derived it **exactly** from the raw TSV (pooled r(dur,chars)=0.894, r(dur,msgs)=0.858 → "0.89/0.86"; deepseek-only 0.909/0.816 → "0.91/0.82", all four match F4 v1.3, and the "message count was the predictor" v1.1 claim is explicitly superseded).
V1.3 verbatim (RESULTS L1): `F1/F4 corrected v1.3 after round-2 review; Table 1/F2/F3 frozen v1.1.`
Residual: RESULTS F2 still prints the bare `7/7 first-try needle accepts` (L21-24) with **no in-document wave-1 label**, contradicting the abstract's 14/14, the wave-labeling REVISION_LOG ④ claims ("7/7 wave-1; 14/14 frozen; 16 live") is not actually present in RESULTS.md; it lives only in the log. And Table 1's total row still reads "12 dispatches" against 14 pre-freeze TSV rows.

---

## T2, RE-DERIVATION FROM RAW FILES (never from the paper's claims)

**(a) Breakeven T at α=0.17, T=(w/h)/(p·(1−α))−1. All seven cells correct.** DRAFT §III.3 L181-183: p=0.3 → 15: 15/(0.3·0.83)−1 = **59.24** ✓ (paper 59.2); 20 → 79.32 ✓ (79.3); 30 → 119.48 ✓ (119.5). p=0.5 → 15: **35.14** ✓ (35.1). p=0.7 → 15: 24.82 ✓ (24.8); 20: 33.42 ✓ (33.4); 30: 50.63 ✓ (50.6). The "min integer T ≥" ceilings (60/80/120; 36; 25/34/51) are all strict-inequality-correct. The propagation failure of v1.2 is cured.

**(b) CP bound 0.025^(1/14).** ln(0.025)/14 = −0.26349 → e^−0.26349 = **0.7684** → lower bound [0.768, 1.000]. The abstract's "Clopper–Pearson 95% CI of [0.77, 1.00] at n=14" (L25) is correct. ✓ 1/14 = 0.768.

**(c) Median duration from hf_stats.tsv.** n=14 pre-freeze rows, dur = {37,43,24,109,479,525,7,24,25,25,25,26,163,234}. Sorted, even-n median = (26+37)/2 = **31.5 s**, range 7–525. ✓ matches snapshot, §III.6 (L240), and NUMBER_SNAPSHOT.json. (All-16 median would be 29.0; not cited, which is fine.)

**(d) Per-wave alpha from TSV raw vs admitted.** PARTIAL, the ranges hold only as hub-audited arithmetic, not as TSV-derived quantities. The four alphas reconcile internally against RESULTS Table 1's own produced/admitted columns: 3853/22824=0.169, 4447/23440=0.190, 7000/50567=0.138, 3500/40447=0.087; pooled 18800/137278=0.137. **But those produced/admitted values are not in the TSV.** The TSV's only char measure for the two drafting rows (outline+related) sums to **2,835**, not the S=22,824 the paper calls "artifact produced"; the round-1 **8.1× denominator gap persists**, now declared (provenance note L41-43: "admitted characters are hub-audited per wave") rather than closed. So the paper's [0.09,0.19] α-range and the 1/α=[5.3,11.1] multiplier hold internally but are **not reproducible from the raw instrument**, exactly B4's declared remainder, unchanged. On the endpoint convention I half-claimed in round 2, v1.3 does fix it: DRAFT L199 now states `endpoints use wave-rounded α = 0.19/0.09, exact min α = 0.087 gives 11.5` (1/0.087=11.49≈11.5 ✓). That residual is closed.

---

## T3, REGRESSION HUNT (grep DRAFT.md)

| term | hits | disposition |
|---|---|---|
| 75× / 75x | 0 | CLEAN |
| T ≈ 61 (≈, ~, no-space variants) | 0 | CLEAN |
| 57/15 | 0 | CLEAN |
| failure probability | 0 | CLEAN |
| 147 briefs (exact phrase) | 0 | CLEAN (see below) |
| four concurrent / 4 concurrent | 0 | CLEAN |
| 30-second windows / 30 second | 0 | CLEAN |
| INTRO-OK | 0 | CLEAN |
| RELATED-WORK-OK | 0 | CLEAN |
| v1.1 COMPLETE | 0 | CLEAN |
| cost-optimal control law | 0 | CLEAN |

The only hits in the entire hunt are the **intentional, correctly-disposed INC-004 withdrawal references** at L266-271, `a 147-brief, 24-hour, four-concurrent-worker scenario. No such run exists` / `16 serial dispatches, 16/16 first-try needle accepts, zero retries`. These are the honest record replacing the fiction, and the gate's absence-checks are real (all fabricated strings absent except inside that withdrawal note). **No regression found.** Genuinely clean on this axis.

---

## T4, FABRICATION HUNT (3 quantitative claims in §IV, traced to instrument)

The hub's blessed outcome already passes on the headline: the INC-004 "147-briefs" fiction is absent except in the honest withdrawal note, and the "withdrawal note" is itself the strongest governance datum in the whole corpus.

1. **"A 7/7 hit rate in the wave-1 calibration run (all seven briefs accepted; the cumulative frozen rate is 14/14, §III.6)"** (IV.4, L265). Trace: the first 7 TSV rows all carry verdict OK ⇒ 7/7 ✓; first 14 rows all OK ⇒ 14/14 ✓. **Provenanced.** (Micro-nit: TSV row 7 is `hf_probe2.txt`, a *connectivity probe*, not a brief, "all seven *briefs*" is loose for 6 briefs + 1 probe; the arithmetic itself holds.)

2. **"The instrument's actual record: 16 serial dispatches, 16/16 first-try needle accepts, zero retries"** (IV.4, L269). Trace: the TSV has exactly **16 rows, all OK, zero retry rows** ✓. **Provenanced.** (The preceding clause, "no acceptance windows or deadline alarms implemented at all", is confirmed: grep shows the window/deadline machinery exists only as "specified but not yet implemented" on L265, never implemented.)

3. **"the hub logged 296 further assistant turns after the first artifact wave"** (§III.3 L186; intro L72). **FLAG, NO REPRODUCIBLE PROVENANCE.** This is the one number in the empirical core (outside the declared hub-audited α channel) I cannot trace. From state.db: 267 hub assistant turns on all of 2026-10-07; 164 after the first worker artifact that day; 342 after first artifact to the present. **296 matches none of these under any natural counting, and no query, log pointer, or counting rule is given in the manuscript.** It replaces the round-2-flagged unprovenanced "40–80 turns routinely" (now deleted from DRAFT but still live in part3_math.md L57) with a *different* unprovenanced constant. Under provenance-or-silence this must be flagged: **either publish the query that yields 296, or drop the specific figure.** (I state this as unreproduced-by-accessible-definition, not as proved fiction, I could not falsify every possible counting convention, but the burden is on the manuscript and none is offered.)

Verification of the model denominators themselves (22,824 / 3,853, out of TSV reach) belongs to B4's already-declared hub-audit channel, not a new fabrication.

---

## VERDICT

**Score: 6 / 10.** Rounds: 4 → 5 → 6.

| Dimension | R2 | R3 | Note |
|---|---|---|---|
| Novelty of synthesis | 7 | 7 | unchanged |
| Formal model | 6 | 7 | IV.5 κ-term honestly scoped; breakeven correct; T=40 note err (below); regime-3/K still unhandled |
| Empirical support | 4 | 5 | CI/median/breakeven/F4 all reproduce; per-wave α still hub-audited (8.1× gap); T=296 unreproduced |
| Internal consistency | 4 | 6 | overclaim/abstract/stale-table fixed; T=40 err; 185×vs186×; F2 7/7 unlabeled |
| Instrument quality | 5 | 5 | schema v2, artifact_s 2/16, negative control *queued* but 0 adjudicated rows, no stored predicate/row |
| Reflexive method | 7 | 8 | INC-004 self-disclosure is the strongest datum in the corpus |
| Scholarship | 7 | 7 | unchanged |
| Clarity | 6 | 7 | better abstract/p-semantics; provenance note still slightly tangled |
| **Overall** | **5** | **6** | |

**Remaining issues (≤3, severity-tagged):**

1. **MAJOR, T remains asserted, now under an unreproducible specific figure.** The banner "Three regimes, all measured or bounded" (L174) is verbatim the sentence I twice flagged; "296 further assistant turns" (L186, L72) does not reproduce from state.db (my counts: 164/267/342, never 296) and carries no in-DRAFT query or log pointer. Publish the reproducible query or delete the figure and restore the "asserted (T)" honesty. This is the one methods defect that has survived all three rounds in substance.

2. **MINOR, §III.3's T=40 parenthetical is arithmetically wrong on both counts.** L184: `a T=40 session keeps only the p=0.7 rows alive`. At T=40 the p=0.5/w-h=15 row has breakeven **35.1 < 40, so it is alive**, and the p=0.7/w-h=30 row has breakeven 50.6 > 40, so it is **not** alive. The alive set at T=40 is {p=0.5@15, p=0.7@15, p=0.7@20}, the sentence misstates it twice. New defect inside the newly-corrected table; one-line fix.

3. **MINOR, declared-provenance residue, three small items.** (a) per-dispatch α still not TSV-recomputable (TSV chars ≈ 8.1× artifact-admitted denominator; alpha remains hub-audited by admission, fine to keep, but say it plainly next to every α, not only in the provenance note); (b) across-document number drift survives at the margins, hub:artifact is **185×** in the manuscript (abstract, RESULTS F3) but **186×** in stats_live.md (17,512,702/94,206 = 185.90), and part3_math.md still carries the deleted "40–80 turns" sentence; (c) RESULTS F2 "+7/7+" is not wave-labeled in-document.

**On the hub's claim "every round-2 finding is now fixed":** largely true for the mechanical set (R2-1, R2-2, R2-4, R2-5, and the endpoint half of B4 are genuinely fixed, and I confirm the fixes from raw files). It is **false for R2-3**, which is the one finding with real methodological weight and it is NOT-FIXED, the revision answered a measurement demand with an unreproducible constant. Because the rest of the round-2 list is closed and the mathematics now reproduces, this is MINOR REVISE, not MAJOR, but the MAJOR tag on item 1 is non-negotiable, and it is the third consecutive round in which the same single measurement claim has been carried forward unverified.

*All re-derivations reproducible this session from `hf_stats.tsv` (16 rows), `hf_paper_stats.py`, `~/.hermes/state.db`, and `part3_math.md`, as of 2026-10-08., REVIEWER A, round 3.*

REVIEW3-A-OK
