# HOSTILE RE-REVIEW ROUND 3, REVIEWER C (Multi-Agent Systems / Agent-Governance)

**Paper:** *Agentic Institutions* (Draft v1.3, 2026-10-08)
**Reviewer role:** unchanged from rounds 1–2, MAS / multi-agent-systems researcher
(mandates, escalation, institutional design); hostile on novelty positioning and
systems-credibility; instructed this round to prove the round-2 fixes false if I can.
**Materials reviewed (full):** DRAFT.md v1.3 (77K, all 596 lines), my own
reviews/reviewer_C_mas_r2.md, REVISION_LOG.md, INCIDENT_LOG.md (INC-001..004),
NUMBER_SNAPSHOT.json, part3_math.md, RESULTS.md, `~/.hermes/scripts/hf_stats.tsv`
(18 rows).

**Verification method:** every round-2 finding re-checked against v1.3 text with
grep-confirmed line evidence; breakeven surface, CP bound, median, and per-wave
admission ratios re-derived from the raw TSV and part3_math (I did not re-run
hf_dispatch.sh, read-only review); regression + fabrication hunts run against the
manuscript and instrument. I never trusted the paper's claims about itself.

---
## 0. Headline

I came into this round expecting, per my own round-2 §1, to catch N1/N2 still live,
the two named-false F3 sentences surviving, and the cost-optimal overclaim intact in
all four locations. **I cannot.** Every substantive round-2 finding is fixed in the
actual manuscript bytes: the corrected breakeven table is propagated into §III.3
with correct ceilings; the abstract now says *acceptance* probability; both false
sentences are gone, one replaced verbatim by the fix I proposed; and the four
"cost-optimal control law / re-derived anatomy" sentences are demoted to
"cost-rationalized / derived-in-part / rationalized by (★); a full optimality
derivation is future work." The regression list is clean. This is a genuine revision,
not a silencing.

What remains is a thinner class of defect, and I name it honestly: (a) one surviving
derivation-level overclaim, relocated to the IV.5 escalation ladder, the paper's own
§VIII C5 directive ("never claim the anatomy") violated one more time, on a mechanism
the paper itself admits never fired; and (b) a provenance opacity on the headline
α table that my round 2 accepted and I now rescind part of: RESULTS.md Table 1's
per-wave produced-char sums do NOT re-derive from the instrument's `chars` column for
waves 1, 2, and 4, and no admitted-char value has per-dispatch TSV provenance at all.
Neither is fabrication (both are disclosed as hub-audited), but a paper whose warrant
is "every number traceable to the instrument" still owes the reader a cross-walk.

**Round 3 verdict: 8/10, MINOR-REVISE.** All blockers cleared; two MAJORs and one
bundled MINOR remain, all fixable in under an hour.

---
## 1. T1, Dispositions of my round-2 findings (each with verbatim v1.3 evidence)

Round-2 scorecard (F1–F6, the standing §3 attack, N1–N6):

| Finding (r2) | Verdict in v1.3 | Verbatim evidence (DRAFT.md line) |
|---|---|---|
| **N1** (BLOCKER) breakeven table never reached §III.3; stale "T ≈ 61", "57/15" live | **FIXED** | L181–184: "p = 0.3: T > 59.2 / 79.3 / 119.5 for w/h = 15/20/30 (min integer T ≥ 60/80/120)  p = 0.5: w/h = 15 breaks even at T > 35.1 (min integer T ≥ 36)  p = 0.7: T > 24.8 / 33.4 / 50.6 for w/h = 15/20/30 (min integer T ≥ 25/34/51)". Greps `T ≈ 61` = 0, `57/15` = 0, `T ≥ 79` = present-correct. Caveat: part3_math.md (the side file) still retains its own superseded regime-3 "1/α ≈ 5.9" line (L67), see T4, minor. |
| **N2** (MAJOR) abstract defined p as *failure* probability | **FIXED** | Abstract L9: "where p is per-dispatch acceptance probability"; grep `failure probability` = 0. Body III.2 L160 "p = single-attempt acceptance probability" now consistent. |
| **§3** (round-1 standing attack) "cost-optimal control law / re-derived anatomy" ×4 (abstract, §I, III.4, IV.2) | **FIXED (4/4 named sites); ONE RESIDUAL** | Abstract L16 "rationalized by (★), §III.4; a full optimality derivation is future work"; §I L64 "derived-in-part from first principles"; III.4 L221 "derived-in-part here as the cost-rationalized policy"; IV.2 L257 "cost-rationalized discipline … (prescribed by (★)'s cost structure)". grep `cost-optimal control law` = 0. **RESIDUAL:** IV.5 L279 asserts "This ladder, retry → partial read → brief rewrite → human, is not a suggestion; it is the institution's cost-optimal path given verification-bandwidth constraints", derivation-class claim on a mechanism IV.6 admits never fired. See Issues #1. |
| **F1** (BLOCKER) self-audit / novelty positioning | **FIXED (core), residuals cleared to MINOR** | II.7 lead "Attention Tax / Handoff Tax (arXiv:2610.06069) … our (★) is the machine-institution analogue" (L117–120); VIII C4a row carries the honest delta (L351). |
| **F2** (MAJOR) formula contradiction / 75× | **FIXED** | grep `75×`/`75x` = 0. (★) unified in abstract/intro/III.3; IV.5 ε-term unit-normalized with "the κ-form is a first-pass overlay, not an inequality" (L279). |
| **F3** (MAJOR) two named-false sentences | **FIXED** | IV.3 L261 now: "This is the role our implementation sketches: routing across minimax/deepseek was hand-configured, not registry-computed." grep `precisely the mechanism` = 0, `already paid` = 0. Part V L298 rewritten as forward proposal. |
| **F3 residual 1** "Mandate marketplaces exist in prototype" uncited | **NOT FIXED (MINOR)** | Part V L301: "Mandate marketplaces exist in prototype (agent dispatch systems with brief auctions)." Still no citation. |
| **F3 residual 2** no as-implemented-vs-as-specified table | **PARTIAL (deferred, now declared)** | L592: "v2 = negative-control briefs, measured p/T distributions, T instrumentation, as-implemented table." Declared v2 scope rather than silently absent, honest, but still not delivered. |
| **F4** (MINOR) manuscript hygiene | **FIXED (core), residuals below MINOR** | grep `INTRO-OK` = 0, `RELATED-WORK-OK` = 0, `insurerunderwrites` = 0 (now "the insurer underwrites" L299), `Anthropic's A2A` = 0 (L50 "Google's A2A protocol [A2A]"; L86 "A2A (Agent2Agent, by Google)"). Dangling body `[, arXiv:2610.01756]` gone (only legitimate registry IDs at L546/573/574). |
| **F4 residual** §VII REFERENCES empty; refs live in VII.a after Appendix B | **NOT FIXED (MINOR)** | L327–332 is a 3-line prose stub; the actual reference list is at L553+ *after* Appendix B. Document order still broken across three rounds. |
| **F5** (MINOR) INC-002 absent from body | **FIXED** | IV.6 L289 "the one unbounded edit on record (INC-002) was committed by the hub itself"; §IX L391 "its incidents (INC-001..003)". |
| **F6** (MINOR) α's status | **FIXED** | Abstract L25 "α and p are bounded first-pass estimates with an accumulating instrument, not measured constants"; III.3(3) L199 "1/α ∈ [5.3, 11.1] across measured waves (≈6× at the central α ≈ 0.17 … exact min α = 0.087 gives 11.5)". 1/0.087 = 11.49 ✓. |
| **N3** (MINOR) n drift 7/14/16 | **FIXED** | IV.4 L265 "A 7/7 hit rate in the wave-1 calibration run … the cumulative frozen rate is 14/14, §III.6"; §IX L395 "n=16 dispatches at v1.3 revision time (14 at the v1.2 freeze …)". Wave-labeled and reconciled. |
| **N4** (MINOR) Related Work seams (II.3 collision; "seven subsystems") | **FIXED** | L114 "### II.7 … (numbered after §II's six buckets)"; L109 "six necessary subsystems". Both corrected. |
| **N5** (MINOR) stale self-description (v1.1 COMPLETE) | **FIXED** | NEXT STEPS L583–592 rewritten for v1.1/v1.2/v1.3; grep `v1.1 COMPLETE` = 0. §VIII L356 re-labeled "(issued for v1.1; implementation status tracked in REVISION_LOG.md)". |
| **N6** (RESIDUAL) 185× denominator caveat | **PARTIAL** | Abstract L21–22 still prints "a 2× hub:worker traffic asymmetry (185× against deliverable artifacts)" with no denominator-window caveat; the caveat lives only in RESULTS F3 (L26–31). Documented, not in the abstract. |

**Scorecard net:** 13 FIXED / 2 PARTIAL-but-honest (F3-as-implemented-table, N6) /
2 MINOR NOT-FIXED (uncited "mandate marketplaces", empty §VII) / 1 §3 RESIDUAL (IV.5).

---
## 2. T2, Re-derivations from raw files (trust nothing)

(a) **Breakeven T at α = 0.17, T = (w/h)/(p(1−α)) − 1.** p(1−α) = p·0.83:
- p=0.3: 15/0.249−1 = **59.2**, 20→**79.3**, 30→**119.5**; min ints 60/80/120 ✓
- p=0.5: w/h=15: 15/0.415−1 = **35.1**, min int 36 ✓
- p=0.7: 15→**24.8**, 20→**33.4**, 30→**50.6**; min ints 25/34/51 ✓

All §III.3 cells in v1.3 are arithmetically correct, including the ceilings (strict
"T >", ceiling to the next integer). The round-1 B3 and round-2 N1 defects are, on
the bytes, gone. (Check: at T=59, 0.3·60·0.83 = 14.94 < 15, delegation loses, so
ceiling to 60 is correct, not the floor part3_math originally printed.)

(b) **CP bound 0.025^(1/14) = 0.7684.** Abstract L25 "Clopper–Pearson 95% CI of
[0.77, 1.00] at n=14" and NUMBER_SNAPSHOT `phat_cp95: [0.77, 1.00]` both round
correctly. ✓

(c) **Median duration from hf_stats.tsv.** Frozen snapshot (14 rows, the 2026-10-07
session incl. the connectivity probe) → sorted 7,24,24,25,25,25,26,37,43,109,163,
234,479,525 → (26+37)/2 = **31.5** ✓, matching §III.6 "median 31.5 s as of
2026-10-08". **But the live TSV now holds 18 rows.** Post-freeze rows landed: two
10-08 probe rows (11 s, 32 s) and two review rows (453 s, 587 s). Live n=16 (14 +
2 probes) median = **(26+32)/2 = 29.0**; n=18 (incl. reviews) median = **(32+37)/2 =
34.5**, range 7–587. The printed "31.5" is already stale against the very TSV it
cites, even within the same date. Declared snapshot discipline (#IX) makes this
minor, but it is N3-class drift recurring.

(d) **Per-wave α from TSV raw vs admitted, the honest answer: the ranges hold as
*disclosed estimates*, but they are NOT re-derivable from hf_stats.tsv.** Cross-check
RESULTS.md Table 1 «produced chars» against the TSV `chars` column:
- Wave 1 (drafting) claimed 22,824 vs TSV 1,397+1,438 = **2,835**, off by ~8×
- Wave 2 (intro+cites) claimed 23,440 vs TSV 8,709+11,983 = **20,692**
- Wave 3 (novelty) claimed 50,567 vs TSV 30,430+20,137 = **50,567, exact ✓**
- Wave 4 (N=6) claimed 40,447 vs TSV 5,840+5,289+5,951+5,552+6,966+10,843 = **40,441**

And no admitted-char value (3,853 / 4,447 / 7,000 / ~3,500) appears in the TSV at
all, the `admitted_s` column is populated only for the four most recent rows
(0, 185, 186, 2480). So the per-wave α = admitted/produced (0.1688/0.1897/0.1384/
0.0865 → 0.17/0.19/0.14/0.09, spanning [0.09, 0.19], the abstract's range) is
*arithmetically self-consistent* and matches NUMBER_SNAPSHOT's corrected values, but
its inputs are hub-audited and not instrument-grounded for waves 1, 2, 4. The paper
is transparent on this ("admitted characters are hub-audited per wave", L41–42; §IX
L396 "prior rows carry hub-audited wave-level α only"), but the `[M]` (measured)
tag on RESULTS F1 overstates reproducibility from the instrument. See Issue #2.

---
## 3. T3, Regression hunt (DRAFT.md, dash-encoding included)

| String | grep result |
|---|---|
| `75×` / `75x` | 0 |
| `T ≈ 61` (and `≈`, `~` variants tied to turns) | 0 |
| `57/15` | 0 |
| `failure probability` | 0 |
| `147 brief` | 0 |
| `four concurrent` | 0 |
| `30-second windows` | 0 |
| `INTRO-OK` | 0 |
| `RELATED-WORK-OK` | 0 |
| `v1.1 COMPLETE` | 0 |
| `cost-optimal control law` | 0 |

**Regression hunt: CLEAN.** The only surviving `cost-optimal`tokens are L265
("collapsing the cost-optimal *argument for delegation* into plain outsourcing" -
that is the dominance argument, not the anatomy, and is defensible) and L279 (the
IV.5 escalation ladder, Issue #1). The INC-004 fabricated-example strings are absent
from the manuscript; they remain only in INCIDENT_LOG.md as the incident record,
which is correct. The fabricated example's replacement (L266–275, real 16-dispatch
record + withdrawal note) is present.

---
## 4. T4, Fabrication hunt (3 §IV quantitative claims traced to instrument)

**Claim A, §IV.4 L265: "A 7/7 hit rate in the wave-1 calibration run (all seven
briefs accepted…)".** Provenance: partial. The TSV's first seven dispatches (rows
2–8: outline, related, intro, cites, priorart, strike, + 13:08 probe) are all
verdict=OK, so "seven accepted" is consistent *if* "wave-1" here means "the first
seven same-morning dispatches." But it collides with RESULTS.md Table 1, whose
"wave 1 (drafting)" is only *two* dispatches (outline+related, α 0.17). The label
"wave-1 calibration run" for seven briefs does not correspond to any RESULTS wave.
Not fabrication, but the n-labeling remains loose, the exact ambiguity N3 was meant
to kill. MINOR.

**Claim B, §IV.4 L269–272 (the INC-004-corrected record): "16 serial dispatches,
16/16 first-try needle accepts, zero retries, zero escalation events, and no
acceptance windows or deadline alarms implemented at all".** Provenance: fully
traceable to hf_stats.tsv (16 rows through the two post-freeze probes, all verdict=
OK, each brief appears once → zero retries) and to INCIDENT_LOG INC-004 ("16 serial
dispatches, 16/16 first-try accepts, zero retries"; "windows/deadline machinery
specified but never implemented"). No fabrication; this is the honest replacement of
the withdrawn fiction. ✓

**Claim C, §IV.5 L279 escalation ladder "retry → partial read → brief rewrite →
human" described (present tense) as the institution's path, plus "the institution's
cost-optimal path".** Provenance: NONE for the present-tense *implementation*, and
IV.6 L286–291 ("the escalation ladder never fired … Escalation as designed remains
untested under load") explicitly corrects the section above it. The ladder is honest
as a *design* (specified, unimplemented), the contradiction with IV.6 is owned, not
hidden. The residual problem is the **"cost-optimal path"** assertion (see Issue #1):
it is a derivation-class claim about an untested, non-derived mechanism, in the exact
family INC-003/INC-004 and the paper's own C5 directive police everywhere else. NOT
fabrication; an overclaim. ✓(design)/✗(cost-optimal label).

**Sibling-scan verdict:** I hunted specifically for INC-004-style fabricated siblings
(plausible-scale worked numbers with no TSV/state.db grounding). The strongest
finding is NOT a fabricated number but a *reproducibility* gap on the headline α
table (T2d): RESULTS.md Table 1's produced sums for waves 1/2/4 don't match the
instrument's `chars` column, and admitted chars have no per-dispatch provenance. This
is disclosed as hub-audited, so I do not call it fabrication, but under THIS
institution's own rule ("only provenance … stops it", INCIDENT_LOG INC-004), a
[measured] α that cannot be recomputed from the raw instrument is a standing
warrant gap, not a clean pass. Secondary probes (no instrument hit, unverifiable-from-
TSV but plausible state.db-range stats): "296 further assistant turns" (L72, L186)
and the 2×/185× traffic figures (RESULTS F3) come from state.db/hf_paper_stats.py,
not the TSV, beyond my read-only scope to confirm, consistent with round-2
acceptance.

---
## 5. T5, Verdict

**Score: 8/10.** Round 1 → 4, round 2 → 5, now 8. The composition is not "silencing":
it is the reverse of INC-003, the revision processed my N1/N2/F3/§3 hair-trigger
findings into actual manuscript bytes, with the corrected breakeven table propagated
(with correct ceilings), p redefined consistently as acceptance, both false sentences
removed (one replaced by the exact fix I dictated), and the four overclaim sentences
demoted per the paper's own §VIII directive 3. My round-2 §1-§4 findings are
13 FIXED / 2 PARTIAL-but-honest / 2 MINOR-not-fixed / 1 residual.

**Recommendation: MINOR-REVISE.**

**Remaining issues (≤3):**

1. **MAJOR, IV.5 escalation-ladder overclaim survives the C5 demotion.**
   DRAFT L279: "This ladder, retry → partial read → brief rewrite → human, is not a
   suggestion; it is the institution's cost-optimal path given verification-bandwidth
   constraints." This is the same derivation-class assertion round-2 excised from
   abstract/§I/III.4/IV.2, relocated to the escalation ladder, a mechanism that,
   per the paper's own IV.6 (L286–291), "never fired" and "remains untested under
   load." No objective function, no argmin, no impossibility result supports
   "cost-optimal path" any more than they supported "cost-optimal control law."
   One-line fix parallel to the others: "is the institution's escalation policy
   (cost-rationalized, not yet derived); untested under load (§IV.6)."

2. **MAJOR, headline α table not re-derivable from the instrument.**
   RESULTS.md F1 is tagged `[M]` ("α is stable at ~1/6 … α ∈ [0.14, 0.19]"), yet its
   per-wave produced sums match the TSV `chars` column for wave 3 only (50,567 exact)
   and diverge for waves 1 (22,824 vs 2,835), 2 (23,440 vs 20,692), and 4 (40,447 vs
   40,441); and *no* admitted-char value is instrument-logged for those waves. The
   numbers are arithmetically self-consistent and disclosed as hub-audited, so this
   is not fabrication, but under this institution's own provenance doctrine
   (INCIDENT_LOG INC-004), a `[M]`-tagged statistic that cannot be recomputed from
   hf_stats.tsv is a warrant gap. Add a 5-line provenance note to RESULTS F1: which
   waves' produced chars are TSV-verifiable, that admitted chars are hub-audited
   wave-level (not per-dispatch instrumented until 2026-10-08), and the state.db
   source for the rest. Also reconcile part3_math.md's stale regime-3 "1/α ≈ 5.9"
   line (its own side-file INC-003 echo) against the corrected [5.3, 11.1].

3. **MINOR (bundled), three cosmetic/verifiability stragglers.**
   (i) §III.6 "median 31.5 s as of 2026-10-08" is already stale against the live TSV
   (median 29.0 @ n=16; 34.5 @ n=18 incl. the two review rows), N3-type drift, now
   version-declared but still worth a "frozen n=14" qualifier. (ii) §VII REFERENCES is
   still an empty stub with the actual list in VII.a after Appendix B, flagged every
   round; move it. (iii) Part V L301 "Mandate marketplaces exist in prototype" remains
   citation-free, and the abstract's N6 185× still omits the dual-denominator caveat
   that RESULTS F3 documents.

None of these is a blocker. The manuscript's two central claims I stressed in rounds
1–2, that §III.3's numbers are machine-correct, and that the paper's reflexive
honesty is real rather than performative, both survive hostile re-derivation this
round. The one sentence (IV.5) and one provenance note (RESULTS F1) above are the
residue between "revised" and "a paper that fully does what it preaches."

---
REVIEW3-C-OK
