# Prior-art trawl (wave 1, DeepSeek, 68 tool calls, 2026-10-07)

Audit complete. All IDs below were returned by arXiv/Semantic Scholar search during this session (first batch via arxiv API, subsequent via arxiv web search after API throttling). Here is the prior-art map.

PRIOR-ART AUDIT, delegation-dominated agent institutions

C1: delegation dominance via persistent hub-attention re-payment, overlap M
  - Lingjiao Chen, J. Davis, B. Hanin, P. Bailis, I. Stoica, M. Zaharia, J. Zou, "Are More LLM Calls All You Need? Scaling Laws of Compound Inference Systems," arXiv:2403.02419, empirically scales the NUMBER of model calls in compound inference and finds diminishing quality returns.
    DELTA: they scale call-count for QUALITY, ignore the cost of re-paying hub context every remaining turn; our dominance inequality (w/h)<p(1+T)(1-α) is a turn-ahead cost dominance bound, not a quality-noise curve.
  - Songyuan Li, A. Abdelmoniem, S. Wang, "ProgRouter: Online Progress-Guided Orchestration for Multi-Agent LLM Workflows under Quality-Cost Tradeoffs," arXiv:2608.25992, dynamically routes work among agents to hit a quality/cost budget.
    DELTA: router optimizes per-task assignment, never models the session-lifetime context re-payment that makes a PRICIER worker optimal; no dominance inequality.
  - (nearest economic ancestor) Rauba/Cepenas/van der Schaar, principal-agent framing arXiv:2601.23211, treats delegation as a principal-agent problem (see C5); nearest quantitative argument that offloading work to a separate agent is structurally cheaper, but without the re-payment term.
    DELTA: it's structural/incentive, not a turn-count arithmetic dominance bound, your inequality is not published.

C2: free-tier worker offload as primary economics ("free lane cannot lose"), overlap M
  - V. Kotte et al., "UCCI: Calibrated Uncertainty for Cost-Optimal LLM Cascade Routing," arXiv:2605.18796, selects model per query to minimize expected cost under quality risk.
    DELTA: cascade chooses among PAID tiers to cut cost; ours asserts a zero-cost worker makes delegation dominant for ANY acceptance probability, an absolute dominance corollary they don't state.
  - J. Dekoninck, M. Baader, M. Vechev, "A Unified Approach to Routing and Cascading for LLMs," arXiv:2410.10347, unifies routing (one pick) and cascading (escalate/rescue) under one cost-optimal umbrella.
    DELTA: still per-request cost-minimization over paid models; free-tier-as-unconditional-win is outside their objective.
  - H. Erol et al., "Cost-of-Pass: An Economic Framework for Evaluating Language Models," arXiv:2504.13359, a general accounting framework for LLM economic comparison.
    DELTA: builds the metric; you derive a dominance law for zero-cost workers from it (corollary, not claimed).

C3: context budget as session lifespan; 1/α lifespan extension, overlap M
  - C. Packer et al., "MemGPT: Towards LLMs as Operating Systems," arXiv:2310.08560, virtual context management, paging to external memory to extend utterable context.
    DELTA: extends one agent's context via paging; you define context as the SESSION's lifespan budget and show DELEGATION (not paging) multiplies institutional work by 1/α.
  - K. Mei et al., "AIOS: LLM Agent Operating System," arXiv:2403.16971, OS layer that schedules context/resource use across many agents.
    DELTA: resource-scheduling engineering; no lifespan-as-budget, no delegation multiplier.
  - S. Matsuoka, "Memory Scarcity, Open Models, and the Restructuring of the AI Industry, 2026–2030," arXiv:2607.07207, treats memory/context as scarce industrial capital with quantitative scenarios.
    DELTA: macro scarcity scenario; you frame context as the session's binding lifespan and delegation as the per-session lever.

C4: verification-bandwidth scarcity + Jevons rebound, overlap M
  - R. Narayanan, R. K. Pace, "Will Neural Scaling Laws Activate Jevons' Paradox in AI Labor Markets? A Time-Varying Elasticity (VES) Analysis," arXiv:2503.05816, quantifies whether cheaper AI triggers labor-demand rebound (Jevons) via elasticity.
    DELTA: rebound in LABOR markets; your scarce factor is hub VERIFICATION bandwidth, not human labor.
  - A. S. Luccioni, E. Strubell, K. Crawford, "From Efficiency Gains to Rebound Effects: The Problem of Jevons' Paradox in AI's Polarized Environmental Debate," arXiv:2501.16548, efficiency gains → rebound, focused on environmental/energy debate.
    DELTA: environmental rebound; no agent-dispatch volume vs. verification-capacity equilibrium.
  - Y. Zhang, T. Zhang, "The Economics of Digital Intelligence Capital: Endogenous Depreciation and the Structural Jevons Paradox," arXiv:2601.12339, structural form of Jevons for AI capital.
    DELTA: capital-level; verification-bandwidth-as-binding-constraint in agentic dispatch is unclaimed.

C5: institutions for agents as cost-optimal control law; machine money + agent orgs, overlap H
  - P. Rauba, S. Cepenas, M. van der Schaar, "Multi-Agent Systems Should be Treated as Principal-Agent Problems," arXiv:2601.23211, argues MAS control is a principal-agent incentive problem (closest to mandates/constraints/escalation as control law).
    DELTA: frames the problem; you give the explicit institutional machinery (mandate/capability-registry/constraints/escalation) and tie it to cost-optimality, not sociology.
  - M. B. Syrnikov et al., "Institutional AI: Governing LLM Collusion in Multi-Agent Cournot Markets via Public Governance Graphs," arXiv:2601.11369 (companion 2601.10599), embeds explicit governance/institution graphs to control multi-agent markets.
    DELTA: governance for COLLUSION risk in markets; you use institutions as the cost-optimal control law for delegated cognition, plus machine-money rails.
  - P. Duetting, V. Mirrokni, R. Paes Leme, H. Xu, S. Zuo, "Mechanism Design for Large Language Models," arXiv:2310.10826 (WWW'24 best paper), mechanism-design/auction-theoretic control of LLM capacity under strategic agents.
    DELTA: mechanism design on the model itself; your institution layer governs DELEGATED AGENTS (A2A / ERC-8004 machine money is in the known SoK anchor arXiv:2610.01756, not this set).

C6: reflexive / self-measuring methodology, overlap L → near "NO CLOSE PRIOR FOUND"
  - N. Shinn et al., "Reflexion: Language Agents with Verbal Reinforcement Learning," arXiv:2303.11366, agents reflect verbally on their own failures to improve, the nearest notion of "self-referential agent."
    DELTA: reflexivity on TASK episodes, not on the RESEARCH INSTRUMENT; a paper whose evidence is produced live by the very hub-and-worker institution it studies is, to my search, unpublished.
  - D. Offenhuber, "Synthetic Data and the Shifting Ground of Truth," arXiv:2509.13355, AI/synthetic data as evidence and the epistemic instability this creates (thematics of self-generated ground truth).
    DELTA: critique of synthetic evidence, not a methodology that knowingly self-measures; no living co-production of evidence and claim.

Overall read: C5 (H) and C3/C4/C1/C2 (M) all sit in active, crowded neighborhoods, you should clearly differentiate via the specific quantitative laws (dominance inequality, 1/α lifespan multiplier, verification-bandwidth binding constraint). C6 is the genuinely open lane: no prior constructs a paper whose live evidence is generated by the same delegation institution it studies.

PRIOR-ART-OK