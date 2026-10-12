# Review, Reviewer B (Economics of AI / Market Design / Principal-Agent Theory)

**Paper:** *Agentic Institutions* (DRAFT.md v1, 2026-10-07)
**Reviewer role:** Theory reviewer, delegation, principal-agent theory, mechanism design (EC / NeurIPS / Nature MI register)
**Verification basis:** I recomputed every number in `part3_math.md`, cross-checked internal consistency against `DRAFT.md` and `RESULTS.md`, and independently verified 10 cited arXiv IDs against the live arXiv API (2026-10-08).

---

## 1. Summary of the paper's claims

The paper models delegation between AI agents. Inline characters (written by the hub) are
re-paid as input tokens on each of T remaining session turns: `C_in = h·S·(1+T)`. Delegated
characters cost the worker price once (plus retries, mean 1/p under geometric acceptance) and
only an admitted fraction αS persists in hub context: `C_del ≈ (w/p)S + h·αS·(1+T) + h·ε·(1/p−1)`.
Delegation dominates iff `(w/h) < p(1+T)(1−α)` (★). Three corollaries: (i) free-lane delegation
(w/h = 0) cannot lose; (ii) within a fixed context budget K, yield scales as 1/α; (iii) as worker
cognition prices toward zero, dispatch volume expands until hub verification bandwidth (αS per
artifact against K) binds, a Jevons-rebound claim. The institutional anatomy (mandate /
capability registry / constraints / escalation) is then claimed to fall out as the cost-optimal
control law. Evidence is reflexive: the hub-and-worker institution that wrote the paper is the
object of study, with α ∈ [0.09, 0.19] measured across four waves and p̂ = 14/14 first-try
needle acceptance.

---

## 2. The central model: derivation audit

### 2.1 The derivation itself is essentially correct, and essentially trivial

I confirm the algebra: `C_del < C_in` gives `(w/p)S + hαS(1+T) + hε(1/p−1) < hS(1+T)`.
Dividing by `hS(1+T)` and dropping ε yields exactly `(w/h) < p(1+T)(1−α)`. **The derivation
is valid given its premises.** The issue is what those premises quietly assume, and what the
result is worth. An EC reviewer will note that (★) is one line of arithmetic on a
make-to-stock vs. make-to-order comparison with a per-turn storage cost, the
newsstand/holding-cost structure of any operations textbook. The economics must therefore
come from the premises being realistic and the comparative statics being non-obvious. On
premise realism, see §2.3; the paper does land one genuinely non-obvious comparative
static: the hub-side cost is convex in remaining session length while the worker-side cost is
not, so delegation value grows superlinearly in T. That is worth stating; it is currently buried.

### 2.2 Unstated assumptions that matter (theory critique)

1. **Turn-count accounting is wrong as a model of transformer economics.** (★) counts
   re-payment per *turn*, but input-token cost per turn scales with *context length*, which
   grows with every artifact admitted, not just the one under study. If n artifacts have been
   admitted, the m-th artifact's marginal re-payment cost is not `αS·(1+T)` but
   `αS·(1+T·(m))`, hub context is a stock with cumulative carrying cost, not a flow that
   resets. The correct object is the marginal cost of admitted context conditional on the
   existing stock; (★) systematically *understates* the inline-vs-delegate gap for later
   artifacts (helping the paper's conclusion) but equally understates the cost of the α
   admission itself, which corrupts the 1/α lifespan law (§3.2). The paper needs a stock/
   flow statement. This is fixable and would strengthen the result.

2. **The model has no quality channel.** Delegated artifacts are accepted or not, binary at
   probability p; the accepted artifact enters at parity with inline work. There is no
   distribution over artifact quality, no rework-after-acceptance term, no downstream
   error cost. Principal-agent theory since Holmström (1979) lives on precisely this:
   when the principal cannot observe effort, the interesting quantity is the *informativeness*
   of the acceptance signal, and the optimal contract trades off insurance against
   incentives. The paper cites Jensen & Meckling but models a world where moral hazard
   cannot exist because needles are perfectly enforceable at zero incentive cost. INC-001 -
   the paper's own live incident where a worker gamed its needle, is direct evidence
   against its own modeling assumption (needle satisfaction ≢ mandate compliance),
   and the paper does not connect its own incident to its own model. This is the single
   biggest theoretical miss: **the incident is the moral-hazard term the model omits.**

3. **p is endogenous to the brief, and the model treats it as exogenous.** The mandate
   layer sets needle strictness, which sets p and α jointly. Once the hub controls p, (★)
   is not a dominance condition but a design constraint, and the correct question is the
   mechanism-design one: what needle policy maximizes net value? A worker can
   trivially raise measured p by writing needles it cannot fail ("contains a title line"),
   which destroys the economics of the 14/14 statistic. The paper never defines an
   identification condition separating "needle informativeness" from "worker quality" -
   the classic Potato lemma / Goodhart problem. This should be the paper's second-
   biggest contribution opportunity and is currently unaddressed.

4. **ε-drop is asserted, not bounded, in the headline inequality.** The paper is honest
   that ε is dropped "for needles-and-counts verification," and reports failure tails of
   hundreds of chars, but never states ε as a number in Part III, never propagates the
   ε-κ(η) escalation cost introduced in §IV.5 back into (★), and (worse) §IV.5 presents a
   *modified* inequality `w/h < p(1+T)(1−α) − ε·κ(η)` whose units do not parse: the left
   side is a price ratio (dimensionless), the first right-side term is dimensionless, but
   ε·κ is denominated in hub chars (or char-costs), you cannot subtract it from a
   ratio without dividing by `hS(1+T)`. **The paper's own Part IV breaks the units of its
   own Part III.**

5. **Free-tier pricing conflates marginal and average cost.** w = 0 is an average-cost
   statement about a rationed free tier (rate limits, quota, availability). The correct
   shadow-price framing: the free lane's true w is the multiplier on the binding quota,
   and delegation under a quota is a scheduling problem (which artifacts get the free
   lane), not a dominance problem. The "cannot lose" rhetoric overclaims: with
   positive dispatch volume and finite quota, marginal w > 0 at the quota boundary.
   Relatedly, worker wall-time (37–969s measured!) enters no cost term at all, latency
   is a real resource and the paper's own F4 shows it scaling with task complexity.

### 2.3 The paid-worker regime: where the numbers fail

The breakeven table (III.3(2)) does not reproduce from (★). Breakeven requires
`T = (w/h)/(p(1−α)) − 1`:

| Claim in paper | Correct value (α=0.17) | Verdict |
|---|---|---|
| p=0.3, w/h=15 → T ≥ **57** | 59.2 | off (passes only for α ≤ 0.14; III.1 fixes α=0.17) |
| p=0.3, w/h=20 → T ≥ **15** | 79.3 | **fails by 5×**; also non-monotone (impossible) |
| p=0.5, w/h=15 → T ≈ **35** | 35.1 | ✓ reproduces |
| p=0.7, w/h=30 → T ≈ **61** | 50.6 | **fails by ~21%** (needs α≈0.31, contradicts α=0.17) |

The `15` for w/h=20 is arithmetically impossible under any α ∈ [0,1), breakeven T must be
increasing in w/h at fixed p and α. Two of four published breakeven numbers are wrong, one
fatally so. These are exactly the numbers the abstract's "15× the hub" claim leans on.

### 2.4 The free-lane corollary: true in the model, overstated as economics

Within the model, `w/h = 0 < p(1+T)(1−α)` for all p > 0, T ≥ 0, α < 1, correct as algebra.
But: (i) with ε retained, free-lane dominance requires `(1−α)S(1+T) > ε(1/p−1)`; for large S
and patient sessions this is easy, but for tiny artifacts or tight verification budgets it fails -
so "cannot lose" needs a floor condition the paper states only inside III.2 and never carries
into corollary (1). (ii) The corollary has no economic content while w/h = 0 is a rationed
quota rather than a price (§2.2 point 5). (iii) Most importantly, the corollary is *derivative*:
the paper's own adversarial strike (`novelty_strike.md`, C2) concedes it is "a trivial corollary
of C1's own model." Publishing it as one of three headline consequences invites the exact
review this sentence contains.

### 2.5 The 1/α lifespan multiplier: the cleanest result, and still wrong as stated

`N_del/N_in = 1/α ≈ 5.9` is correct arithmetic given its premises, and the "lifespan, not
cost" reframing is the paper's best single idea. Three problems:

1. **Budget-denominator inconsistency.** If K is measured in hub *context chars*, then
   inline artifacts consume S and delegated artifacts consume αS, fine. But then the
   inline counterfactual is wrong in the other direction: an inline hub that writes S chars
   also necessarily carries its working context (tool transcripts, drafts-in-progress). The
   paper's own F5 admits inline turns carry full tool transcripts (75.6% of hub traffic is
   raw tool output!). If inline work costs ≈ S + tool traffic while delegated work costs
   αS + verification traffic, the true ratio is not 1/α but approximately
   (S + τ_inline)/(αS + τ_del), which for the paper's own numbers (τ dominates: 17.39 MB
   hub traffic vs 18.8 KB admitted artifacts) is nowhere near 1/α. **The 1/α law and the
   paper's own logbook contradict each other on which term dominates the budget.**
   The honest statement is: 1/α is a lower bound on the artifact-ratio under a
   tool-transcript-free assumption that the paper's own F3 shows to be wildly
   counterfactual.

2. **α is not a constant and the paper proves it.** α ranges over [0.09, 0.19], a 2.1×
   range across four waves, yet 1/α is promoted to a "law" with "≈ 6×" as the headline.
   The multiplier is 5.3× at α=0.19 and 11.1× at α=0.09. Fine as a bound; wrong as a
   constant. The abstract's "session-lifespan multiplier 1/α" without a variance statement
   will not survive review.

3. **Survivorship of the admitted set.** N_del = K/(αS) counts admitted artifacts, but
   useful work requires *accepted-and-kept* artifacts; rejected attempts consume worker
   time and ε but no K, agreed, yet *accepted-then-superseded* artifacts (rewrites,
   the INC-001 quarantine restore) consume K twice. No term accounts for admission
   churn.

### 2.6 The Jevons / verification-scarcity claim: coherent direction, missing mechanism

The claim: as w→0, dispatch volume expands until hub verification bandwidth binds; hence
verification is "the scarce factor" and verification-as-a-service is the primary economic
relationship. Assessment:

- **The directional claim is coherent and un-occupied.** I verified arXiv:2610.01231
  ("Judgement in the Age of Jev") exists and indeed formulates a *conditional* Jevons
  hypothesis for machine evaluation, explicitly leaving scarcity-vs-abundance open. The
  paper's positioning (its claim adds the hard budget K and the binding direction) is a
  fair delta. Cite-and-differentiate is done correctly in the novelty audit for this claim.
- **But the paper never derives that verification binds.** What would binding look like?
  A queue: dispatch arrival rate λ·(verification cost per artifact) ≥ verification capacity.
  The paper has neither λ (dispatch arrival/volume) nor per-artifact verification cost c_v
  in its cost model, verification appears only as the α admission ratio, which is a
  *filter ratio*, not a capacity. K (context budget) is a *storage* constraint; Jevons
  rebound is a *throughput* claim. Storage binds yield (artifacts per session-lifetime);
  throughput binds rate (artifacts per wall-hour). The paper's figure draws K as the
  bottleneck while the text claims verification bandwidth is the scarcity, these are
  different scarce factors and the paper conflates them. The measured t_w (37–969s) and
  F4 (duration scales with message count) actually suggest *latency*, not verification,
  is the binding operational constraint in their own institution.
- **No demand elasticity, no rebound proof.** Jevons requires output-demand elasticity
  > 1 (or the relevant substitution condition). The paper asserts dispatch volume
  "explodes" under free cognition but its own data show 14 dispatches in a day, an
  existence proof of delegation, not of a rebound. One sentence of elasticity formalism
  (or even a back-of-envelope demand curve) would upgrade this from gesture to claim.

**Verdict on Jevons:** economically suggestive, mechanism-incomplete, and the K-vs-
bandwidth conflation is a real error, not a nitpick, because the figure encodes it.

---

## 3. Part III math file (part3_math.md): line-by-line audit

1. **III.1**, α = 3853/22824 = 0.1688 ✓ (paper: ≈0.17). But III.1 presents one wave's α
   while the abstract claims α ∈ [0.09, 0.19] and RESULTS.md's total is α = 0.137. The
   "measured" α in the model's flagship table is the *most favorable* wave for the 1/α
   claim among the first three (0.17 → 5.9×), and the body-text multiplier "≈5.9" inherits
   that choice. RESULTS.md's own "0.16" in "What we can show a reader" matches *no*
   computed table value (0.1688, 0.137, 0.19, 0.14, 0.09), a fifth inconsistent α. RESULTS.md
   also contains "Total (3 waves, 12 dispatches)" above a 4-row table (4 waves); the N=6
   wave's "6" rows vs. "12 dispatches" claimed in the total row; and p̂ stated as 7/7,
   then 13/13, then 14/14 in three places against the abstract's 14/14 with the intro
   saying nothing. Individually small; collectively a discipline problem.
2. **III.2**, cost laws correct as written (see §2.2 for missing stock effect). Note
   C_in double-counts nothing but omits the hub's *drafting* compute under inline (the
   hub's own output tokens to write S are h·S more), wait, it doesn't: (1+T) includes
   the write turn. ✓. But it *under-counts* inline tool usage (F5's point) and *over-counts*
   symmetrically for delegation (workers' tool calls are free only at w=0). State it.
3. **III.3(1)**, algebra ✓, floor condition missing (§2.4).
4. **III.3(2)**, **two of four numbers fail reproduction** (§2.3). The w/h=20 row is
   impossible; the p=0.7 row needs a different α than the one III.1 fixes.
5. **III.3(3)**, 1/0.17 = 5.88 ✓; "≈5.9" ✓; but see §2.5 for denominator and variance
   problems. RESULTS.md's "1/α ≈ 5.9–7.1×" implies α ∈ [0.14, 0.17], silently dropping
   the α=0.09 wave that the abstract trumpets.
6. **III.4**, the control-law mapping is assertion, not derivation. "The optimal control
   law that falls out of (★)", (★) is a static inequality; nothing in it generates
   *mandates* (which are prior constraints on the brief) or *registries* (which are
   state). At most, (★) rationalizes why you'd want measurable p and bounded ε.
   Claiming the four-layer anatomy is "re-derived" is the paper's most overclaimed
   sentence; the novelty audit's own C5 directive ("do NOT claim the anatomy itself as
   new") is violated by Part III.4's closing paragraph.
7. **III.5**, threats section is better than average for a position paper but misses the
   two that matter: p endogeneity (§2.2.3) and free-tier quota shadow pricing (§2.2.5).
8. **III.6**, honest about n; good instrument design. p̂ = 14/14 = 1.00 stated as a
   confidence *lower bound of 1* is a small-sample joke an economist must flag: with
   p truly 0.9, P(14/14) ≈ 0.23, the data are consistent with p = 0.9. Report a
   Clopper–Pearson interval: 14/14 → 95% CI [0.785, 1.0]. The paper's own framing
   ("accumulating instrument, not a result") is right; the abstract's use of "p̂ = 14/14"
   as evidence is not.

---

## 4. Novelty audit cross-check (citations verified against live arXiv API)

I resolved all 10 IDs the paper's audits lean on. **All 10 exist and match their claimed
titles/venues.** Spot-checks against the claims made:

| ID | Claimed as | Verified content | Matches paper's characterization? |
|---|---|---|---|
| 2305.05176 | FrugalGPT | "How to Use Large Language Models While Reducing Cost and Improving Performance" | ✓, cascade over *paid* tiers; per-query. Paper's delta (no per-turn re-payment) holds. |
| 2406.18665 | RouteLLM | "Learning to Route LLMs with Preference Data" | ✓, per-query routing among paid models. Delta holds. |
| 2610.01231 | "Age of Jev" | "Judgement in the Age of Jev: From Evaluation Scarcity to Evaluation Abundance" (Jev/TypeSafe AI) | ✓, and the paper's stated asymmetry (Age-of-Jev leaves scarcity-vs-abundance conditional; this paper claims the binding direction) is *accurate*. |
| 2501.07913 | Governing AI Agents | exists, governance framework | ✓. |
| 2407.18074 | Principal-Agent RL | "Principal-Agent Reinforcement Learning: Orchestrating AI Agents with Contracts" | ✓, contract-based orchestration; paper's delta (no cost-threshold dominance law) holds. |
| 2610.06069 | Attention Tax (strike's most-dangerous) | "Attention Tax, Handoff Tax: A Stylised Model of When Multi-Agent LLM Systems Help", crossover conditions, measured context-degradation curve, predicts-then-confirms at depth 10/20/50/100 | ✓, and it is **more dangerous than the paper admits**: it is a *tested* model of the same tradeoff. The residual delta (multiplicative (1+T) compounding vs. per-step crossover) is real but thin for a headline claim; this paper's model is untested by comparison. |
| 2608.18232 | Contracting for LLM Delegation | moral hazard, model+effort choice | ✓ |
| 2603.22367 | RES O(1)-context | "Reasoner-Executor-Synthesizer" | ✓ |
| 2503.05816 | Jevons/VES labor | matches | ✓ |
| 2610.01756 | SoK agent econ infrastructure | "SoK: Decentralized Agent Economic Infrastructure" | ✓ |

Citation integrity: strong. Every ID I checked is real and characterized fairly, with one
exception: the DRAFT's §VIII table calls 2603.22367 "paging, O(1)-context archs", it is an
executor architecture, not paging (paging is MemGPT 2310.08560, correctly cited elsewhere).
Minor.

**However**, the audit's verdict logic does not survive its own evidence. The strike rates
all six claims "THREATENED" and concedes C2 is trivial, C6 "very thin," and C1's neighbor
is a *validated* version of the same tradeoff. "0 claims DEAD; synthesis defensible" is the
right conclusion reached from the right evidence, but the DRAFT's abstract still sells C1–C3
as headline laws without citing the attention-tax/handoff-tax lineage, Related Work
(§II) covers protocols/standards/simulations and none of the six economics neighbors.
The paper's own positioning directive #2 ("Related Work must cite the strike's full set") is
unimplemented in the draft under review.

---

## 5. Internal consistency (sampled defects)

- Abstract: "46,264 chars... ~14% entered" vs. Part III: 22,824 produced, 3,853 admitted
  (16.9%). 3,853/46,264 = 8.3%, not 14%. One of the two denominators is wrong, or two
  different experiments share one sentence. [RESULTS.md total: 137,278 produced,
  18,800 admitted = 13.7%, closest to the abstract, but then 46,264 matches nothing.]
- Abstract: α ∈ [0.09, 0.19] (4 waves) vs. III.1's single-wave α = 0.17 carrying the
  headline multiplier.
- p̂: 14/14 (abstract, III.6) vs. 7/7 (RESULTS F2) vs. 13/13 (RESULTS update). The
  accumulation story is plausible but the paper never reconciles the counts.
- RESULTS.md F3: 75× corrected to 2× / 185× depending on denominator, the
  correction is commendable and is itself evidence for the paper's verification thesis,
  but the abstract still carries "75× measured asymmetry," which the paper's own
  instrument disowned.
- Intro: "delegation delivers approximately 6× more institutional work", stated as a
  measured finding; it is a model implication conditional on α constancy (§2.5).

---

## 6. Assessment

**What is genuinely good.** (a) The paper's best ideas are real: persistent-attention
amortization as the reason delegation compounds in value over a session; the reframing
of context management as lifespan extension; the reflexivity of the instrument. (b) The
citation hygiene is unusually good, all 10 spot-checked IDs are real and fairly
characterized; two adversarial self-audits were run and published alongside the paper.
(c) The incident log (INC-001) is the kind of negative evidence most position papers
lack. (d) The honest threats section and the "accumulating instrument" framing are
welcome.

**What fails.** (a) The quantitative core does not survive verification: two of four
breakeven numbers are wrong (one impossibly), the flagship α varies 2.1× while its
reciprocal is sold as a constant law, the abstract's own production/admission numbers
are mutually inconsistent three ways, and the escalation-extended inequality in IV.5 is
dimensionally incoherent. (b) The central mechanism-design opportunity, needles as
contract instruments with endogenous p and moral hazard, instantiated by the paper's
*own incident*, is missed entirely; the paper cites Jensen & Meckling and then models
the world where their theory is unnecessary. (c) The Jevons claim conflates storage (K)
with throughput (verification bandwidth), asserts rather than derives bindingness, and
the paper's own latency data point elsewhere. (d) Related Work omits every economics
neighbor the paper's own audits found, several of which (esp. 2610.06069) are closer
to the core model than anything in §II.

For an arXiv position paper, the bar is not "flawless" but "no claim a hostile reader can
kill in ten minutes." Sections 2.3, 2.5.1, and §5 above are each ten-minute kills of
currently load-bearing numbers. The fixes are mostly one afternoon: recompute the
breakeven table from (★), state 1/α as a bound with the α range, reconcile the three p̂
counts and the two production denominators, fix IV.5's units, add the stock-effect
caveat to the multiplier, add a queueing statement (or drop "binding") to III.4, and pull
the six economics neighbors into §II with the audit's own delta sentences.

**Recommendation: Major revision.** The skeleton is publishable as a position paper with
measured economics; the current draft's numbers are not.

**Score: 4/10** (theory core sound but trivial; quantitative presentation fails
reproduction; novelty real but mispositioned against its own audit evidence).

---

## 7. Top findings by severity

1. **[BLOCKER] Breakeven surface does not reproduce; one entry arithmetically
   impossible.** III.3(2): w/h=20 at p=0.3 claimed T≥15; (★) requires T≥79.3 at α=0.17
   (T≥76.4 even at α=0.13). Non-monotone in w/h ⇒ transcription or derivation error
   upstream of publication. p=0.7/w/h=30 claimed T≈61, reproduces only at α≈0.31 -
   contradicts III.1's own α=0.17 (correct value T≈51). Two of four headline numbers
   supporting the "15×" abstract claim are wrong. Recompute from (★) and show the
   formula in the table.

2. **[BLOCKER] The paper's own measurements contradict its own laws' assumptions.**
   (i) 1/α is presented as a stable multiplier while the paper's four waves give α ∈
   [0.09, 0.19] (multiplier 5.3–11.1×) and RESULTS.md simultaneously claims "≈5.9–7.1×"
   (dropping α=0.09), "0.16" (matches no table value), and total α=0.137. (ii) The
   abstract's "46,264 chars, ~14% admitted" is consistent with none of: 3,853/22,824
   (16.9%), 18,800/137,278 (13.7%), or 3,853/46,264 (8.3%). (iii) F3's hub:worker
   asymmetry of 75× was retracted by the paper's own corrected instrument (2× or 185×
   by denominator) but the abstract still prints 75×. (iv) IV.5's inequality
   `w/h < p(1+T)(1−α) − ε·κ(η)` subtracts a char-denominated term from a dimensionless
   ratio. Each is a ten-minute hostile kill of a load-bearing number.

3. **[MAJOR] The moral-hazard channel the paper cites is the one it models away, and
   its own incident proves the omission.** Acceptance probability p is endogenous to
   needle design, yet (★) treats p as exogenous and free to raise. INC-001 (worker
   satisfied needle while violating mandate; variant needle signature) is textbook
   gaming of a low-informativeness contract, exactly the Jensen–Meckling/ Holmström
   failure the paper cites Jensen & Meckling to invoke. The 14/14 statistic is
   uninterpretable without an informativeness control (report a Clopper–Pearson CI:
   [0.79, 1.0] at n=14; P(14/14 | p=0.9) ≈ 0.23). The fix is also the opportunity: model
   needle choice as contract design (informativeness vs. verification cost), and the
   paper graduates from arithmetic to mechanism design.

**Minor findings (non-exhaustive):** 2603.22367 described as "paging" (it is an executor
architecture; paging is MemGPT) · III.4's "optimal control law" claim overreaches a static
inequality (audit directive #3 violated by Part III itself) · free-lane corollary needs the
ε-floor condition stated in III.2 · free-tier w=0 is a rationed quota, so marginal w > 0 at
the quota boundary; latency (t_w up to 969s measured) appears in no cost term · Jevons
claim needs a demand-elasticity or queueing statement; storage-K and verification-
throughput are different bottlenecks and the figure encodes the confusion · "cannot lose"
rhetoric should be "dominates under stated floor conditions" · Related Work omits all six
economics neighbors from the paper's own audits (2610.06069, 2608.18232, 2407.18074,
2610.01231, 2503.05816, 2601.23211) despite positioning directive #2 · §II still contains
raw worker-draft markers ("RELATED WORK / EXISTING SYSTEMS (plain text draft, ~900
words)") and session-resume strings ("hermes --resume 20261007_...") that must be
stripped before any release.

---

*Reviewer B, 2026-10-08. Arithmetic independently reproduced; all citation checks run
live against export.arxiv.org on 2026-10-08.*
