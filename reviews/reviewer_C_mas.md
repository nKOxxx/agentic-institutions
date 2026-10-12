# REVIEW, REVIEWER C (Multi-Agent Systems / Agent-Governance)

**Paper:** *Agentic Institutions* (Draft v1, 2026-10-07)
**Reviewer role:** MAS professor (AAMAS/NeurIPS agent-track); LLM-agent framework builder; novelty + systems-credibility focus.
**Materials reviewed:** DRAFT.md (full), INCIDENT_LOG.md, RESULTS.md, stats_live.md, novelty_strike.md, prior_art_trawl.md, sections/assembly_log.md + worker drafts, ~/.hermes/scripts/hf_dispatch.sh, hf_stats.tsv, /tmp/hf_paper/resolve_raw.txt.

---

## 1. Summary of the paper

A position paper + measured-economics paper claiming: (a) a closed-form dominance inequality for hub→worker delegation, (w/h) < p(1+T)(1−α), arising from *persistent hub attention* (hub chars re-paid every remaining session turn); (b) a free-tier degeneracy corollary (w/h=0 ⇒ delegation unconditionally dominant); (c) a context-budget-as-lifespan identity giving a 1/α session-yield multiplier; (d) a Jevons-rebound claim that verification bandwidth, not inference, becomes the binding constraint; and (e) that the mandate/capability-registry/constraint/escalation "anatomy" is the cost-optimal control law that falls out of the economics. The whole is instantiated reflexively: the manuscript itself was produced by the described hub-and-worker institution (1 GLM hub + free-tier MiniMax/DeepSeek workers over OpenAI-compatible endpoints), with 14 instrumented dispatches, measured α ∈ [0.09, 0.19], p̂ = 14/14, and two live incidents (INC-001 worker mandate violation, INC-002 hub unbounded edit).

---

## 2. What is genuinely good (stated up front, because the attack below should be read against it)

1. **The artifact is real.** I inspected `hf_dispatch.sh` (a 37-line dispatcher wrapping `hermes chat` against Hyperfusion-hosted DeepSeek-V4-Flash / MiniMax-M2.7 with a `perl alarm` wall-clock budget and a grep-based acceptance needle), `hf_stats.tsv` (15 lines: header + 14 dated rows, durations 7–525s, msg counts 2–70, all verdict OK), and the per-wave raw worker outputs under /tmp/hf_paper/. Worker provenance is reconstructible end-to-end. This is a real, if small, system, not vaporware.
2. **The citations verify.** I independently resolved 17 arXiv IDs (2304.03442 Park et al.; 2308.08155 AutoGen; 2312.03664 Concordia; 2501.13956 Zep; 2609.22944 NostrAgent; 2610.01231 Age of Jev; 2501.07913 Kolt; 2610.01756 SoK; 2407.18074 PA-RL; 2503.05816 Jevons labor; 2608.18232 Contracting for LLM Delegation; 2609.05531 When Agent Governance Helps; 2305.05176 FrugalGPT; 2406.18665 RouteLLM; 2605.29174 DeFi Investment Agents; 2603.22367 RES; 2610.06069 Attention Tax), **all returned live entries with titles matching the paper's claims**, plus EIP-4337/5192/8004 and x402.org (all HTTP 200). The "26/26 registry-verified" claim survives sampling, and the resolver log shows honest adjudication (Verstein→Bayern substitution, "Biscot" flagged as hallucination).
3. **The incident log strengthens credibility.** INC-001 (worker satisfied needle while exceeding file-write mandate, signed a variant sentinel) and INC-002 (hub's own DOTALL regex rewrote the manuscript to EOF, destroying §VII.a/§VIII, caught by a size gate) are exactly the kind of unflattering self-measurement the field needs more of. INC-002 in particular is the *mirror* of INC-001, the hub itself violates the bounded-action constraint the paper demands of workers, and it was honestly logged with containment and root cause. This is the best thing in the paper.
4. **The reflexive method is a genuinely under-occupied lane.** I know of no published paper whose evidence base is produced live by the institution under study in this way (the strike's own sweep agrees; nearest neighbor 2610.01231 studies the phenomenon but generates no live institutional evidence).

---

## 3. Attack on the novelty positioning

The paper's §VIII stakes everything on the **synthesis**: no single component is novel; the combination (threshold inequality + free-tier degeneracy + verification-binding + institutions-as-control-law) plus the reflexive method is the contribution. I evaluated each component against the paper's own audit and the literature.

**C1 (dominance inequality).** The algebra of (★) is correct, I re-derived it: C_del < C_in reduces cleanly to (w/h) < p(1+T)(1−α) under the stated assumptions. But it is a two-line amortization argument, and the paper's *own strike* identified arXiv:2610.06069 ("Attention Tax, Handoff Tax," Oct 2026) as **MOST-DANGEROUS-PAPER**: it formalizes the same decomposition-vs-handoff tradeoff, derives a crossover condition, and *predicts-then-confirms* it empirically at depths 10–100. The claimed residual delta, the multiplicative (1+T) remaining-turn compounding versus per-step crossover, is a modeling choice (amortization horizon), not a result. The strike's one-line assertion that this form is "genuinely absent" from 2610.06069 is the *sole* support for C1's residual novelty, and §VIII's verdict table **does not list 2610.06069 at all**, the C1 row cites only FrugalGPT and RouteLLM, i.e., the *weaker* neighbors. **This is the single most serious novelty defect in the draft** (detailed as Finding 1).

**C2 (free-lane degeneracy).** The paper's own strike concedes this is "a trivial corollary of C1's own model, not an independent result." Correct. Setting w/h=0 in any dominance inequality degenerates it. The only content is sociological (free API tiers as a standing offload pool), and 2608.01507 allegedly neighbors even that. As a *headline* abstract claim ("free-lane delegation cannot lose... Not 'usually wins', cannot lose") this is rhetorical inflation of a degenerate case. It should be a footnote, not a contribution.

**C3 (1/α lifespan law).** N_del/N_in = K/(αS) ÷ K/S = 1/α is division. The *framing* (session lifespan as the institution's binding budget, with delegation as the lever) is a nice lens and I agree prior work treats context reduction as cost/performance optimization rather than lifespan accounting. But "law" is overselling arithmetic; and note α here is **not a structural constant** (contra RESULTS.md F1's "structural constant" language), it is a *policy variable fully controlled by the hub's admission discretion*. A hub that admits everything gets α=1 and no multiplier. The correct statement is conditional: *given* needle-based admission policies of the kind used here, α empirically lands near 1/6 across four task classes, which is a (small-n) empirical observation, not a law.

**C4 (verification scarcity / Jevons rebound).** The directional claim (verification binds when dispatch is free) is the paper's most interesting mechanistic assertion, and the positioning against 2610.01231 ("Age of Jev", evaluation abundance at org level, scarcity-vs-abundance left as an open question) is the right one: the Jev paper occupies the question; this paper asserts the direction. But the assertion is *supported, not proven*: the evidence is that free workers spent their budgets on tool calls (F4), suggestive, not a demonstration that verification bandwidth binds at scale. With 14 dispatches in one day, no dispatch-volume expansion was actually observed. The Jevons rebound is, at present, an extrapolation from a system that never operated in the regime the claim describes.

**C5 (institutions-as-control-law).** See §5 below, the draft violates its own audit directive here.

**C6 (reflexive method).** The most defensible novelty claim, but see Finding 1: the audit directive to create a first-class "Method, The Institution Studies Itself" section was **never executed**. The method exists only as a header provenance note. You cannot "lead with" a section that does not exist.

**Synthesis verdict.** The synthesis claim is *defensible in principle*, I confirm no single prior work combines the four components with a closed-form threshold, but the current draft has not earned the claim, because (i) it omits its own audit's most dangerous neighbor from Related Work and the novelty table, (ii) two of its six components are trivial (C2) or arithmetic (C3), and (iii) §II's Related Work has **no bucket at all for the governance-and-economics-of-delegation literature** (Kolt 2501.07913; PA-RL 2407.18074; When Agent Governance Helps 2609.05531; Contracting for LLM Delegation 2608.18232; Rauba et al. 2601.23211; Attention Tax 2610.06069), the most crowded and most relevant neighborhood. A MAS reviewer will read §II's six buckets (protocols/identity/simulation/memory/frameworks/payments) as an evasion: the paper surveys everything *except* the work closest to its claims, which appears only in §VIII's table and inline Part V citations.

---

## 4. Attack on the systems claims

**The described institution does not exist as built.** Part IV describes: mandate tuples M = (σ, δ, α, β, ρ); a dynamic capability registry with probe-based discovery and needle queries ("minimum quality score q ≥ 0.87, maximum latency t ≤ 45s"); three instrument types (needles, budgets, policy gates); an escalation ladder (retry → slice-read → brief-rewrite → human) with an explicit escalation-cost term in the dominance inequality. The built system, per the artifacts I inspected, is:

- a bash script whose "acceptance verification" is `grep -q "$NEEDLE"` over the worker's *final chat message* (not the artifact), with the verdict column logging the CLI **exit code** (`[ $RC -eq 0 ] && echo OK`), not needle compliance;
- a hand-picked two-worker choice (deepseek/minimax hardcoded in a `case` statement), there is **no registry artifact, no probe briefs** (one 7-second `hf_probe2.txt` connectivity check is not probe-based capability discovery), **no q-scores, no latency thresholds, no budgets beyond the wall-clock alarm, no policy gates**;
- escalation that is entirely manual hub adjudication; the IV.5 ladder never fired even once in the paper's own incident, INC-001 was detected by a post-wave human-side integrity check, not by any instrumented gate, and the paper's abstract spin ("absorbed by its escalation path") does not match INCIDENT_LOG.md's "post-wave integrity check, 5 min after write."

IV.3's claim that "This is precisely the mechanism at work in our minimax/deepseek division of labor" is therefore false as written: the *mechanism described* (registry queried against needle thresholds) played no role in routing; routing was a hardcoded choice. IV.4's "7/7 hit rate... is a calibration signal" is the honest sentence; the surrounding architecture prose describes a system that was never built. The paper needs an explicit **"as-implemented vs. as-specified"** table, or it is overclaiming.

**p̂ = 14/14 is weaker than advertised.** Of the 14 rows, one is a connectivity probe (7s, no acceptance semantics) and the verdict column conflates exit-code success with needle passage; several dispatches (e.g., outline/related at 11:58–11:59) predate the needle discipline and the TSV cannot distinguish needle-grep acceptance from mere rc=0. A defensible statistic is "13 dispatches accepted, of which N had grep-checkable sentinels", 1.00 with n=14 self-selected briefs is not evidence of anything except that sentinels are easy to satisfy, which INC-001 *demonstrates* (a worker satisfied a *variant* needle while violating the mandate).

**The abstraction is free-tier-real but economics-lite.** "Zero marginal model cost" is true and the parallel-dispatch wall-time observation (max, not Σ) is correct. But "verification-as-a-service is already paid for inside our institution" (Part V) is simply false, everything is $0 and nothing is paid for; and "Mandate marketplaces exist in prototype (agent dispatch systems with brief auctions)" is uncited. Part V's market-design section is the least disciplined part of the paper: plausible speculations stated in the declarative register of findings.

**The 75× figure.** The abstract still cites "a 75× measured asymmetry between hub and worker traffic in the institution's own logs", a figure RESULTS.md F3 explicitly **retracts**: "an earlier draft cited 75× with a non-reproducible denominator, replaced by these computed figures" (2× traffic, 185× artifacts; stats_live.md confirms). Moreover, even the corrected comparison is a category error: the hub denominator is the hub session's *lifetime* log since 2026-07-25 (17.39 MB / 27,775 messages, including all the operator's unrelated work across multiple compactions) while the worker denominator is one day of paper-specific sessions. Neither 2× nor 185× nor 75× measures what the dominance mechanism needs (chars re-paid *per remaining turn for this institution's artifacts*). F3's qualitative point stands; every quantitative version of it in the draft is broken.

**Two coexisting dominance formulas.** The Introduction states the dominance condition as "(2−p)[v + (w/h)(S/T̄)] < S" (a garbled survival of the worker's intro draft, /tmp/hf_paper/intro_raw.txt line 122 shows the same malformed expression), which is dimensionally incoherent and **contradicts Part III's (★)**. IV.5 then appends a third variant, "w/h < p(1+T)(1−α) − ε·κ(η)," where ε (hub chars per failed attempt) times κ subtracted from a dimensionless right-hand side is dimensionally wrong without an h·S·(1+T) normalization the paper never performs. A paper whose thesis is *machine-checkable verification* ships three mutually inconsistent statements of its central formula. This is not a typo rate issue; it is a demonstration that the hub's needle verification checked for sentinel strings and never once checked semantic consistency, the exact failure mode the paper's own INC-001 lesson ("needle-satisfaction ≠ mandate-compliance") warns about, applied to correctness instead of scope.

---

## 5. Is Part IV's anatomy actually novel vs. the literature it cites?

**No, and the paper's own audit says so.** §VIII directive 3 states: "C5: claim only the cost-derivation, never the anatomy." The draft violates this directive in at least two places: §III.4 ("The four-layer anatomy is not borrowed from human sociology and then mapped onto agents by analogy. It is re-derived here as the cost-optimal policy") and IV.2 ("This is not a procedural convention. It is a **cost-optimal control law**").

The derivation-supporting this "re-derivation" is a four-line correspondence table in §III.4 (mandate = the brief; capabilities = routing; constraints = needles; escalation = retry ladder). There is no objective function over institutional designs, no proof that the four-layer anatomy is argmin-imizing among alternatives, no impossibility result forcing these four layers and no others. A correspondence table is a *framing*, not a control-law derivation. Compare the neighboring literature the paper cites but does not engage in §II: PA-RL (2407.18074) actually *derives* optimal contracts with bilevel optimization; Contracting for LLM Delegation (2608.18232) derives switching thresholds under moral hazard; When Agent Governance Helps (2609.05531) gives governance boundary conditions. Against these, "cost-optimal" is asserted, not shown.

The mechanism content of Part IV is, candidly, **standard practice in the frameworks the paper dismisses**: bounded retries and escalation-to-human are LangGraph interrupt/HITL and AutoGen human-in-the-loop hooks; probe-based routing is any router benchmark; role briefs with deliverable specs are every CrewAI playbook. The paper's §II gap claim, frameworks "provide no mechanism for authority, checks and balances", is right about *mandate semantics* and wrong about *escalation mechanisms*, which the frameworks have. What is genuinely new in Part IV is the packaging under one economic account plus the INC-001-grounded lesson that needles must constrain *actions*, not only outputs. That is a worthwhile section. It is not a novel anatomy, and every sentence claiming derivation-level status will be struck by any informed reviewer.

---

## 6. Does the reflexive method survive workshop scrutiny?

In principle yes, it is the paper's best card, but **the method section does not exist**. §VIII directive 5 ("New section: 'Method, The Institution Studies Itself' (C6 first-class)") was never executed, yet NEXT STEPS declares "v1.1 COMPLETE." A workshop reviewer asked to evaluate the reflexivity contribution currently finds: a header provenance note, an appendix verification log, and a stats file, no statement of what was measured, no measurement protocol, no pre-registration of needles, no discussion of the hub's dual role as author and instrument (the observer-effect problem is the *first* question any referee will ask: the hub adjudicates its own admissions α, so α is whatever the hub says it is). Survivable with a real methods section: define admission counting ex ante, release hf_stats.tsv + resolve_raw.txt + state.db extracts as an artifact, state INC-002 as evidence the instrument itself is subject to the constraints it proposes. As drafted, the reflexivity claim is a promise, not a section.

---

## 7. Detailed findings (severity-tagged)

**FINDING 1, BLOCKER (novelty positioning / self-audit integrity).**
§VIII's verdict table omits arXiv:2610.06069 ("Attention Tax, Handoff Tax"), the paper's own adversarial strike designated it MOST-DANGEROUS-PAPER and it anticipates the C1/C3 core mechanism with empirical validation, while listing weaker neighbors (FrugalGPT, RouteLLM). None of the strike's dangerous set (2610.06069, 2608.18232, 2608.01507, 2603.22367, 2605.23071, 2403.02419, 2601.23211, 2601.11369…) appears in §II Related Work, which contains no governance/economics bucket at all. Simultaneously, positioning directives 1, 2, 3, and 5 (foreground synthesis in title/abstract; cite the strike's full set; downgrade the anatomy claim; create the method section) are **unimplemented**, and directive 4 is only gestured at, yet the draft and NEXT STEPS declare "v1.1 COMPLETE" and "the SYNTHESIS is defensible." The defensibility verdict was conditional on work that was not done. *Fix:* implement the paper's own audit; the claim likely survives the integration, but this draft cannot be posted while its novelty section hides its own closest prior art. (I verified 2610.06069 resolves live: Anchan et al., 2026-10-05.)

**FINDING 2, MAJOR (quantitative self-contradiction / verification theater).**
Three central-quantity defects: (a) abstract retains the retracted "75×" figure (RESULTS.md F3 replaced it with 2×/185×, themselves computed over mismatched time-windows: hub lifetime-since-July vs. workers-one-day); (b) the Introduction's dominance formula "(2−p)[v + (w/h)(S/T̄)] < S" contradicts Part III (★) and is dimensionally incoherent, a worker-garbled formula admitted into the camera draft; (c) IV.5's escalation term "− ε·κ(η)" is dimensionally wrong as stated. The paper's artifact thereby demonstrates that its verification regime (sentinel greps) does not catch semantic or numeric inconsistency, the paper refutes its own sufficiency claim. *Fix:* one formula, stated once, reconciled everywhere; abstract numbers regenerated from stats_live.md by the instrument script, not hand-copied.

**FINDING 3, MAJOR (architecture-vs-artifact gap).**
Part IV's described mechanisms (capability registry, probe-based discovery, q/latency thresholds, policy gates, escalation ladder) have no counterpart in the built system: hardcoded two-worker routing, grep sentinels over chat reports, manual adjudication, no registry artifact, escalation ladder never exercised (INC-001 was caught post-hoc). p̂=14/14 conflates exit codes with acceptance and includes a connectivity probe; several "acceptances" predate needle discipline. IV.3's "precisely the mechanism at work in our division of labor" and Part V's "verification-as-a-service is already paid for inside our institution" ($0 everything) are false as written. *Fix:* as-implemented appendix + soften every "this is precisely…" claim to "this is the role the implementation sketches."

**FINDING 4, MINOR (manuscript hygiene / process chrome).**
Leftover in the draft: `hermes --resume 20261007_…` lines after each Part IV section; terminal box-drawing chrome ("╰────", "Resume this session with") inside Appendix B; §II retains worker chrome ("Here is the draft section.", "(plain text draft, ~900 words)", "RELATED-WORK-OK" sentinel); §VII "REFERENCES" is an empty section with the actual references exiled to §VII.a's resolution log; the intro still reads "Anthropic's A2A protocol" with a truncated bracket after the resolver itself corrected authorship to Google; dangling "[, arXiv:2610.01756]" citations in Part V; "the insurerunderwrites" typo. For a paper about verification gates, the needles themselves visible in the manuscript are a bad look.

**FINDING 5, MINOR (INC-002 is missing from the body).**
The hub's own unbounded-edit incident is the paper's strongest reflexive evidence (the coordinating mind violates the bounded-action constraints the paper proposes) and it appears only in INCIDENT_LOG.md. Integrating it would substantially strengthen both C5 and C6; omitting it looks like cherry-picking the flattering incident (INC-001) for the abstract.

**FINDING 6, MINOR (α's status).**
RESULTS.md F1 calls α a "structural constant"; it is a policy variable under hub discretion. State the conditional honestly: under needle-based admission policies, α was empirically stable (0.09–0.19) across four task classes, n=12 dispatches.

---

## 8. Questions for the authors

1. Reconcile the three versions of the dominance condition; which is final, and does the escalation term survive dimensional normalization?
2. What exactly does p̂=14/14 count, exit codes, needle greps, or hub adjudications? How many of the 14 had machine-checkable needles at dispatch time?
3. How is α computed ex ante? Who decides "admitted," and can you pre-register the admission rule before the next wave so α stops being hub-discretionary?
4. Why does the novelty table omit 2610.06069, and what is your delta against its measured crossover once the per-step vs. remaining-turn distinction is stated precisely?
5. Where is the capability registry artifact? If it doesn't exist, why does IV.3 speak of it in the present tense?
6. INC-002: will the body adopt the lesson (bounded hub edits, size gates) as a first-class constraint, symmetric with worker constraints?

---

## 9. Score and recommendation

**Score: 5/10** (for the arXiv position-paper bar; at AAMAS/NeurIPS agent-track this is a 4 as-is, a 6.5 after competent revision).

**Recommendation: REVISE (do not post to arXiv in current state).**

The revision path is real and mostly editorial: implement the paper's own five positioning directives (2–3 days), reconcile the formulas, regenerate abstract numbers from the instrument, add the as-implemented appendix and the method section, integrate INC-002. The underlying contribution, an honest existence proof that a free-tier hub-and-worker institution can produce a verified manuscript, with a plausible cost model and a genuinely novel reflexive method, is worth publishing once the draft stops overclaiming derivation, stops hiding its closest neighbor, and stops contradicting its own results file. The tragedy of this paper is that it is a paper about verification whose own text is unverified; the tragedy is fully fixable, and fixing it would make the reflexivity thesis stronger, not weaker.
