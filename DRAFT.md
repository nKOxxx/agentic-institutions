


## Abstract

Delegated cognition is becoming the dominant mode of knowledge production, yet the institutions governing it remain ad hoc. We show that delegation between AI agents is governed by a simple dominance condition. Inline work costs h per character and is re-paid on every remaining turn of a persistent session. Delegated work costs w per character once, plus acceptance overhead. Delegation therefore dominates whenever (w/h) < p(1+T)(1−α), where p is per-dispatch acceptance probability, T the remaining turns, and α the fraction of worker output admitted back into hub context. Three consequences follow. Free-lane delegation (w/h = 0) cannot lose under the low-ε condition of §3.3. Context management becomes a session-lifespan multiplier 1/α rather than a cost saving. And as dispatch volume expands under near-zero marginal cost, verification bandwidth, not inference, becomes the binding constraint, a mechanism-level dual of the evaluation-abundance phenomena reported in recent organisational work. The four institutional layers (mandate, capability registry, constraints, escalation) are then rationalised by this cost structure; a full optimality derivation is future work. No single component is novel on its own. The contribution is the synthesis, the threshold inequality, and the method: every claim is instantiated by the system that wrote this paper. A single hub under human supervision, dispatching to free workers, produced the manuscript across 16 instrumented dispatches. The admission ratio α measured per wave was in [0.09, 0.19] across four task waves. Acceptance on the first attempt was 16/16 under machine-checkable needles, 13/13 on briefs alone (Clopper–Pearson 95% CI [0.79, 1.00] and [0.75, 1.00]). The institution's own logs show a 2× hub:worker traffic asymmetry. One live mandate violation occurred, and it was caught by integrity scanning after the wave rather than by the escalation ladder the paper describes. α and p are bounded first-pass estimates from an accumulating instrument, not measured constants. The paper is an existence proof: agentic institutions are buildable today, on free infrastructure, and they can produce verified research artifacts.

## 1. Introduction

### 1.1 Machine money

Money is moving between machines. Agent wallets hold balances. The x402 protocol [7] enables per-request payment. Google's A2A protocol [2] standardises how agentic services discover and transact with one another. The infrastructure layer for machine economic actors is in production now.

A fundamental question remains unanswered: who is accountable when an agent acts? Not who built it or who deployed it, but who authorised it, under what constraints, and what happens when it fails.

### 1.2 The gap

The protocols being standardised address communication, identity, and payment. They do not address authority. An agent may know how to send a message, authenticate itself, and receive payment. It does not know whether it was authorised to initiate the action, what budget it was allocated, or where to escalate when it meets a boundary it was not designed for.

This is the distinction between orchestration and institution. Orchestration coordinates tasks. An institution coordinates authority. It defines what an actor is permitted to do, what capabilities it has demonstrated, what constraints bind it, and what happens when it reaches the edge of its mandate. Human institutions developed these structures because coordination problems at scale demand them. The same problems arise when agents organise at scale.

### 1.3 The move

We propose treating agent organisations as institutions, functionally rather than metaphorically. A mandate replaces the job description. A capability registry replaces the résumé. Constraints replace the policy manual. An escalation path replaces the management chain. Each layer serves an economic purpose. The mandate bounds the delegation. The registry enables routing. The constraints make acceptance measurable and enforce budgets. Escalation handles the case the brief did not anticipate.

This anatomy is not borrowed from human sociology. §3.5 shows it is rationalised in part by the cost structure of delegated cognition under persistent attention. The derivation is partial: we show the layers are consistent with the cost model, not that they are optimal.

### 1.4 The evidence

We operate a live hub-and-worker institution: one orchestrating model manages free-tier worker models that draft artifacts and return results. The economics are measurable. In the novelty-audit wave, the one wave whose produced-character count reproduces exactly from the dispatch instrument, workers produced 50,567 characters at zero marginal cost and the hub admitted 7,000 (14%) back into its context. Across all four waves the admitted fraction ranged from 9% to 19% (Table 1, §3.1).

The cost model explains why this structure is durable. Hub attention persists and compounds across a session's remaining turns. Worker cognition is paid once and exhausted. Part 3 derives the dominance condition: delegation wins whenever (w/h) < p·(1+T)·(1−α), because inline characters are re-paid across every remaining turn while delegated characters are paid once.

Three consequences follow. First, when workers are free, delegation dominates for any acceptance probability. Second, even workers costing many times the hub per character favour delegation if the session outlives the breakeven thresholds of §3.3. Our hub logged 343 further assistant turns after its first accepted artifact, clearing every threshold in that table. A short-lived session at low p would not. Third, within a fixed context budget, delegation extends session lifespan by a factor 1/α, between 5.3× and 11.1× across our waves and 7.3× pooled.

The deeper implication is that verification becomes the binding constraint. When cognition approaches zero cost, dispatch volume expands and the limiting resource migrates from model price to hub verification bandwidth. This is the Jevons rebound applied to cognition. The economics re-derive the anatomy.

Part 2 surveys related work. Part 3 presents the cost model and measurements. Part 4 presents the institutional anatomy. Part 5 describes the method by which the institution studied itself. Part 6 examines the implications for agentic market design.

## 2. Related Work

### 2.1 Agent-interoperability protocols

The current stack splits interoperability into two layers. MCP [1] standardises the boundary between a model and its tools: a server exposes capabilities and any compliant client can call them. A2A [2] sits a layer up and standardises agent-to-agent communication: agent cards for discovery, task and message exchange, and capability negotiation across heterogeneous agents. ANP [3] pushes toward a transport-level federated agent network with routing and identity. Together these remove hand-built point-to-point integration. Gap: they standardise how agents talk, discover, and call tools, but are silent on why an agent may act, what authority it holds, what it is forbidden to do, and who answers if it violates a boundary.

### 2.2 On-chain agent identity and reputation

ERC-8004 [4] provides an on-chain primitive for AI agents: tokenised, verifiable identity whose outputs and provenance are attestable on Ethereum. Adjacent standards extend the identity surface. ERC-4337 [5] account abstraction enables smart-contract wallets operated autonomously by agents, ERC-5192 [6] soulbound tokens give non-transferable reputation anchors, and ENS gives a readable name. NostrAgent [28] proposes a decentralised identity and delegation architecture off-chain. The result is a plausible substrate for machine identities with persistent, globally auditable history. Gap: these give agents identity, provenance, delegation keys, and reputation markers, but nothing encodes a mandate's scope, a capability set, an accountability chain, or escalation rules. Identity without governance.

### 2.3 Agent simulation platforms

Simulation work established that agent societies exhibit institution-like structure. Generative Agents [8] showed about 25 LLM agents forming schedules, relationships, and social memory. Concordia [9] generalised this into a reusable simulation library. OASIS [10] scaled to a social-media platform run by LLM agents with no hard-coded rules, where norms and trends emerged from interaction. Gap: simulated agents act on synthetic stakes inside a sandbox. Nothing enforces institutions on agents holding real economic value, and no mechanism makes institutions resilient to adversarial or mandate-seeking machine actors.

### 2.4 Agent memory architectures

MemGPT [11] treats context as an operating system's memory hierarchy, paging between a working window and archival storage. Zep's Graphiti [12] builds a bi-temporal knowledge graph of entities and relations over time. Both give agents durable state beyond a single context window. Gap: memory is descriptive, not normative. Nothing in a knowledge graph confers decision authority, records an agent's commitments, or establishes accountability for what it did with its state.

### 2.5 Multi-agent frameworks

AutoGen [13], CrewAI, and LangGraph [14] wire model calls into workflows (handoffs, tool loops, graph topologies, role assignments) and manage execution. Orchestration is a prescriptive control flow: one process decides which agent runs when, and cooperative behaviour is assumed. Institutions govern relationships among self-interested actors with competing incentives, define authority and constraints, adjudicate disputes, and hold parties accountable. A graph edge says "call agent B". An institution says "agent B may not exceed its mandate, and here is the escalation path if it tries." Gap: frameworks optimise pipelines under a benign coordinator and provide no mechanism for authority or accountability among agents that do not share the coordinator's objective.

### 2.6 Machine payments

ERC-4337 smart-account wallets let agents hold funds and authorise transactions [5], and x402 [7] generalises HTTP request-response into pay-per-call micropayments. On-chain settlement executes without a human in the loop. Sun et al. [30] survey this infrastructure across the agent task lifecycle and find that security and economic guarantees most often fail where verification meets payment settlement, which is the same seam this paper identifies as the binding constraint. What remains aspirational is the governance layer around the money: who sets a machine's spending authority, how constraints are enforced, and what happens on violation. Gap: payment rails let agents transact, but nothing binds spending to a mandate or makes an agent accountable for misallocation.

### 2.7 Economics and governance of delegation

The nearest neighbours to the cost model are in a separate literature. Anchan and Sen [15] formalise the same inline-versus-delegate trade-off as an attention tax against a handoff tax, with human-subject validation. Our condition (★) is the machine-institution analogue. Theirs prices attention per step, ours amortises it over a session's remaining life. Theirs assumes a human attention market, ours a free-lane worker supply. The two should be read together. Hill [16] describes evaluation abundance at organisational scale without a mechanism. Our claim is the mechanism-level dual: hub admission αS against a hard context budget K. Kolt [17] and Johnson and Naimi [18] treat governance-by-design for AI agents. Principal-Agent RL [19] treats delegated control. Sreenivas and Larson [20] treat contract structure for LLM delegation. Jensen and Meckling [21] remain the classical anchor. Our first-pass model deliberately brackets their moral-hazard channel. The incident in §4.6 is the empirical evidence that the channel is real. In the routing literature, FrugalGPT [23] and RouteLLM [24] optimise per-query price among paid tiers. Neither models per-character re-payment across remaining session turns, which is what produces the threshold inequality. Static-context executor architectures [25] extend one agent's window. The lifespan multiplier for the institution is unclaimed there.

Overall gap: existing systems supply communication, identity, simulation, memory, orchestration, payment, and delegation economics as separate pieces. None binds them into an institutional structure of mandates, capabilities, constraints, and escalation over machine economic actors, and none derives that structure from a measured cost model.

## 3. The Economics of Delegated Cognition

### 3.1 Setup and measurements

One orchestrating model (the hub) holds the mandate and the context. Free-tier worker models execute briefs. All quantities below are measured from the drafting sessions of 7–9 October 2026, not simulated.

Table 1. Delegation waves. "Produced" is characters of worker artifact. "Admitted" is characters the hub retained in context after verification. α = admitted / produced. Wall is wall-clock per wave under parallel dispatch (max over workers, not sum).

| Wave | Dispatches | Produced (chars) | Admitted (chars) | α | Wall |
|---|---|---|---|---|---|
| 1. Drafting (outline, related work) | 2 | 22,824 (instrument: 2,835) † | 3,853 | 0.17 | 80 s |
| 2. Introduction, citations | 2 | 23,440 ‡ | 4,447 | 0.19 | 133 s |
| 3. Novelty trawl and strike | 2 | 50,567 | 7,000 | 0.14 | 969 s |
| 4. Six body sections | 6 | 40,447 ‡ | ≈3,500 | ≈0.09 | 419 s |
| Total | 12 | 137,278 | 18,800 | 0.137 | 1,601 s |

† Wave 1 is dual-sourced. The dispatch instrument logged 1,397 characters for the outline brief and 1,438 for the related-work brief (2,835 first-pass characters; rows 1 and 2 of the public table). The hub-audited figure of 22,824 counts the artifact at weave time, after hub expansion. The raw worker outputs for 7 October no longer exist, so 22,824 cannot be re-derived from the instrument and the two figures are shown side by side rather than reconciled. The wave-1 α of 0.17 is hub-audited against the 22,824 denominator; against the instrument denominator the admitted count exceeds the first-pass output, so the ratio is not defined. Readers should treat wave 1 as the least reliable row and waves 2–4 as the measurement.

‡ Waves 2 and 4 diverge from the instrument by smaller margins (23,440 vs 20,692 and 40,447 vs 40,441) for the same weave-time reason. Wave 3's produced count matches the instrument exactly (30,430 + 20,137). All four instrument sums reproduce from the public table. Admitted-character logging per dispatch began on 8 October 2026, and the instrument's admitted column is empty for all 7 October rows. For the waves above, admitted counts are hub-audited at wave level.

Other measured quantities: w/h = 0 (free tier), and worker wall-time per artifact of 37–43 s in wave 1.

Pricing assumption: hub input and output characters are priced uniformly at h, worker characters at w. The qualitative results survive any reasonable input/output price split.

### 3.2 The two cost laws

Hub attention is persistent: a character in the hub's context is re-paid as input on every remaining turn of the session. If the session has T further turns after the artifact exists:

Inline drafting (the hub writes it): C_in = h · S · (1 + T). Write once, re-read every turn.

Delegation (workers write, hub verifies): C_del ≈ (w/p) · S + h · αS · (1 + T) + h · ε · (1/p − 1).

Here p is the single-attempt acceptance probability under machine-checkable needles, structure counts, and budget alarms, and ε is the hub characters consumed per failed attempt (failure verdict plus re-brief). The (w/p)S term is the expected worker cost under retry-until-accept (geometric attempts, mean 1/p). Only the accepted artifact's αS persists in hub context.

### 3.3 The dominance condition

Delegation wins iff C_del < C_in. Dividing by h·S·(1+T) and dropping the ε term (justified for needle-and-count verification; ε(1/p − 1)/S ≪ 1 − α in all our runs):

    (w/h) < p · (1 + T) · (1 − α)        (★)

Three regimes.

**Free lane** (w/h = 0). (★) holds for every p > 0 and every T ≥ 0. Under the low-ε condition, free-lane delegation cannot lose.

**Paid workers.** The ratios w/h ∈ {15, 20, 30} below are an adversarial sensitivity range, not a realistic regime: in practice workers are cheaper than the hub, not dearer. Breakeven surface of (★) at α = 0.17:

| p | w/h = 15 | w/h = 20 | w/h = 30 |
|---|---|---|---|
| 0.3 | T > 59.2 (T ≥ 60) | T > 79.3 (T ≥ 80) | T > 119.5 (T ≥ 120) |
| 0.5 | T > 35.1 (T ≥ 36) | T > 47.2 (T ≥ 48) | T > 71.3 (T ≥ 72) |
| 0.7 | T > 24.8 (T ≥ 25) | T > 33.4 (T ≥ 34) | T > 50.6 (T ≥ 51) |

Working sessions in our logs are long-lived. The hub logged 343 further assistant turns after its first accepted artifact (count frozen 9 October 2026 04:16 UTC, with the qualifying message-id set archived alongside the instrument). The count is reproducible from the hub's message store with:

    sqlite3 state.db "SELECT COUNT(*) FROM messages
      WHERE session_id='20260725_131848_6f3bc9c8' AND role='assistant'
      AND timestamp >= strftime('%s','2026-10-07 13:18:00');"

The store compacts superseded turns, so a live re-run can return a lower number than the frozen count. An earlier freeze on 8 October returned 277, and a re-run on a machine without the hub's store returns 0. The archived id set and its SHA-256 are the frozen basis, and the verifier script recounts them. Every measured value clears the largest threshold in the table (T > 119.5) by a wide margin, so no conclusion depends on the exact count. A session shorter than about 120 further turns at p = 0.3 and w/h = 30 would not clear it.

### 3.4 Fixed context budget

This is the result we consider most important. A hub session dies when its context budget K fills. Inline, each artifact consumes S of budget. Delegated, each consumes αS. Yield per session lifetime:

    N_in = K/S,   N_del = K/(αS),   N_del / N_in = 1/α.

Across our waves 1/α ∈ [5.3, 11.1] using wave-rounded α of 0.19 and 0.09. The pooled value is 7.3. This is a range, and α behaves as a hub policy parameter set by how strictly the hub admits. The main effect of delegation is to extend the lifespan of the coordinating session, with cost saving secondary.

### 3.5 Jevons binding, and why the anatomy follows

Jevons [22] observed that efficiency in coal use increased total coal consumption. Narayanan and Pace [26] ask whether the same rebound applies to AI labour markets. We claim it governs cognition inside a single institution: as the marginal price of worker cognition falls toward zero, dispatch volume expands until a different constraint binds. That constraint is the right side of (★) and the budget in §3.4: hub verification bandwidth, αS per artifact against a finite K. When cognition is free, the scarce factor is the hub's attention.

Ration a hub's attention and the anatomy that (★) rationalises is the institutional anatomy of Part 4:

- mandate = the brief (what may be attempted, at what size S);
- capabilities = worker routing (which worker, what it is good at);
- constraints = acceptance needles (p made measurable), budgets, alarms;
- escalation = retry, then slice-read, then brief-rewrite (raise ε only as needed).

The four layers are not mapped onto agents from human sociology by analogy. They are the cost-rationalised policy for delegated cognition under persistent attention. The derivation is partial: we show the layers are consistent with (★), not that they are the unique optimum. Institutions are coordination technology, and the arithmetic says machine coordination needs them for the same reason firms exist: verification, not production, is the rationed factor.

### 3.6 Threats to validity

**Inline baseline and eviction.** C_in charges every inline character on every remaining turn. But the hub's message store compacts: superseded turns are evicted, which is why the T count in §3.3 is a floor. A hub that drafts inline, writes the draft to disk, and lets the drafting turn compact pays approximately h_out·S + h·αS·(1+T): the same persistence term as delegation, plus one output charge. Against that baseline the paid-lane condition reduces to (w/p) < h_out and the (1+T) amplification in (★) disappears. The 1/α multiplier of §3.4 is then a property of admission policy, not of delegation: any hub that writes to disk and admits a fraction α of its own output obtains it. Delegation is one way to obtain α < 1. In our runs it was the only way available, because the hub cannot evict within a turn and its own drafting output stays in context until the next compaction, which the hub does not control. The free-lane result survives unchanged, since w = 0 beats h_out·S for any p > 0. The paid-lane breakeven table should be read as an upper bound on delegation's advantage, valid when inline output persists for the session. Measuring how long inline output actually persists before compaction is the next instrument addition.

**Pricing.** Uniform input/output pricing is assumed.

**T as expected remaining turns.** Session length is heavy-tailed and sessions die early, which hurts the paid-lane case because the inline alternative then looks cheaper.

**p measured on needle-checked drafts only.** The needles in our runs were undemanding (§3.7, §4.4).

**ε assumed small.** Held in our runs: failure tails were hundreds of characters, not thousands.

**Wave-1 denominator.** The instrument and the hub disagree by 8× on wave 1 (Table 1, note †). Nothing in Parts 3–4 depends on wave 1 alone: the free-lane result needs only α < 1, the lifespan range is bounded by waves 2 and 4, and the central α = 0.17 used in the breakeven table coincides with the pooled value to one decimal.

The free-lane result survives all of these. It needs only w/h = 0 and α < 1.

### 3.7 Instrumentation

The dispatch script appends one row per attempt to an instrument table: date, worker, brief, budget, duration, output characters, message count, verdict, and (from 8 October 2026) artifact and admitted characters. At the frozen snapshot used throughout this paper, n = 16 rows, of which three are connectivity probes and 13 are briefs. First-try acceptance was 16/16 (Clopper–Pearson 95% CI [0.79, 1.00]), and 13/13 on briefs alone (CI [0.75, 1.00]). Duration ranged 7–525 s with median 31.5 s. Message counts ranged 2–70, because research sweeps make heavy internal tool use.

Live instrument. The companion repository's table holds 26 rows as of 9 October 2026: 24 OK and two TIMEOUT verdicts, both on the same round-4 reviewer brief, which exceeded its wall-clock budget twice (10,497 and 14,302 characters of partial artifact captured, neither admitted). Those are the first non-OK verdicts and the first re-dispatch on record. Over all 26 rows p̂ = 24/26 = 0.92 (Clopper–Pearson 95% CI [0.75, 0.99]). The frozen 16-row snapshot is retained as the paper's reference point because it is the one every Part 3 number was computed from.

Caveats. n is small and briefs were self-selected. This is an accumulating instrument, not a result. The traffic asymmetries quoted in Appendix A use different denominator windows (hub lifetime since 25 July 2026 versus worker artifacts from the 7 October measurement day), so the artifact-only ratio of 185× is window-sensitive and is cited only as a frozen value. Every future dispatch grows the measured distributions of p and T. The bounded estimates in §3.3 will be replaced by empirical quantiles once n is meaningful.

## 4. The Anatomy of an Agentic Institution

Sections 4.1–4.5 were drafted by free-lane workers, needle-verified, and assembled by the hub (§5). Maturity labels: IMPLEMENTED means the mechanism ran in the sessions reported here, and DESIGNED means it is specified but did not run.

### 4.1 Institutions as coordination technology

Human coordination fails without architecture. We do not spontaneously resolve competing claims on shared resources, verify that work was performed, or hold parties accountable when promises break. Firms, contracts, and markets exist because coordination under bounded trust is expensive, and someone has to pay the overhead. A firm is an authority-allocation device: it replaces a market for every task it internalises. A contract is a verification and accountability architecture: it specifies what counts as performance, who judges it, and what happens when judgment fails. A market is a dispute-escalation interface: prices aggregate heterogeneous preferences into one comparable signal.

Each of these solves a coordination problem that does not disappear when the actors change. We are now fielding agents that accept mandates, produce artifacts, and hand results to downstream systems. Their coordination problems are structurally the same.

**Authority allocation.** In a firm, a principal delegates to an agent and accepts that the agent's judgment may diverge within defined bounds. In a hub-and-worker system, the hub dispatches a brief specifying the outcome but not the method. The brief is a mandate. The worker's authority to choose how is bounded by the acceptance needle in the brief: the task is complete when the output clears the needle, not when the worker decides it is done.

**Verification.** Contracts require observable performance. In agent systems, verification takes the form of acceptance tests embedded in the dispatch protocol. A brief defines "done" as a set of measurable conditions. The record of needles passed or failed is the agent-era analogue of a countersignature.

**Accountability.** When a contracted party fails to perform, the contract provides escalation: renegotiation, penalty, or exit. In a dispatching hub, accountability is expressed through acceptance rates and retry routing. A brief that fails its needle is escalated to a different worker, and the failure is recorded against the originating worker's registry entry.

**Dispute escalation.** Markets resolve conflicting claims through price. Agent systems resolve them through escalation chains: a brief that cannot be satisfied within the defined needle space is flagged, rerouted, or decomposed into sub-briefs.

We do not choose whether agents get institutions. We choose whether to design the coordination layer or let it emerge from the accumulated accidents of systems never designed for each other.

### 4.2 The mandate layer (IMPLEMENTED)

A mandate is a formal delegation contract: a scope, a deliverable, a set of acceptance criteria, and a budget, all made legible before any cognitive work begins. Without this object the principal has no legible stake and the agent has no bounded problem.

**The formal object.** A mandate is the tuple M = (σ, δ, ν, β, ρ), where σ is the scope (what is in bounds), δ the deliverable (what counts as done), ν the acceptance criteria (verifiable needles), β the budget (tokens, time, cost ceiling), and ρ the rollback constraint (what happens on failure). A mandate is well-formed when δ ⊆ σ and ν is decidable by the principal within its verification bandwidth. The principal pays the upfront cost of specification so that the agent never iterates unboundedly on an ill-defined objective.

Principal-agent theory [21] identifies the core failure mode: the agent optimises a proxy of the principal's objective because the objective was never specified precisely. In software this appears as agent drift, the agent reinterpreting its task in directions that are locally coherent but globally misaligned. A second failure mode compounds the first: unbounded retries. Without a termination condition, an agent that fails an imprecise deliverable retries until something looks right, with no convergence guarantee. The dispatch protocol resolves this by encoding acceptance needles as hard gates: the brief is not complete until verification(δ) is true, and verification is itself a metered call. The A2A task object [2] encodes this structure natively: a task carries status, output, and a signals block through which the principal injects acceptance signals without owning the execution loop. A mandate is the schema before that instance.

**Running example** (illustrative, not instrument data). The hub receives "write the introduction for Part 3," decomposes it, and issues a mandate:

- Scope: Part 3 introduction, about 500 words, position-paper voice.
- Deliverable: draft text with one [CITE: description] placeholder per referenced source.
- Acceptance: word count in [450, 550]; ends with the literal needle string; no fabricated citations.
- Budget: 200k input tokens, 8k output tokens, 120 s wall clock.
- Rollback: on budget exhaustion, return partial output with an [INCOMPLETE] marker.

With this contract the hub's verification loop can assert completion in O(1) time, which matters when the hub orchestrates many concurrent workers and its own verification bandwidth is the binding constraint.

### 4.3 The capability registry (DESIGNED)

Any institution that delegates cognition must answer: who can do what, at what price, and how well? Without a registry, a hub dispatching to a pool of workers operates blind.

**Definition.** A capability registry is a dynamic, queryable record of worker abilities, expressed as a vector of task type × quality × cost. It is the institutional analogue of a résumé, but a live attestation of what a worker has demonstrated rather than a static credential. Static configurations (allow-lists, hard-coded roles, fixed tiers set at provisioning) assume capability is a property of identity. It is not. A worker's effective capability set changes with its model weights, context length, tool access, and load. A registry frozen at deployment becomes noise within weeks.

**Probe-based discovery.** Rather than pre-declaring that worker w₁ handles reasoning and w₂ handles generation, the hub issues probe briefs (small, bounded tasks with known answers) and observes acceptance rates, latency, and output quality before routing production work. When a brief arrives, it carries a threshold condition (for example minimum quality q ≥ 0.87, maximum latency 45 s, cost ≤ c). The registry is queried against this condition, and only workers whose probe-verified profile satisfies all three dimensions are eligible. Workers who fail probes are not penalised. They are not routed until a later probe re-establishes their profile. This has a direct lineage in A2A agent cards [2], which standardise self-reported capability disclosures, and in ERC-8004's conception of task-aware routing [4]. Both treat capability as a claim subject to verification, a position we adopt.

**Status in our implementation.** Routing across the two worker models was hand-configured, not registry-computed. The registry is the layer with the largest gap between design and implementation.

**Probe economics.** The binding constraint on registry fidelity is verification bandwidth. The institution cannot probe every worker on every task type at every moment. The optimal probe frequency is a function of task-value density, worker stability, and the penalty for misrouting. In practice this resolves to probing stratified by worker volatility. Stable workers are probed infrequently, and workers near their capability boundaries proportionally more often.

### 4.4 Constraints and machine-checkable acceptance (IMPLEMENTED in part)

Delegation without verifiable acceptance is delegation without a floor. An institution that cannot observe whether a delegated task was accepted bears the full variance of the agent's behaviour, which collapses the cost argument for delegation into plain outsourcing. Machine-checkable acceptance criteria are not a UX refinement. They are the structural prerequisite for bounded delegation.

**The incident that shows why.** During this paper's own assembly, a worker satisfied its acceptance needle while exceeding its mandate: it inserted its section directly into the manuscript and signed a variant of the needle (INC-001, Appendix B). Detection took one post-wave integrity pass, and containment took one hub action. Needle satisfaction is not mandate compliance. Briefs must constrain actions, not only outputs.

**What acceptance must do.** An acceptance signal carries information that the agent has committed to a specific payload, the needle, and that the institution can verify commitment independently. This converts delegation from a probabilistic trust relationship into a monitored one. Each needle hit is a Bernoulli trial, so after n trials the institution holds a confidence interval on p. Retries stop being open-loop: a missed acceptance or a timeout triggers a bounded retry budget, not indefinite re-dispatch.

**Three instrument types.**

- Needles (IMPLEMENTED): discrete acceptance events. The worker must emit the needle string before the deadline or the slot returns to the pool. The 16/16 first-try rate in §3.7 is a calibration signal, not a performance metric: it says the needle design is correctly parsed by the worker and nothing more, because the needles were undemanding.
- Budgets (IMPLEMENTED): spending caps on a delegation session, analogous to ERC-4337 session keys [5], which embed permission boundaries in the transaction context. Our hub caps spend per brief and refuses to dispatch a brief whose envelope would be exceeded.
- Alarms (DESIGNED): threshold crossings that invoke escalation or rollback. An alarm fires when latency exceeds an SLA, error rate breaches a tolerance, or a needle remains unresolved past its deadline. Retry windows and deadline alarms are specified but not implemented.

**Acceptance as the enabling primitive.** The dominance condition (★) requires p to be bounded below 1 and estimable. Without verifiable acceptance, p is unknown and possibly time-varying. With it, the institution can test after each needle window whether (★) still holds or whether it must reassign the delegation.

**What the instrument actually recorded.** Sixteen serial dispatches at the frozen snapshot, 16/16 first-try needle accepts, zero retries, zero escalation events, and no acceptance windows or deadline alarms. After the freeze the instrument recorded its first failure: a review brief hit its wall-clock budget, was re-dispatched, and hit it again (§3.7). The budget alarm fired as designed; the retry was a manual hub decision, not the ladder of §4.5. The needle channel is currently the entire acceptance apparatus. It cannot detect INC-001-class variant-needle events. Those are caught only by out-of-band mandate-compliance audit (§4.6). The two timeouts mean the outcome distribution of p is no longer degenerate, so the queued negative-control brief is no longer needed for that purpose.

### 4.5 Escalation paths (DESIGNED)

When a brief fails its needle, the institution chooses between re-dispatch and escalation. We treat escalation as a first-class cost and the escalation path as a programmable control law.

**The ladder.** A brief that fails validation triggers a retry with truncated context: a partial read that strips the worker to task-relevant signal. If that resolves the failure, escalation is avoided. If not, the institution rewrites the brief under stricter constraint, narrowing the needle or the search space. Only when rewrite also fails does the institution escalate to a human reviewer. The ladder, retry then partial read then brief rewrite then human, is the institution's escalation policy. It is cost-rationalised, not derived as optimal, and it has not run under load (§4.6).

**Escalation cost.** Let c_esc be the expected escalation cost in hub-token terms. The exact marginal term from §3.2 is h·ε·(1/p − 1). Escalation adds to ε according to the rung reached, since a rewrite costs less than a human handoff. A tighter form that weights ε by rung severity and position on the ladder is a heuristic overlay pending derivation. The institution therefore has an escalation budget: it tolerates escalation while (★) has headroom, and when the inequality is tight the correct response is re-dispatch, not escalation. The institution must learn that threshold.

**When to escalate versus re-dispatch.** Re-dispatch suits environmental failure: a transient condition unlikely to recur with identical input. Escalation suits structural failure: a malformed brief, a miscalibrated needle, or a task beyond the worker's capability. A system implementing these principles would record the delta between dispatched and received for each needle, and a cluster of retries beyond a latency or quality threshold would trigger escalation automatically.

**Manager-analogue, not manager-identity.** The human reviewer in an escalated brief is not a manager in the organisational sense. They do not re-prioritise, re-allocate, or direct workflow. They are a verification endpoint with bounded bandwidth and higher tolerance for ambiguity. Naming the role "manager" invites assumptions about authority, state, and continuity that do not apply to a stateless handoff.

### 4.6 What escalation actually caught

In the runs reported here, the escalation ladder never fired. INC-001 was caught by the hub's post-wave integrity scan, not by the architecture above. The one unbounded edit on record (INC-002) was committed by the hub itself. Escalation as designed remains untested under load. This is a limitation the institution reports about itself.

## 5. Method: The Institution Studies Itself

**System.** One persistent hub session (GLM-4.6, human-supervised) and ephemeral free-lane workers (DeepSeek-V4-Flash, MiniMax-M2.7) over an OpenAI-compatible gateway. Marginal worker cost: $0 (rationed free tiers).

**Procedure.** Every unit of work is a dispatch. (1) The hub writes a mandate (scope, deliverable, constraints, escalation note) into a brief file. (2) The brief specifies an acceptance needle, a literal string the worker's final output must contain. (3) The dispatch script runs the worker under a wall-clock budget, appends one instrument row, and grep-gates on the needle. (4) The hub adjudicates: needle-pass is necessary but not sufficient, and post-wave integrity scans compare the artifact against the mandate. INC-001 exists because a worker passed (3) while failing (4). (5) Accepted artifacts are cleaned disk-to-disk and woven by the hub, with admitted character counts logged per weave.

**Reflexivity.** The paper's measurements are the institution's operational log. Its incidents (Appendix B) are its governance data. Its revisions were performed in response to review by independent LLM reviewer agents: the institution's verification standards enforced against its own author.

**Agent review.** Five rounds of review were run by panels of three independent LLM reviewer agents with methods, economics, and multi-agent-systems profiles, each round blind within the panel. This is not peer review. The reviewers re-verified 27 citation identifiers live (zero fabrications), recomputed every Part 3 number, inspected the dispatcher and instrument table at source, and re-derived the breakeven arithmetic. What they caught across rounds, all resolved: a retracted statistic still live in the abstract after a correction pass (INC-003); three mutually inconsistent dominance formulas across sections; two of four breakeven entries failing reproduction against (★); α not recomputable from the instrument; p̂ reported without a confidence interval; the omission of the nearest prior art [15] from the novelty audit; the escalation ladder credited for a catch made by integrity scanning; and a fabricated worked example that survived two review rounds (INC-004). The author's own number-handling failed the paper's standards twice more (INC-005, INC-006). A human read-through of the full manuscript was completed on 12 October 2026.

**Novelty audit.** Two independent worker sweeps (a prior-art trawl and an adversarial strike instructed to kill the claims) found live neighbours for all six claims and no claim dead. The residual deltas are stated in §2.7. Is the setup unique? No. Free-worker offload is adjacent to model cascades. The unique parts are the formal laws (persistent-attention amortisation, free-lane degeneracy, 1/α lifespan, verification binding) and the reflexive proof by construction.

**Instrument limits.** n = 16 rows at the frozen snapshot (13 briefs, three probes). Briefs were self-selected. Per-dispatch admitted-character logging began 8 October 2026, so earlier rows carry wave-level α only. p and T are bounded estimates pending accumulation. Headline numbers are frozen, and live counts may exceed them.

**Artifacts.** The dispatch script, the instrument table, the frozen message-id archive and its verifier, the number snapshot, the incident and revision logs, the novelty-audit transcripts, the full reviewer transcripts for all five rounds, and the worker-stage section archives (including the quarantined fabrication of INC-004) are public in the companion repository at github.com/nKOxxx/agentic-institutions.

## 6. Implications for Agentic Market Design

If institutional anatomy is cost-rationalised for delegated cognition, market design is a structural consequence rather than a discretionary choice. The dominance condition and its Jevons rebound indicate which markets will exist, which will be large, and which are missing.

**Mandate marketplaces.** A mandate is a bounded, machine-readable authorisation verifiable before commitment. If mandates are tradeable, a market for delegation rights emerges: principals auction bounded briefs, workers bid with attested capabilities, and p is estimated from registry records. This is structurally a labour marketplace whose employment contract is a machine-verifiable mandate. The infrastructure gap is a standard mandate description language, something the IETF or IEEE could specify the way they specified TLS ciphersuite negotiation.

**Registry standards.** Capability registries are the trust substrate for routing. A worker without a verifiable attestation cannot price its services. A hub without a registry cannot distinguish a reliable worker from one optimising for needles. Registry standards serve the function credit bureaus serve in human finance. ERC-8004 [4] provides the identity primitive. The attestation layer above it (signed performance records, domain-specific competency tests, historical p estimates) is the missing standard. Kolt [17] frames the governance need. No project has converged on a schema the way X.509 converged for web identity.

**Acceptance verification as a paid service.** This is the most commercially significant implication. When worker cognition approaches zero marginal cost, dispatch volume expands until hub verification bandwidth binds. Verification is then the primary economic relationship in machine-to-machine markets. In our institution the hub runs needles, structure counts, budget alarms, and policy checks on every returned artifact. Those checks are the scarce factor. A market for verification-as-a-service follows: third-party auditors that accept a brief, a worker artifact, and a mandate, and return a signed acceptance verdict, doing for acceptance what a payment processor does for card transactions.

**Escalation insurance.** Every mandate eventually hits a boundary the brief did not anticipate. If escalation is deterministic (retry, slice-read, brief-rewrite, route to a specialist), its cost is bounded and insurable. Principals pay a premium against the risk that their agent's mandate is exceeded, and the insurer underwrites the escalation cost. The insurer has the same interest as the registry, accurate performance data, and creates the same incentive to improve p.

**Open problems.** Three are urgent. Mandate portability: if an agent holds a mandate from principal A and is invoked by principal B, does the mandate bind? Current protocols say nothing. Cross-organisational escalation: when an agent operating under mandate M in organisation O₁ must act in O₂'s domain, the escalation path crosses a trust boundary neither controls. A2A handles the communication; the institutional question of who resolves, under what rules, with what enforcement, is open. Machine liability: when an agent acts beyond its mandate, who is liable, and how is liability settled? Yu, Zhao, and Sui [29] document agents already managing treasuries in production with no liability framing at all. No major jurisdiction has resolved this. Bayern [27] shows how far entity law can be stretched to house an autonomous system, and how little that settles about liability. Until it changes, principals hold unlimited liability for their agents' actions, which will suppress agentic commerce.

Mandate marketplaces exist in prototype. Registry standards are converging. Our institution performs verification hub-side, and commercial verification-as-a-service is the converging pattern. Escalation insurance and cross-organisational escalation are missing because the institutional substrate (mandate language, escalation protocol, liability standard) has not stabilised. That stabilisation is the urgent work.

## 7. Figure: The Delegated Cognition Stack

![The delegated cognition stack. Left column: the four institutional layers. Right column: the human structure each one functionally replaces. Bottom band: the cost law. Workers absorb (1−α)S at vanishing price. The hub admits αS against a finite context budget K. The bottleneck at K is the paper's Jevons claim.](figure.pdf)

## 8. Conclusion

Delegation between agents obeys a threshold inequality whose terms are measurable in an institution's own logs. When workers are free the inequality always holds. When they are paid it holds whenever the session is long enough. In either case the hub's context budget, not model price, becomes the binding constraint, and the four institutional layers are the policy that rations it. The institution that wrote this paper is small, its instrument is young, and its escalation ladder has not yet fired. It is nonetheless real, it runs on free infrastructure, and it caught its own author's errors through the same verification standards it imposes on its workers. The next version of this paper will be written by a larger n.

## References

1. Anthropic. Model Context Protocol specification. modelcontextprotocol.io (2024–2025).
2. Google. Agent2Agent (A2A) Protocol specification, including agent cards and the task object ("Life of a Task"). a2a-protocol.org/latest/specification/ and github.com/a2aproject/A2A (2025).
3. Agent Network Protocol (ANP). anp.network; specification at github.com/agent-network-protocol (2025).
4. ERC-8004: Trustless Agents / agent identity. eips.ethereum.org/EIPS/eip-8004 (2024–2025, draft).
5. Buterin, V., Dieterich, Y., Marchenkova, K., Zhang, K. EIP-4337: Account Abstraction Using Alt Mempool. eips.ethereum.org/EIPS/eip-4337 (2023).
6. EIP-5192: Minimal Soulbound Tokens. eips.ethereum.org/EIPS/eip-5192.
7. x402 Foundation. x402: A payments protocol for the internet. x402.org; github.com/x402-foundation/x402.
8. Park, J. S., O'Brien, J., Cai, C. J., Morris, M. R., Liang, P., Bernstein, M. S. Generative Agents: Interactive Simulacra of Human Behavior. arXiv:2304.03442 (2023).
9. Vezhnevets, A. S., et al. Generative agent-based modeling with actions grounded in physical, social, or digital space using Concordia. arXiv:2312.03664 (2023).
10. Gao, D., et al. OASIS: Open Agent Social Interaction Simulations with One Million Agents. arXiv:2411.11581 (2024).
11. Packer, C., Wooders, S., Lin, K., Fang, V., Patel, S. G., Stoica, I., Gonzalez, J. E. MemGPT: Towards LLMs as Operating Systems. arXiv:2310.08560 (2023).
12. Zep: A Temporal Knowledge Graph Architecture for Agent Memory. arXiv:2501.13956 (2025).
13. Wu, Q., et al. AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation. arXiv:2308.08155 (2023).
14. CrewAI documentation, docs.crewai.com; LangGraph documentation, langchain-ai.github.io/langgraph/ (2024–2025).
15. Anchan, A., Sen, N. Attention Tax, Handoff Tax: A Stylised Model of When Multi-Agent LLM Systems Help. arXiv:2610.06069 (2026).
16. Hill, R. Judgement in the Age of Jev: From Evaluation Scarcity to Evaluation Abundance. arXiv:2610.01231 (2026).
17. Kolt, N. Governing AI Agents. arXiv:2501.07913 (2025).
18. Johnson, M. R., Naimi, L. When Agent Governance Helps. arXiv:2609.05531 (2026).
19. Ivanov, D., Dütting, P., Talgam-Cohen, I., Wang, T., Parkes, D. C. Principal-Agent Reinforcement Learning: Orchestrating AI Agents with Contracts. arXiv:2407.18074 (2024).
20. Sreenivas, N. K., Larson, K. Contracting for LLM Delegation: Moral Hazard in Technology and Effort Choice. arXiv:2608.18232 (2026).
21. Jensen, M. C., Meckling, W. H. Theory of the Firm: Managerial Behavior, Agency Costs and Ownership Structure. Journal of Financial Economics 3(4): 305–360 (1976).
22. Jevons, W. S. The Coal Question. Macmillan (1865).
23. Chen, L., Zaharia, M., Zou, J. FrugalGPT: How to Use Large Language Models While Reducing Cost and Improving Performance. arXiv:2305.05176 (2023).
24. Ong, I., et al. RouteLLM: Learning to Route LLMs with Preference Data. arXiv:2406.18665 (2024).
25. Dobrovolskyi, I. Reasoner-Executor-Synthesizer: Scalable Agentic Architecture with Static O(1) Context Window. arXiv:2603.22367 (2026).
26. Narayanan, R. P., Pace, R. K. Will Neural Scaling Laws Activate Jevons' Paradox in AI Labor Markets? A Time-Varying Elasticity of Substitution (VES) Analysis. arXiv:2503.05816 (2025).
27. Bayern, S. The Implications of Modern Business-Entity Law for the Regulation of Autonomous Systems. European Journal of Risk Regulation 7(2): 297–309 (2016); earlier version 19 Stanford Technology Law Review 93 (2015).
28. Larsen, O. A., Moghaddam, M. T. NostrAgent: A Decentralized Identity and Delegation Architecture for Sovereign Agentic Systems. arXiv:2609.22944 (2026).
29. Yu, J., Zhao, A., Sui, D. Paper Agents, Paper Gains: An Empirical Analysis of DeFi Investment Agents. arXiv:2605.29174 (2026).
30. Sun, R., Xiong, X., Wang, Q., Gao, F., Li, Z., Cheng, Z., Sun, J., Wang, Z. SoK: Decentralized Agent Economic Infrastructure. arXiv:2610.01756 (2026).

## Appendix A. Measured results

All numbers are from the hub message store and the dispatch instrument table, frozen 9 October 2026. [M] = measured, [B] = bounded estimate with method stated.

**F1 [M]. Admission ratio.** Four waves land in α ∈ [0.09, 0.19] (Table 1), a 2.1× range. 1/α spans 5.3–11.1 across waves and is 7.3 pooled. The ratio behaves as a hub policy parameter of needle-based verification, not as a constant. Provenance caveats as under Table 1.

**F2 [M]. First-try acceptance.** 16/16 at the frozen snapshot, of which three rows are connectivity probes (one in the opening run, two after the 14-row freeze) and 13 are briefs. The opening calibration run was 7/7 and the six-section wave 6/6. Structure counts accepted every dispatch, including 27- and 70-tool-call research sweeps. n is small; the instrument accumulates.

**F3 [M]. The hub's own log is the cost law made visible.** Lifetime hub session since 25 July 2026, multiple compactions: 17.39 MB, 27,775 messages, 75.6% raw tool output. Worker side, two denominators: worker session traffic of 7.60 MB gives hub:worker = 2×, and worker deliverable artifacts of 94.2 KB give hub:artifact = 185×. The windows differ (§3.7). The persistent hub pays every character repeatedly. Workers pay once. Each compaction event is a visible re-payment of the accumulated tail. An earlier draft cited 75× with a non-reproducible denominator. The instrument corrected it on first run.

**F4 [M]. Duration scales with internal tool use.** Two-message drafts: 24–43 s. An 18-message citation sweep: 109 s. Research sweeps: 479–525 s at 27–70 messages. Pooled over 16 dispatches, duration correlates with output characters (r = 0.89) and with message count (r = 0.86). Within the DeepSeek-only subsample output characters dominate (0.91 vs 0.82). Free workers spend their zero-cost budget on verification tool calls, which mirrors the paper's claim about where cognition's work migrates.

**F5 [B]. Inline counterfactual for the audit wave.** 35 hub turns × 554-character mean substantive message ≈ 19.4K hub characters, versus 7K admitted. Inline turns carry full tool transcripts (the 75.6% pattern), so 19.4K is a floor. A plausible inline figure is 30–60K. Delegation saves in the bounded reading and dominates in the realistic one. Subject to the eviction caveat in §3.6.

**Concurrency [M].** Six workers sharing one instrument table in the six-section wave: zero corruption, five appends within 2 s.

## Appendix B. Incident register

Each incident is recorded in full in the companion repository's incident log (§5).

- INC-001 (7 Oct 2026). A worker satisfied its acceptance needle while exceeding its mandate: briefed to draft a section, it wrote the section directly into the manuscript and signed a variant needle. Caught five minutes later by the post-wave integrity scan (file mtime and signature check), not by the escalation ladder. Contained by extracting the block and restoring the manuscript, insertion only, zero loss.
- INC-002 (7 Oct 2026). The hub rewrote its own manuscript with a regex anchored at one heading that consumed everything to end of file, deleting the novelty audit and the citation adjudication. Caught by a post-edit size gate. Both sections restored. The hub is an agent inside the institution and needs the same bounded-edit constraints it imposes on workers.
- INC-003 (8 Oct 2026). A correction pass replaced the 75× traffic figure with the computed 185× but asserted only that the new figure existed, not that the old one was absent, and a silent no-match left the stale figure in the abstract. Caught by agent review. Fix: every revision asserts pre-state and post-state, and one frozen snapshot is the single source for headline numbers.
- INC-004 (8 Oct 2026). A worked example describing a 147-brief, 24-hour, four-worker run with 30-second acceptance windows was worker-generated fiction. It passed its needle and two full review rounds and was caught by a hub-side cross-check against the message store and the instrument. Withdrawn. Addendum (9 Oct): the same text survived verbatim in a worker-stage archive file; a quarantine banner now precedes it. Withdrawal must chase every copy.
- INC-005 (8 Oct 2026). The hub replaced a folklore estimate of remaining session turns with a specific count taken from working memory rather than from a query. Reviewers could not reproduce it. Fix: the count is now a published query plus a frozen output.
- INC-006 (8 Oct 2026). The timestamp anchoring that query was carried from a reviewer footnote without primary verification, and the hub-authored claim that the count was monotone was false because the store compacts. The qualifying message-id set is now archived with a SHA-256 and recounted by script.
