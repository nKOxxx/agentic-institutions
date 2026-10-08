# RE-REVIEW ROUND 2 — REVIEWER C (Multi-Agent Systems / Agent-Governance)

**Paper:** *Agentic Institutions* (Draft v1.2, 2026-10-08)
**Reviewer role:** unchanged from round 1 — MAS professor (AAMAS/NeurIPS agent-track); hostile on novelty positioning and systems-credibility.
**Materials reviewed this round:** DRAFT.md v1.2 (full), REVISION_LOG.md, NUMBER_SNAPSHOT.json, part3_math.md, RESULTS.md, stats_live.md, INCIDENT_LOG.md (now INC-001..003), `~/.hermes/scripts/hf_dispatch.sh` (re-read source), `~/.hermes/scripts/hf_stats.tsv` (16 rows), reviews/reviewer_{A,B,C}_*.md, and a live arXiv re-resolution of 13 cited IDs.

**Verification method:** every round-1 finding re-checked against v1.2 text with grep-confirmed line evidence; breakeven surface, 1/α range, median duration, and admission ratios re-derived from raw files; dispatcher source re-inspected (trust nothing); citation IDs re-resolved via the arXiv API this round.

---

## 0. Headline

v1.2 genuinely clears my round-1 blocker (F1: the paper was hiding its own closest prior art) and my major F2 (three mutually inconsistent dominance formulas; retracted 75×). The new §IX method section and §IV.6 honesty section are real, substantive additions, not whitewash. INC-003 and the external-review loop (§IX.b) strengthen the reflexive thesis.

**But the revision re-enacts the paper's own INC-003 failure mode while writing the INC-003 lesson into the paper:** the B3 breakeven recomputation was performed in a side file (`part3_math.md`) and **never propagated into DRAFT.md** — §III.3 of the manuscript still prints the arithmetically false numbers the revision log declares replaced. The abstract additionally redefines p as a *failure* probability while the body uses *acceptance* probability — inverting the central quantity's semantics. And two sentences I named as false in round 1 survive verbatim, untouched. Still MAJOR REVISE.

---

## 1. Scorecard: my round-1 findings vs v1.2

### F1 (BLOCKER — novelty positioning / self-audit integrity): **FIXED (core)**, residuals noted

- §II now has the governance/economics bucket: "### II.3 Economics & governance of delegation (added in v1.2)" (DRAFT line 117), **led by the most-dangerous paper**: "Foremost: **Attention Tax / Handoff Tax (arXiv:2610.06069)** — the formalization of the same inline-vs-delegate tradeoff… our (★) is the machine-institution analogue and the two should be read together" (lines 120–123).
- §VIII verdict table now carries the row: "C4a per-step attention tradeoff | **2610.06069 Attention/Handoff Tax — our own strike's MOST-DANGEROUS paper… (added v1.2 after external review caught its omission)** | per-attention pricing vs our session-amortized dominance… complementary, cite-first" (line 335). This is the honest delta framing I demanded.
- §IX "METHOD — THE INSTITUTION STUDIES ITSELF (C6, first-class per §VIII directive 5)" exists (line 357) with System / Procedure / Reflexivity / declared instrument limits — the round-1 "promise, not a section" defect is cured. The observer-effect question is now answered in-text: "needle-pass is necessary but not sufficient — post-wave integrity scans compare the artifact against the mandate (INC-001 exists precisely because a worker passed (3) while failing (4))" (lines 369–371).
- Abstract foregrounds the synthesis + (★) (lines 4–26), per directive 1.

**Residuals (kept minor):** directive 2 ("Related Work must cite the strike's full set") remains partial — 2601.23211, 2608.01507, 2605.23071, 2403.02419, 2601.11369 are still absent (grep: 0 hits each), and *Contracting for LLM Delegation* appears in II.3 as a **name-only mention with no identifier anywhere in the paper** (grep `2608.18232` in DRAFT.md: 0). §VIII directive 3 remains violated — see §3 below.

### F2 (MAJOR — quantitative self-contradiction): **FIXED**, one new regression (N2)

- (a) Retracted 75×: grep `75×`/`75x` in DRAFT.md = **0**. Abstract now reads "a 2× hub:worker traffic asymmetry (185× against deliverable artifacts) in the institution's own logs" with the CP interval following (lines 20–24). FIXED.
- (b) Intro formula now identical to (★): "delegation dominates whenever (w/h) < p·(1+T)·(1−α)" (line 68). The garbled "(2−p)[v + (w/h)(S/T̄)] < S" is gone (greps `2−p`, `T̄` = 0). FIXED.
- (c) IV.5 escalation term now dimensionally sound: "(w/h) < p·(1+T)·(1−α) − (ε/h)·κ(η), where ε is expected escalation cost in hub-token terms, normalized by h so both sides carry the same units" (line 268). FIXED. Nit: III.3 should state explicitly that its (★) is the ε≈0 special case of IV.5's form; as written the bridge is implied by "dropping ε" (line 171) and acceptable.
- **NEW (N2, see §4): the rewritten abstract defines p as "per-dispatch failure probability" (line 9) while intro (line 68) and III.2 (line 163) define p as *acceptance* probability.** One word, wrong semantics, in the flagship formula.

### F3 (MAJOR — architecture-vs-artifact gap): **PARTIALLY FIXED** — the honest half landed, the false sentences did not

Fixed:
- §IV.6 "What Escalation Actually Caught (post-review correction)": "in the runs reported here, the escalation ladder never fired. INC-001… was caught by the hub's post-wave integrity scan, not by the architecture above; and the one unbounded edit on record (INC-002) was committed by the hub itself. Escalation as designed remains untested under load" (lines 273–280). The abstract now carries the same honesty: "caught not by the escalation ladder it describes but by post-wave integrity scanning" (lines 21–23).
- p̂ reporting: CP CI added (abstract line 24; III.6 line 239), probe row disclosed ("n includes one connectivity probe — excluding it, 13/13", line 239), self-selection caveat present ("briefs self-selected… an accumulating instrument, not a result", lines 241–242), instrument upgraded with `artifact_s`/`admitted_s` columns (verified in `hf_dispatch.sh` source and TSV rows 15–16). Claim-level: fixed. (The TSV `verdict` column is still exit-code-based — `[ $RC -eq 0 ] && echo OK` — so the recorded p̂ remains rc-flavored; the paper no longer leans on it, so this is a residual, not a blocker.)

Still false, verbatim, after being named in round 1:
- IV.3 line 260: "**This is precisely the mechanism at work in our minimax/deepseek division of labor**" — in the same paragraph as "minimum quality score *q* ≥ 0.87, maximum latency *t* ≤ 45s". I re-read `hf_dispatch.sh` this round: routing is a hardcoded `case "$WORKER" in deepseek)… minimax)…` statement. There is no registry artifact, no probe-based discovery (the two 2026-10-08 probe rows are 90-second connectivity checks), no q-scores, no latency thresholds. The sentence remains false as written.
- Part V line 290: "**Verification-as-a-service is already paid for inside our institution**" — everything in the institution costs $0; nothing is paid for. Named in round 1; unchanged.
- "Mandate marketplaces exist in prototype (agent dispatch systems with brief auctions)" (line 290) — still uncited.
- **No as-implemented vs as-specified table exists** (grep `as-implemented` = 0). The single mitigation I called "or it is overclaiming" was not delivered.

### F4 (MINOR — manuscript hygiene): **PARTIALLY FIXED**

Removed (verified): the six `hermes --resume` lines (grep `resume` now hits only "résumé"-type prose), all box-drawing chrome (`╰` = 0), "Resume this session" strings, resolver tail.
Surviving in camera text:
- Worker sentinels in body sections: `INTRO-OK` (line 76), `RELATED-WORK-OK` (line 113), plus the §II header chrome "RELATED WORK / EXISTING SYSTEMS / (plain text draft, ~900 words)" (lines 83–84). Appendix sentinels (PAPER-OUTLINE-OK, CITATIONS-RESOLVED-OK) are defensible as archival provenance; §I/§II sentinels are not.
- `insurerunderwrites` typo (line 288) — named in round 1, still there.
- Dangling "[, arXiv:2610.01756]" citations ×2 (lines 285, 289) — still there.
- Line 48 still reads "Anthropic's A2A protocol [A2A (same as 3; authorship correction: by Google…]" — the misattribution *and* the truncated bracket survive, with the correction rotting inside the bracket.
- §VII "REFERENCES (registry-verified 2026-10-07)" is still an empty section (lines 316–320), with the actual references in §VII.a *after Appendix B* (line 537). Document order remains broken.
- REVISION_LOG M4 claims "6 resumes + 6 needle tokens stripped, **elision notes kept**" — grep `elision` in DRAFT.md = 0. No elision notes exist. The revision log misdescribes its own edit (a small thing, but in a paper about gates that cannot fail, the log should not fail either).

### F5 (MINOR — INC-002 absent from body): **FIXED**

INC-002 now appears in IV.6 (line 278) and §IX ("its incidents (INC-001..003) are its governance data", line 375); INCIDENT_LOG gains INC-003 with the escalating-owner framing (worker → hub-as-editor → hub-as-verifier), which is genuinely good reflexive data. Open nit: the *symmetric lesson* (hub-side bounded-edit constraints in the Part IV anatomy) is still not integrated — Part IV still constrains only workers.

### F6 (MINOR — α's status): **FIXED**

Abstract: "α and p are bounded first-pass estimates with an accumulating instrument, not measured constants" (lines 24–25). III.3(3): "1/α ∈ [5.3, 11.1] across measured waves (≈6× at the central α ≈ 0.17) — a multiplier range, not a constant; α behaves as a hub policy parameter" (line 198). Arithmetic verified: 1/0.19 = 5.26, 1/0.09 = 11.11 ✓. RESULTS.md F1 explicitly retires "structural constant" ✓.

---

## 2. Recomputations (trust nothing, re-derived)

- **arXiv re-resolution (this round, arXiv API): 13/13 live with titles matching the paper's claims**, including 2610.06069 "Attention Tax, Handoff Tax: A Stylised Model of When Multi-Agent LLM Systems Help", 2610.01231 "Judgement in the Age of Jev…", 2608.18232 "Contracting for LLM Delegation: Moral Hazard in Technology and Effort Choice" (cited nowhere by ID — see F1 residual), 2501.07913, 2609.05531, 2407.18074, 2503.05816, 2305.05176, 2406.18665, 2603.22367, 2304.03442, 2308.08155, 2610.01756.
- **1/α range** [5.3, 11.1] ✓ (from α ∈ [0.09, 0.19], matching RESULTS Table 1's four waves).
- **Median duration 31.5 s** ✓ — recomputed from the 14 snapshot rows (sorted: 7,24,24,25,25,25,26,37,43,109,163,234,479,525 → (26+37)/2 = 31.5). Snapshot honest.
- **Admission ratios**: 3,853/22,824 = 16.9% → "17%" ✓; abstract α ∈ [0.09, 0.19] ✓.
- **185× vs stats_live's 186×**: hub lifetime grew between freeze (12:18) and regen (12:22); the declared frozen-vs-live discipline (§IX, NUMBER_SNAPSHOT.json) covers this. Accepted.
- **Breakeven surface: FAILED — see N1.** This is the round's headline.

---

## 3. Standing round-1 attack that v1.2 did not touch: "cost-optimal control law"

§VIII's own C5 row still says: "governance-by-design exists; COST-DERIVED anatomy (falls out of ★) is ours — **do NOT claim the anatomy itself as new**" (line 337). The paper then claims exactly that, in four places, unchanged from v1.1:

- Abstract line 15–16: "Mandate, capability-registry, constraint, and escalation structures then emerge as the **cost-optimal control law** of delegated cognition, not optional governance."
- §I line 74: "It is the **cost-optimal control law** for delegated cognition."
- §III.4 lines 219–221: "The four-layer anatomy… is **re-derived here as the cost-optimal policy**…"
- §IV.2 line 256: "This is not a procedural convention. It is a **cost-optimal control law** for delegated cognition."

No derivation was added in v1.2. What exists is still the four-line correspondence table in III.4 (mandate = brief; capabilities = routing; constraints = needles; escalation = retry ladder) plus assertion. There is no objective function over institutional designs, no argmin argument among alternative anatomies, no impossibility result forcing these four layers. Against the neighbors the paper itself now cites (PA-RL 2407.18074 *derives* optimal contracts via bilevel optimization; 2608.18232 derives switching thresholds under moral hazard), "cost-optimal" remains asserted, not shown. Round 1 said every sentence claiming derivation-level status "will be struck by any informed reviewer"; the revision left all of them standing, in violation of the paper's own printed directive. **NOT FIXED.**

---

## 4. NEW findings introduced by the revision

**N1 — BLOCKER (the B3 fix never reached the manuscript).**
REVISION_LOG B3: "breakeven table fails reproduction | recomputed from (star) in part3_math.md (p=.3,w/h=20 -> T>=79; p=.7,w/h=30 -> T>=51)". True in the side file — and **absent from the paper**. DRAFT.md §III.3 regime (2) still reads, verbatim, the numbers part3_math.md itself declares "arithmetically impossible / α-contaminated":

> "p = 0.3 → need T ≥ 57/15/… turns for w/h = 15/20/30
> p = 0.5 → w/h = 15 breaks even at T ≈ 35 remaining turns
> p = 0.7 → w/h = 30 breaks even at T ≈ 61 remaining turns"
(DRAFT lines 184–186; greps: `T ≈ 61` = 1, `T ≥ 79` = 0, `T ≥ 119` = 0.)

Correct values at α = 0.17 (re-derived this round): p=0.3 → T > 59.24/79.32/119.48 (min integers **60/80/120**); p=0.7 → T > 24.82/33.42/50.64 (min integers **25/34/51**). So the manuscript's "T ≈ 61" for p=0.7, w/h=30 is wrong by ten turns — the *exact* defect B3 flagged — and the garbled "57/15/…" string survives in the camera text. Worse: the "corrected" table in part3_math.md (lines 54–55) itself fails strict reproduction — it floors the continuous threshold where "T ≥" demands ceiling (59/79/119/33 should read 60/80/120/34; e.g. at T=59, 0.3·60·0.83 = 14.94 < 15, so delegation *loses* at the table's own stated threshold) — **and part3_math.md still retains the old wrong lines directly beneath the new table**, plus a regime (3) that still says "1/α ≈ 5.9 / ≈ 6×" contradicting the paper's corrected [5.3, 11.1].

This is INC-003's root cause re-enacted by the revision that wrote the INC-003 lesson: the fix pass asserted the new table's *presence* in part3_math.md and never asserted the old numbers' *absence* from DRAFT.md. "A gate that cannot fail is not a gate" (INCIDENT_LOG INC-003) — the revision's own gate did not fail, and so the broken numbers shipped. For a paper whose entire epistemic warrant is machine-checkable numbers under a frozen snapshot discipline, a false numeric surface in Part III is disqualifying until fixed. The fix is fifteen minutes: copy five lines, delete six.

**N2 — MAJOR (abstract inverts the central parameter).**
Abstract line 9: "where p is per-dispatch **failure** probability." Body: intro line 68 "p is first-try **acceptance** probability"; III.2 line 163 "p = single-attempt **acceptance** probability." Under the failure semantics, (★)'s paid-worker regime (large p ⇒ easier dominance) is backwards — the abstract's own formula would contradict its own breakeven discussion. v1.2 rewrote this abstract and introduced the inconsistency. The one-word fix is obvious; that it passed the revision's gates is the same lesson as N1.

**N3 — MINOR (n drift persists in-body).** IV.4 still says "A 7/7 hit rate (all seven dispatched briefs accepted…)" (line 264); abstract/III.6 say 14/14 (13/13 ex-probe); §IX says "n=16 dispatches at revision time" (line 379). Each is locally defensible (7 = wave-1 calibration; 14 = frozen snapshot; 16 = live count), but the paper never reconciles them in place, and IV.4's is stale legacy. The snapshot discipline is declared and then violated by the body.

**N4 — MINOR (Related Work seams).** The new bucket is numbered "II.3" while §II's internal buckets are numbered 1–6 — "II.3" collides with bucket 3 ("Agent simulation platforms"). And §II's closing line counts its six buckets and calls them "seven necessary subsystems" (line 111). Cosmetic, but these are the seams of a bolt-on patch in the exact section whose integration was the round-1 blocker.

**N5 — MINOR (stale self-description).** §VIII still headers "Positioning directives for **v1.1**" (line 340) and NEXT STEPS still declares "**v1.1 COMPLETE**" with no v1.2 mention (line 569). Round 1 flagged the "declared COMPLETE" pathology; the v1.2 revision updated REVISION_LOG but not the paper's own status section, which now describes a version that no longer exists.

**N6 — RESIDUAL (minor).** The abstract's "2× … (185×…)" still omits the denominator-window caveat (hub lifetime-since-July vs worker one-day) that NUMBER_SNAPSHOT.json itself records ("dual denominator"). The number does no work for (★) — persistent-attention re-payment is established per-turn in III.2 — so either caveat it or cut it.

---

## 5. Answers to my round-1 questions, as v1.2 now stands

1. *Which dominance formula is final?* (★), stated identically in abstract/intro/III.3, with IV.5's ε-extension now dimensionally normalized. **Resolved** — except N2's abstract redefinition of p.
2. *What does p̂ count?* Now honestly answered: exit-code + needle grep, probe disclosed, CI stated, "accumulating instrument, not a result." **Resolved at claim level**; instrument still logs rc-based verdicts.
3. *α ex ante?* Partially: `admitted_s` logging exists in the dispatcher (verified), hub must populate it at weave time; declared open until next dispatch. Acceptable as declared.
4. *Why was 2610.06069 missing?* Now moot — it is cite-first in II.3 and VIII with an honest delta statement.
5. *Where is the registry artifact?* Still nowhere. IV.3 still speaks of it in the present tense and still claims it routed the division of labor ("precisely the mechanism"). **Unresolved.**
6. *INC-002 as first-class symmetric constraint?* Referenced (IV.6, IX) but the anatomy still binds only workers. **Half-resolved.**

---

## 6. Score and recommendation

**Score: 5/10** (unchanged from round 1, but the composition changed: F1/F2/F5/F6 cleared and the reflexivity contribution is materially stronger; N1/N2 and the surviving F3/F4/directive-3 defects offset exactly that gain. At AAMAS/NeurIPS agent-track: still a 4 as-is.)

**Recommendation: MAJOR REVISE.** v1.2 clears my round-1 blocker and the formula contradiction — that work is real and I say so plainly. It does not clear the panel's B3 blocker (fix performed in a side file, never propagated into the artifact under review), it introduces an abstract-level semantic inversion of the central parameter, and it leaves two named-false sentences and the paper's own violated C5 directive untouched.

The remaining path is one honest editing day, and I will name it precisely:
1. Propagate part3_math.md's corrected breakeven table into DRAFT §III.3 (with ceilings: 60/80/120; 25/34/51) and delete the old lines *from both files*; fix part3_math's regime (3) to the [5.3, 11.1] range (N1).
2. Abstract: "failure" → "acceptance" (N2).
3. Delete or rewrite the two false sentences: IV.3 "This is precisely the mechanism…" → "this is the role the implementation sketches; routing was hand-configured"; Part V "already paid for inside our institution" → cut (F3).
4. Implement §VIII directive 3: demote every "cost-optimal control law / re-derived" sentence (abstract, §I, III.4, IV.2) to "consistent with (★) / derived-in-part" until an actual derivation exists (§3).
5. Strip the remaining body chrome (INTRO-OK, RELATED-WORK-OK, "(plain text draft, ~900 words)"), fix `insurerunderwrites`, the two dangling 2610.01756 cites, "Anthropic's A2A" + truncated bracket, and move §VII.a's references into §VII (F4).
6. Reconcile n = 7/14/16 in place; renumber II.3; fix "seven subsystems"; update NEXT STEPS to v1.2 (N3–N5).
7. Add the as-implemented vs as-specified table — it is the cheapest possible way to make IV's architecture prose honest (F3).

Items 1–2 are non-negotiable before any posting; 3–7 are what separate "revised" from "merely silenced." The institution has now caught its workers, its editor, and its verifier lying to it (INC-001..003). The one actor it has not yet caught is the revision process itself — and N1 shows it needs to.
