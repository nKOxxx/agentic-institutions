# Adversarial novelty strike (wave 2, DeepSeek, 25 tool calls, 2026-10-07)

I've verified all leads and chased the neighbors. Here is my adversarial prior-art strike report.

═══════════════════════════════════════════════════════
ADVERSARIAL PRIOR-ART STRIKE, VERDICT PER CLAIM
═══════════════════════════════════════════════════════

**C1, Delegation dominance under persistent hub attention** → **THREATENED**
- arXiv:2610.06069 "Attention Tax, Handoff Tax: A Stylised Model of When Multi-Agent LLM Systems Help", formalizes EXACTLY the tradeoff you attack: decomposition resets context (attention cost avoided) vs. handoff tax (your w/h), derives a crossover condition, *empirically validates* it (measured context-degradation curve, predicts-and-confirms crossover at depth 10, wins at 20/50/100). This is your core mechanism, already built and tested.
- arXiv:2608.18232 "Contracting for LLM Delegation: Moral Hazard in Technology and Effort Choice", agent picks model+effort from a cost-capability suite; threshold reward share triggers switching.
- Residual delta: the *compounding* form, context repaid every **remaining** session turn (multiplicative T in (1+T)), a closed-form (w/h) < p(1+T)(1−α) dominance threshold. Attention Tax uses a **per-step** crossover, not the remaining-turn compounding; that multiplication is genuinely absent.

**C2, Free-tier worker offload as primary economics (w/h=0)** → **THREATENED**
- Closest: arXiv:2608.01507 (grep-search-by-subagent, cheap/zero-cost subagents for offload) + 2610.06069.
- Honestly: w/h=0 ⇒ delegation wins for any p is a **trivial corollary of C1's own model**, not an independent result. The residual delta is only the *institutional* framing of free API tiers as a standing distributed offload pool and the claim it's Primary (not incidental) economics. Thin.

**C3, Context budget = session lifespan; 1/α work per session-lifetime** → **THREATENED**
- Closest: 2610.06069 (context-degradation curve = lifespan accounting); arXiv:2604.26102 SWE-Edit (context-coupling problem); arXiv:2603.22367 RES (static O(1) context via deterministic executor, an *alternative architecture* to delegation); arXiv:2605.23071 Efficiency Frontier (amortized/reuse cost modeling for context strategy).
- Residual delta: the *identity* "session lifespan ≡ context budget" + the closed-form 1/α work-multiplier as a session-lifetime accounting economy. Prior work treats context reduction as cost/performance optimization, not a lifespan-accounting identity with a factor. Narrow but real.

**C4, Verification-bandwidth scarcity + Jevons rebound** → **THREATENED**
- arXiv:2610.01231 "Judgement in the Age of Jev: From Evaluation Scarcity to Evaluation Abundance", DIRECTLY on your question: integrates rebound economics, cheap prediction, decision allocation; asks when cheap evaluation substitutes vs. redistributes judgement. Note it is literally about your institution (Jev/TypeSafe AI). It does **not** assert verification *is* the binding bottleneck, it leaves scarcity-vs-abundance as a **conditional open question**.
- arXiv:2503.05816 (Jevons paradox in AI labor, VES), arXiv:2610.04744 (verification costs budget in robot teams), arXiv:2607.07207 (bandwidth-bound decode / memory scarcity).
- Residual delta: the *specific claim* that under delegation dominance, verification (not inference) is THE binding hub bottleneck, plus the delegation-specific Jevons (dispatch-volume explosion ⇒ hub verification binds). The Jev paper occupies the space but argues the opposite direction and proves nothing; your directional claim is un-occupied.

**C5, Mandates/registries/constraints/escalation as cost-optimal control law; agent orgs; A2A, ERC-8004** → **THREATENED**
- Closest: arXiv:2608.18232 (cost-optimal contract theory + tech-switching threshold, moral hazard); arXiv:2407.18074 Principal-Agent RL with contracts; arXiv:2501.07913 Governing AI Agents; arXiv:2609.05531 When Agent Governance Helps (boundary condition: governance gated by spare capacity); arXiv:2603.00318 AESP + arXiv:2507.07901 Trust Fabric (agent-machine-money / A2A economics protocols).
- Note: A2A (Google) and ERC-8004 (Ethereum) are **industry standards you cite**, not novel.
- Residual delta: the *economic-equivalence argument*, the formal claim that institutional control structures (mandate/registry/constraint/escalation) ARE principal-agent-optimal mechanisms for delegated cognition, i.e. the "institutions not analogy" synthesis. The constructs exist everywhere; the *equivalence proof* is the delta.

**C6, Reflexive methodology: evidence generated live by the institution studied** → **THREATENED (edge of DEAD)**
- Closest: arXiv:2610.01231 is *itself* the reflexive move, a paper whose object of study is the very institution being examined.
- Residual delta: only the *live-instrumentation* claim, evidence produced in real time *by* the studied institution to generate the paper's own results. The Jev paper treats Jev as an external provocateur and generates **no** live institutional evidence. That distinction is real but very thin.

═══════════════════════════════════════════════════════
MOST-DANGEROUS-PAPER
═══════════════════════════════════════════════════════
**arXiv:2610.06069, "Attention Tax, Handoff Tax: A Stylised Model of When Multi-Agent LLM Systems Help"**
It independently formalizes your core C1/C3 mechanics (context-reset savings vs. handoff cost), derives the crossover, and, unlike a position paper, measures the curve and *predicts-then-confirms* delegation wins at depth 10–100. It doesn't have your compounding (1+T) term or free-tier degeneracy, but it owns the foundational tradeoff, so any claim framed as "delegation dominance under hub attention" must cite it or it reads as unoriginal.

═══════════════════════════════════════════════════════
WHAT-STILL-OURS (honest)
═══════════════════════════════════════════════════════
The unique combination is the **unified closed-form account**: the compounding decomposition-dominance inequality (w/h) < p(1+T)(1−α) where hub context is re-paid every *remaining* turn, its free-tier degenerate case (w/h=0 ⇒ always win), the session-lifespan≡context-budget identity with its 1/α work-multiplier, plus the *directional* adversarial claim that verification bandwidth (not inference) is the binding bottleneck under delegation dominance, and the institutions-as-optimal-control equivalence argument. Each component is partially anticipated (Attention Tax = per-step tradeoff; Contracting-for-LLM-Delegation = contract; Jev paper = evaluation abundance question), but no single work combines compounding repayment + free-tier degeneracy + verification-binding asymmetry + institutions-as-control-law into one model with a provable threshold condition. That synthesis is your defensible novelty, but only if C1's formula and C4's directionality are foregrounded and every relation above is cited.

Status summary: all 10 leads + 11 neighbor hits verified live this session via arXiv (no UNVERIFIED); 0 claims DEAD, all 6 THREATENED, none intact on its own.

NOVELTY-VERDICT-OK