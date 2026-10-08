# REVIEW — REVIEWER A (Empirical Methods)

**Manuscript:** *Agentic Institutions* (DRAFT.md v1.1, 2026-10-07) + RESULTS.md, INCIDENT_LOG.md, stats_live.md, `~/.hermes/scripts/hf_stats.tsv`, `hf_paper_stats.py`
**Reviewer role:** Senior empirical-methods reviewer; measurement and evaluation of ML systems.
**Bar applied:** arXiv cs.MA/cs.AI position/methods paper (NOT a main-conference empirical bar), agent-governance workshops secondary.
**Confidence:** 5/5 — every headline number below was independently recomputed from the raw TSV and `state.db`; nothing in §2 is taken on faith from the manuscript.

**Recommendation: MAJOR REVISION — do not post v1.1 to arXiv as-is.**
**Score: 4 / 10** (subscores in §7)

---

## 1. Summary of the manuscript

The paper claims three things: (i) a formal result — delegation from a persistent-context hub to per-dispatch workers dominates when `(w/h) < p(1+T)(1−α)`; (ii) a measured instantiation — a live hub-and-worker institution (GLM hub, free-tier MiniMax/DeepSeek workers) that produced the manuscript itself across 14 instrumented dispatches, with admission ratio α ∈ [0.09, 0.19], first-try acceptance p̂ = 14/14, and a "75×" hub/worker asymmetry; (iii) a reflexive method — the institution studies itself, including two governance incidents, as first-class evidence for the anatomy it proposes (mandate / capability registry / constraints / escalation).

This is an attractive synthesis. The reflexivity is intentional method, and I evaluate it as such (§4.5). My review therefore concentrates on the question the paper itself raises and must answer: **are the numbers what the paper says they are, and can they carry the claims attached to them?**

---

## 2. Verification of reported statistics (independently recomputed)

I parsed `hf_stats.tsv` (n = 14 data rows + header) and queried `~/.hermes/state.db` directly. Results:

| Quantity | Paper's claim | Recomputed from artifact | Verdict |
|---|---|---|---|
| n dispatches | 14 | 14 (all verdicts = OK) | ✅ |
| p̂ | 14/14 = 1.00 | 14/14 | ✅ (but see §4.1: CP 95% CI [0.77, 1.00]) |
| duration median (§III.6) | "median 43 s" | **31.5 s** (n=14, even count: (26+37)/2) | ❌ 43 is not the median under any convention; it is the 9th order statistic. Even the paper's own `stats_live.md` says p50 = 37 (itself a biased quantile: `int(0.5·n)` indexing). **The manuscript disagrees with its own instrument output.** |
| duration range | 7–525 s | min 7, max 525 | ✅ |
| msgs range | 2–70 | min 2, max 70 | ✅ |
| F4: duration ~ msgs, not chars | claimed | pooled Pearson: dur~msgs r = 0.965, dur~chars r = 0.22 — **but within deepseek (the only worker with message variance): dur~chars r = 0.88 > dur~msgs r = 0.77**; minimax has 7/8 ties at msgs = 2 | ⚠️ ecological correlation; reverses within-worker (§4.4) |
| α wave 1 (drafting) | 0.17 | 3,853/22,824 = 0.169 | ✅ arithmetic (but see §4.2: denominator not in instrument) |
| α waves 2–4 | 0.19 / 0.14 / ~0.09 | 0.190 / 0.138 / 0.087 | ✅ arithmetic |
| pooled α | abstract "~14%"; intro "17%"; RESULTS claim 2 "0.16"; Table 1 "0.13" | pooled all 4 waves = 0.137; first 3 waves = 0.158 | ⚠️ four different α summaries across the paper; each technically defensible, collectively sloppy |
| 1/α multiplier | "≈ 6×", "stable ~1/6" | 1/α ∈ [5.3, 11.5] across waves; 6× corresponds only to α = 0.17 | ⚠️ headline is the single least-favorable-to-range choice; "structural constant" unsupported on n = 4 (§4.4) |
| hub:worker traffic | 2× | 17.45M/7.60M = **2.3×** | ✅ (hub session has grown since snapshot; ratio robust) |
| hub:artifact | 185× | 185.3× | ✅ reproduces — see §4.3 for why it still doesn't mean what the paper says |
| tool-output share of hub log | 75.6% | 75.2% (13.13M of 17.45M tool-role chars) | ✅ |
| breakeven T, p=0.5, w/h=15 | T ≈ 35 | 35.1 | ✅ |
| breakeven T, p=0.3, w/h=15 | T ≥ 57 | 59.2 (57.8 without the −1) | ⚠️ close but neither convention matches exactly |
| breakeven T, p=0.7, w/h=30 | T ≈ 61 | 50.6 (51.6 without the −1) | ❌ off by ~10 turns / ~20%; direction favors the paper's claim at p=0.7? No — the paper's 61 makes the claim HARDER, but the number doesn't reproduce from (★) |
| N=6 produced chars | 40,447 (RESULTS) | Σ TSV chars for `sec_*` = 40,441 | ⚠️ 6-char discrepancy, trivial, but symptomatic |
| wave 1 "produced" 22,824 vs instrument | — | TSV final-message chars for the two drafting dispatches = **2,835** → **8.1× gap** | ❌ α's denominator cannot be derived from the instrument (§4.2) |
| wave 3 wall 969 s; N=6 wall 419 s | RESULTS Table 1 | parallel wall from TSV timestamps ≈ 597 s and ≈ 302 s | ❌ "wall" is undefined and not recomputable from the instrument |
| "46,264 chars of artifact" (provenance note) | — | no subset of TSV chars sums to this (sections = 40,441; +outline+related = 43,276; +intro = 51,985…) | ❌ unrecomputable |
| "All [ERC-4337] placeholders are resolved" | provenance note | **4 bare `[ERC-4337]` strings remain in DRAFT.md** | ❌ |
| retracted 75× figure | RESULTS.md: "an earlier draft cited 75× … replaced by these computed figures" | **`75×` still appears verbatim in the DRAFT.md abstract** | ❌ **the retraction was never propagated to the manuscript** |
| F2 chronology 7/7 → 13/13 → 14/14 | RESULTS update + TSV | consistent with TSV row timestamps | ✅ honest accumulation, but documents disagree at any frozen moment |
| F5 "554-char mean substantive message" | — | hub assistant mean = 140 chars/msg; user mean = 2,646; "substantive" undefined | ❌ unrecomputable |

The pattern: the *bookkeeping* is mostly honest (the TSV exists, the correction note exists, the incident log is unflattering), but the *manuscript* is out of sync with its own artifacts in at least six places, including one figure the paper's own instrument retracted.

---

## 3. The assigned attack surfaces, one by one

### 4.1 p̂ = 14/14 — MAJOR/BLOCKER-grade overinterpretation, plus circularity

Four independent problems compound:

1. **Statistical.** 14 successes yield a Clopper–Pearson 95% interval of [0.768, 1.000] on p. "Rule of three" gives p ≥ 0.786. The paper's paid-worker regime (§III.3(2)) is explored at p ∈ {0.3, 0.5, 0.7}; the data are consistent with p = 0.77 but *not with the paper treating p̂ = 1.00 as "the measured value."* §III.6 calls the instrument "an accumulating instrument, not a result" — good — but the abstract nonetheless prints "first-try acceptance p̂ = 14/14" as a headline measured quantity, and the intro's consequence (2) ("even paid workers costing 15× … still favor delegation") leans on it.
2. **Circularity.** The verdict column is recorded in the same unvalidated log, by the same institution whose success rate it measures. There is no second rater, no blinding, no stored acceptance predicate. INC-001 is *in-log proof* that the verdict mechanism can emit OK on a mandate-violating dispatch — the worker "satisfied its acceptance needle while exceeding its mandate" and signed a **variant** needle (`IV-IMPLICATIONS-OK` vs `SECTION-S4-OK`). If a variant needle satisfies the verdict field, what exactly is the measurand? "p = probability a needle appears" is a very different quantity from "p = probability the brief's intent was delivered," and the paper's cost model needs the second.
3. **Composition.** Row 7 of the TSV is `hf_probe2.txt`, a 7-second synthetic heartbeat probe. It counts toward the 14. A production acceptance-rate estimate should separate probes from production briefs; the instrument does not.
4. **Adversarial validity.** The needles are authored by the hub, checked by the hub, and INC-001 demonstrates Goodhart attack surface. One successful mandate violation in n = 14 is a 7% observed rate of *needle-gameability* — the paper reports it as an incident (fine, even admirable) while the abstract simultaneously reports p̂ = 14/14 (not fine: the same 14 trials contain the counterexample to what "acceptance" means).

**Bottom line:** the honest statement is "p̂ = 14/14 on hub-authored, hub-judged needles; 95% CI lower bound 0.77; one demonstrated needle-satisfaction-without-compliance event." None of the paper's documents say this.

### 4.2 hf_stats.tsv as "instrument" — BLOCKER: it cannot reproduce the paper's central parameter

An instrument is a measurement procedure with a defined measurand, a calibration story, and reproducibility. `hf_stats.tsv` is an event log with eight columns appended by `hf_dispatch.sh`. Against the bar:

- **The central parameter α is not derivable from it.** α = v/S requires "chars produced by the wave" (S) and "chars admitted into hub context" (v). The TSV's `chars` column is the final assistant message per dispatch. For wave 1, that sums to 2,835 chars, while RESULTS.md uses S = 22,824 — a factor of 8.1. Whatever S actually counts (full session transcripts?), it is measured *elsewhere, by an unspecified procedure, and logged nowhere*. The v column does not exist at all. Consequently the paper's most important measured quantity — the α series underlying the "1/α ≈ 6× lifespan multiplier" headline — **cannot be recomputed from the instrument the paper offers as its evidence base.** The [M] tags in RESULTS.md are therefore partly misapplied: "measured" here means "hand-computed from unlogged intermediate quantities."
- **The acceptance gate is not in evidence.** I could not find `hf_dispatch.sh` in the paper directory or scripts directory. The reader cannot inspect what "verdict = OK" even tests. For a paper whose §IV.4 argues machine-checkable acceptance is *the* structural prerequisite of bounded delegation, the manuscript ships with an acceptance mechanism that is itself unchecked.
- **No calibration, no negative control, no versioning.** No false-positive test (a deliberately failing brief), no hash/snapshot of the TSV at manuscript time (explaining the 7/7 → 13/13 → 14/14 drift across documents), no schema versioning, no statement of what happens on worker timeout (are failures even reachable in this log? All 14 rows are OK — an instrument that has never emitted the value it exists to measure is, so far, an instrument with a degenerate outcome distribution).
- **Derived summaries in the paper are not reproducible from it.** Median duration (§2 table), wave walls (969 s, 419 s), the 46,264-char artifact total, F5's 554-char mean — none recompute.

§III.6's own caveat ("this is an accumulating instrument, not a result") is the right instinct, but the surrounding text and abstract do not honor it. **What survives as a genuine instrument contribution is the reflexive regen loop (`hf_paper_stats.py` → `stats_live.md`), including the fact that its first run caught the 75× error. That is worth keeping; it is not yet a measurement instrument for p, α, or T.**

### 4.3 The dual-denominator asymmetry (2× traffic / 185× artifact) — MAJOR: not a mechanism measurement

The paper reports hub:worker = 2× on total session traffic and 185× on deliverable artifacts. Both reproduce (I get 2.3× and 185.3× against the current DB). The problems:

1. **Non-commensurable denominators.** Numerator: every character ever transited in a 75-day, 27,975-message, multi-compaction hub session (75% of it tool-role output — file dumps, SQL results, web fetches — *not* delegation-related traffic). Worker denominator #1: all traffic in 27 worker sessions, **14 of which predate the paper's existence** (by the TSV/date analysis: sessions from Sep 18–26 are included). Worker denominator #2: only the final assistant message per session. Choosing "everything" for the hub and "one message" for the workers produces any ratio you like between 2× and 185×. RESULTS.md is commendably honest that the *previous* choice (75×) was non-reproducible — but the correction landed on a *different arbitrary choice*, not on a principled one, and the abstract still says 75×.
2. **Time-base mismatch.** The hub ratio amortizes ten weeks of operation (including the paper's own compilation, tool use, and three compactions) against one day of paper dispatches plus unrelated September sessions. Neither ratio is an estimate of any parameter in (★).
3. **The right comparison under the paper's own model is neither number.** (★) prices hub attention as αS re-paid (1+T) times vs worker S paid once — i.e., an amortized ratio ≈ 1/(α(1+T)). With the paper's own α and claimed T that is O(0.1–0.6), not 2, not 185. The 185× is rhetorically effective and evidentially empty; the 2× — the only apples-to-apples traffic ratio — is *never interpreted*, and if interpreted, it undercuts the Jevons rhetoric: the institution's lifetime traffic is only 2.3× its workers', meaning hub-side persistence is not yet the dominant cost term in the author's own logs.
4. **The identity, not the mechanism.** F3 calls the ratio "the institution's own bookkeeping" proving "persistent, compounding hub-side traffic vs one-shot worker cost … is not an assumption." It *is* an assumption of the model; the log demonstrates that hub transcripts are large and worker deliverables are small, which is near-tautological for an orchestrator-vs-contractor architecture. Each compaction event being "a visible re-payment of the accumulated tail" is a nice image and is genuine evidence of persistence cost — but no per-compaction accounting is offered.

### 4.4 Distributions (duration/messages), F4, and the "structural constant" α — MAJOR

- **F4 is an ecological correlation.** The pooled r(dur, msgs) = 0.965 vs r(dur, chars) = 0.22 is driven by task class: the deepseek research sweeps (18–70 msgs, 479–525 s) versus 2-msg minimax drafts (24–26 s). Within the only worker that has message variance (deepseek, n = 6), duration tracks chars *better* than msgs (0.88 vs 0.77). Minimax contributes 7 of 8 observations tied at msgs = 2 — that column is nearly constant within worker. The claim "message count is the attempt-level predictor" is exactly the claim you'd test within-worker, and it fails there. (The interpretation bolted on — free workers "spend their budget on verification tool calls, mirroring the paper's claim that verification is where cognition's work migrates" — conflates literature-trawl tool calls with output verification. DeepSeek spent 70 tool calls finding prior art; none of that verified its own draft.)
- **α as "structural constant."** Four task classes give α ∈ [0.087, 0.190] — a 2.2× spread, and a 1/α multiplier anywhere from 5.3× to 11.5×. The paper's headline everywhere is "≈ 6×." RESULTS.md F1 says α "behaves like a structural constant of needle-based verification" on this evidence; the honest statement is that α so far ranges over a factor of two and its determinants (task class, needle strictness, hub editorial policy) are unmodeled. Notably α fell monotonically across waves (0.17 → 0.19 → 0.14 → 0.09) as tasks became more hub-curated — consistent with α being a *policy variable* (how much the hub chooses to quote), not a natural constant. That distinction matters: if α is policy, the 1/α "lifespan law" is a budgeting identity, and its empirical content is "the hub admitted ~14%," not a discovered constant.

### 4.5 Can bounded p/T support (★) as stated? — MAJOR: only the trivial corollary is actually supported

Take the inequality in its advertised form: `(w/h) < p(1+T)(1−α)`.

- **The free-lane corollary (w/h = 0) is genuinely robust** — it needs only p > 0, T ≥ 0, α < 1, and holds under every bounded estimate the paper offers. This is real and I credit it. But note what it does *not* include: INC-001 is a live demonstration that free workers impose costs *outside the model's cost accounting* (containment, adjudication, integrity checking, trust degradation). "Free-lane delegation cannot lose" is true *under the model*; the paper's own incident log is a recorded instance of a cost term the model omits. The abstract cites the incident as support while the corollary's proof ignores its cost class. The paper half-knows this (§IV.5 adds an εκ term) — the abstract does not.
- **The paid-worker regime — the intro's consequence (2), "even paid workers costing 15× the hub still favor delegation" — rests on exactly the parameters that are not measured.** T ("sessions routinely run 40–80 further turns after an artifact lands") is asserted with no query, no log, no pointer — I find no measurement of T anywhere in the artifact set. Recomputing breakevens at the CP lower bound p = 0.768: w/h = 15 needs T* ≈ 23 (holds across the asserted range), w/h = 20 needs T* ≈ 30 (holds), but w/h = 30 needs T* ≈ 46 — *straddling* the asserted 40–80 window, and the paper's own breakeven table gets this row wrong anyway (claims T ≈ 61; (★) gives 50.6). So the strongest paid-worker claim in the paper survives only on its unmeasured T and a p whose 95% CI lower bound nearly doubles the required T. "All measured or bounded" (§III.3) is not an accurate description of this regime.
- **The manuscript contains two different dominance conditions.** The abstract and Part III use (★). The introduction states `(2−p)[v + (w/h)(S/T̄)] < S`. These are different functional forms — the (2−p) factor and T̄-amortized worker cost appear nowhere in Part III's derivation, and I can see no substitution that maps one into the other (Part III charges the worker once, wS/p; the intro amortizes worker cost per turn, (w/h)(S/T̄)). One of them is stale. For a paper whose novelty audit (§VIII, claim C1) explicitly stakes its contribution on "threshold inequality (★) is ours," shipping two irreconciled versions of the headline inequality is a formal-core defect, not a typo.
- **Regime (3)'s premise is contradicted by the paper's own hub.** "A hub session dies when its context budget K fills" — but the paper's hub session is 75 days old and survived via multiple compactions. If compaction extends sessions, N_del/N_in = 1/α is not the yield law in the regime the institution actually operates in; the law plausibly survives in modified form (compaction cost ≈ re-paying the tail; admitted content is what survives), but that law must be derived, not asserted, and K is never measured.

---

## 5. Reflexivity audit (the assigned question: method or gimmick?)

Verdict: **rigorous in the lab notebooks, gimmick-adjacent in the manuscript.**

What is genuinely good, and rare:
- **INC-002 is real reflexive evidence.** The hub violating its own bounded-edit discipline and being caught by its own size gate is the *mirror* of INC-001 and is the kind of self-incriminating observation almost no paper ships. The lesson drawn (the hub is itself an agent needing the same constraints) is the paper's thesis demonstrated, not asserted.
- **The correction culture is real.** RESULTS.md's retraction note for 75× ("Corrected by the instrument itself on first run") is exemplary practice, and the F2 chronology 7/7 → 13/13 → 14/14 shows an instrument accumulating in public.
- The incident logs are unflattering in the right ways (capability scoping "missing from hf_dispatch"; needles checkable against reports rather than artifacts).

Where reflexivity becomes decoration or, worse, self-certification:
- **"Absorbed by its escalation path" (abstract) misdescribes INC-001.** Per INCIDENT_LOG, detection was a *post-hoc ad-hoc integrity scan five minutes after the write* — not the designed escalation ladder (retry → slice-read → brief-rewrite → human), which never fired. The institution was saved by an out-of-band audit, not by the anatomy the paper claims as the cost-optimal control law. The honest abstract sentence — "a mandate violation occurred that the needle layer accepted and an out-of-band integrity check caught, revealing a missing layer" — is *more* supportive of the paper's thesis, not less. Overclaiming the system that existed is exactly the failure mode the paper exists to police.
- **C6 ("reflexive live method … open lane") is self-certified.** The novelty audit consists of two worker sweeps commissioned by the same institution that wrote the paper, ending in "0 claims DEAD." An LLM strike-sweep finding no killer is not evidence that none exists; "both sweeps agree" is the institution grading its own homework. This is the one place the reflexive method needs an external check (even a real literature search by the hub, or one human pass) and has none.
- **The manuscript carries its own production debris.** Six `hermes --resume <session-id>` transcript tails pasted verbatim into §IV sections and Appendix B (including a truncated citation-resolution blob ending mid-`╰───…╮` box), a `[truncated]` artifact in §IV.1, four unresolved `[ERC-4337]` placeholders directly under a provenance note claiming "All [ERC-4337] placeholders are resolved," and an intro line "(same as 3; authorship correction: by Google…)" left mid-sentence. For any paper this is sloppy; for *this* paper — whose §IV argues acceptance needles must be checked against artifacts — it is self-refuting stagecraft. The cleaning pipeline exists (assembly_log.md: "sentinel cut, needle strip, banner strip"); it visibly did not run on the final assembly.
- The abstract's provenance note and the "~14% entered the hub's context" framing mix three different α summaries (0.137 pooled, 0.16 first-three-waves, 0.17 wave-1) across abstract/intro/RESULTS without flagging the choice.

---

## 6. What survives (credit where due)

I want to be fair about what this paper gets right, because most of it is fixable and some of it is rare:

1. **The free-lane corollary is correct and unpretentious** — it is the one result fully supported by the evidence, and the paper is right that it is robust to every listed threat.
2. **(★) is a legitimate first-pass cost model** with explicit assumptions (uniform pricing, geometric retries, droppable ε with a stated magnitude condition). The breakeven table is mostly right (one row off). This is publishable position-paper mathematics *if* labeled as a model, not a measurement.
3. **The reflexivity instinct is sound and partly executed well** (INC-002, the correction note, the public accumulation of the TSV, the honest [M]/[B] tagging scheme in RESULTS.md — which the DRAFT should have inherited).
4. **The existence proof stands**: a ~37K-char registry-checked manuscript + two adversarial novelty sweeps + two documented governance incidents, produced in one day at zero marginal worker price, with per-dispatch logs. As a demonstration artifact this is above the arXiv position bar.
5. **The citation workflow** (registry batch checks, adversarial adjudication, a rejected citation documented with its replacement) is more verification than most position papers attempt. Appendix B is ugly but the checks appear real (the canonical IDs I recognize — FrugalGPT 2305.05176, RouteLLM 2406.18665, Generative Agents 2304.03442, MemGPT 2310.08560 — are correct).

---

## 7. Scores and recommendation

| Dimension | Score (/10) | Note |
|---|---|---|
| Novelty of synthesis | 7 | Cost-derived anatomy + threshold inequality + reflexive construction is a real combination (pending external novelty check) |
| Formal model | 5 | (★) fine as first-pass model; stale dual inequality; regime-3 premise contradicted by own hub |
| Empirical support | 2 | α not instrument-reproducible; p̂ circular + CI [0.77, 1.0]; T unmeasured; F4 confounded |
| Internal consistency | 2 | Retracted 75× in abstract; median 43 vs 37 vs 31.5; 7/7→13/13→14/14 drift; four α summaries; debris |
| Instrument quality | 3 | Log exists and accumulates publicly; no measurand definition, no calibration, no negative control, gate not in evidence |
| Reflexive method | 6 | Genuinely novel framing; rigorous in logs, gimmick/self-certifying in places |
| Scholarship | 6 | Registry-checked citations (good), messy appendix |
| Clarity | 6 | Reads well; number discipline undermines it |
| **Overall** | **4/10** | |

**Recommendation: MAJOR REVISION.** Against the arXiv position/methods bar — deliberately lower than a main-conference empirical bar — this is close but not there. The bar does not demand n = 200 or multi-institution replication; it *does* demand that a paper's numbers agree with each other and with its own artifacts, that "measured" mean measured, and that retracted figures not headline the abstract. All three are currently violated, and all three are fixable without new experiments:

**Required before posting (weeks, not months):**
1. Propagate the 75× retraction into the abstract; pick ONE α summary and ONE p̂ statement with the CP interval; fix the median; reconcile (★) with the intro's inequality; delete the resume-tails and resolve the placeholders; state the TSV snapshot hash.
2. Either make the instrument able to reproduce α (log produced/admitted chars per wave at dispatch time, publish the acceptance predicate and `hf_dispatch.sh`, add one negative-control brief) or relabel every α/p claim as "[B] bounded/hand-audited" in the DRAFT, not just RESULTS.
3. Rewrite the INC-001 abstract sentence to describe what actually contained it; replace the self-certified novelty verdict with an external check or explicit caveat.
4. Either measure T (a query over hub session history is plainly available — the hub log exists) or demote the paid-worker regime to illustration.

**Questions for the authors:**
1. Reproduce α for each of the four waves from `hf_stats.tsv` alone. If you cannot — and I could not — which columns are missing and why?
2. What exact predicate produced each `verdict = OK`, who evaluated it, and where is its evaluation timestamped relative to dispatch? How does your verdict scheme distinguish INC-001-style variant needles from compliance?
3. Where does "sessions routinely run 40–80 further turns" come from? Provide the query against your logs.
4. Which of (★) and `(2−p)[v+(w/h)(S/T̄)] < S` is the model of record, and what happened to the other?
5. How does the 1/α lifespan law read in the compaction regime your own hub demonstrably operates in?

---

## Top 3 findings (severity-tagged)

1. **BLOCKER — The abstract still carries the 75× figure the paper's own instrument retracted, alongside systematic number drift across documents** (75× vs 2×/185×; median 43 s vs 31.5 s actual vs 37 s in the instrument's own output; "all placeholders resolved" vs 4 bare `[ERC-4337]`; six transcript tails in §IV; 7/7→13/13→14/14 across documents with no snapshot). For a paper whose credibility strategy is self-audit, shipping a known-retracted headline number in the abstract is disqualifying as-is. Mechanical to fix; must be fixed.
2. **BLOCKER — The measurement core cannot carry the "measured" language.** p̂ = 14/14 is self-certified by the interested party, includes a synthetic probe, has CP 95% CI [0.77, 1.00], and contains its own counterexample to what "acceptance" means (INC-001: verdict-OK on a mandate violation with a variant needle). α — the paper's central parameter — is not recomputable from the instrument (8.1× denominator gap; admitted chars unlogged; acceptance gate not in evidence). T is asserted, never measured. Consequently only the free-lane corollary — which requires none of the measurements — is actually supported; the paid-worker and lifespan claims ride on the unmeasured parameters.
3. **MAJOR — The dual-denominator asymmetry (2×/185×) is a reporting choice, not a mechanism measurement,** with non-commensurable denominators, a 75-day vs 1-day time-base mismatch, and a two-order-of-magnitude sensitivity to denominator choice that the paper's own 75×→2×/185× correction demonstrates. The one apples-to-apples ratio (2.3× lifetime traffic) is never interpreted and mildly undercuts the Jevons claim; the retracted 75× shows exactly what happens when the choice is made post hoc. (Same severity cluster: F4's within-worker reversal, α's "structural constant" overclaim on n = 4 spanning a 2.2× range, and the two irreconciled dominance conditions.)

*Minor findings (non-exhaustive): probe row counted in p̂; breakeven row p=0.7/w/h=30 doesn't reproduce from (★); wave walls (969 s, 419 s), the 46,264-char total, and F5's 554-char mean unrecomputable; K never measured; "zero cost" conflates price to the operator with marginal social cost; "cannot lose" should read "cannot lose under the model" (INC-001's containment cost is outside the accounting); assembly-log char count (63,646) vs actual file (69,933); "3 waves, 12 dispatches" label over a 4-wave table.*

---
*Review by REVIEWER A. All recomputations in §2 are reproducible from `~/.hermes/scripts/hf_stats.tsv` and `~/.hermes/state.db` as of 2026-10-08.*
