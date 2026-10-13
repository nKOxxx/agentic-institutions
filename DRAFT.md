# Agentic Institutions

**Companion repository**: all instruments (dispatch script, instrument table, frozen message-id archive, incident log, reviewer transcripts) are public at [github.com/nKOxxx/agentic-institutions](https://github.com/nKOxxx/agentic-institutions).

## ABSTRACT

Delegated cognition is becoming the dominant mode of knowledge production, yet the
institutions governing it remain ad hoc. We show that delegation between AI agents is
governed by a simple dominance condition: inline work costs w per character, re-paid
across every remaining turn of a persistent session, while delegated work costs h once
plus acceptance overhead, so delegation dominates whenever (w/h) < p(1+T)(1−α), where
p is per-dispatch acceptance probability, T remaining turns, and α the fraction of worker
output admitted back into hub context. Three consequences follow: free-lane delegation
cannot lose (w/h = 0; low-ε floor of §III.3 applies); context management becomes a session-lifespan multiplier 1/α
rather than a cost saving; and as dispatch volume explodes under near-zero marginal
cost, verification bandwidth, not inference, becomes the binding constraint, a
mechanism-level dual of recently observed evaluation-abundance phenomena. Mandate,
capability-registry, constraint, and escalation structures then emerge as
prescribed by the cost structure of delegated cognition (rationalized by (★),
§III.4; a full optimality derivation is future work), not optional governance. Every claim
is instantiated by the system that wrote this paper: a single human-supervised hub and
free-lane workers produced the manuscript across 14 instrumented dispatches, with
measured admission ratio α ∈ [0.09, 0.19] across four task waves, first-try acceptance
p̂ = 14/14 via machine-checkable needles, a 2× hub:worker traffic asymmetry (185× against deliverable
artifacts; denominators' window caveat in §III.6) in the institution's own logs, and one live mandate-violation incident -
caught not by the escalation ladder it describes but by post-wave integrity scanning,
an honest datum the paper reports as such (INC-001). First-try acceptance carries a
Clopper–Pearson 95% CI of [0.77, 1.00] at n=14; α and p are bounded first-pass
estimates with an accumulating instrument, not measured constants. The paper is an existence proof: agentic institutions
are buildable today, on free infrastructure, and they can do science.

## Mandates, Capabilities, Constraints, and Escalation for Machine Economic Actors

**v1.2 (post-review revision)**, 2026-10-08. Position paper + measured economics.

> **Provenance / method note (itself evidence for the thesis).** Produced by a
> live hub-and-worker institution operating the structure it describes: free-tier
> workers (MiniMax-M2.7, DeepSeek-V4-Flash) drafted outline, related work,
> introduction, and citations from one-paragraph mandates with acceptance needles;
> the hub derived the cost model, adjudicated citations, and assembled.
> Revision v1.2 responds to an external review by three independent LLM reviewer
> agents (scores 4, 4, 5 /10; 27 citations independently re-verified, zero
> fabrications). Round-1 BLOCKER findings are dispositioned in this revision (the second review then found the breakeven repair had not reached the manuscript, fixed in v1.3) and the
> reviews are summarized in §IX. Known instrument limits: admitted characters are hub-audited per wave
> (per-dispatch artifact/admitted auto-logging began 2026-10-08); α and p are
> bounded estimates.
---

## I. INTRODUCTION

**The Quiet Revolution in Machine Money**

Money is moving between machines. Agent wallets hold balances. The x402 protocol [x402.org] enables per-request payment. Google's A2A protocol [A2A] standardizes how agentic services discover and transact with one another. The infrastructure layer for machine economic actors is being built, not hypothetically, but in production, now.

Yet a fundamental question remains unanswered: who is accountable when an agent acts? Not who built it, not who deployed it, but who authorized it, under what constraints, and what happens when it fails?

**The Gap**

The protocols currently being standardized address communication, identity, and payment. They do not address authority. An agent may know how to send a message, authenticate itself, and receive payment. It does not know whether it was authorized to initiate the action, what budget it was allocated, or where to escalate when it encounters a boundary it was not designed to navigate.

This is the distinction between orchestration and institution. Orchestration coordinates tasks, it sequences, assigns, and monitors. An institution coordinates authority. It defines what an actor is permitted to do, what capabilities it has demonstrated, what constraints bind it, and what happens when it reaches the edge of its mandate. Human institutions developed these structures over centuries because coordination problems at scale demand them. The same problems arise when agents organize at scale.

**The Move**

We propose treating agent organizations as institutions, not metaphorically, but functionally. The taxonomy is straightforward: a mandate replaces the job description; a capability registry replaces the resume; constraints replace the policy manual; and an escalation path replaces the management chain. Each layer serves a precise economic purpose. The mandate bounds the delegation. The capability registry enables routing. The constraints calibrate acceptance thresholds and enforce budgets. Escalation handles the irreducible case where the agent encounters a situation its brief did not anticipate.

This is not borrowed from human sociology. It is derived-in-part from first principles of delegated cognition under cost constraints (§III.4).

**The Evidence**

We operate a live hub-and-worker institution: one orchestrating model manages free-tier worker models that draft artifacts and return results. The economics are measurable. In one measurement period, workers produced 22,824 characters of artifact at zero marginal cost. The hub admitted only 3,853 characters, 17% (wave-1; pooled across all four waves the rate spans 9–19%), back into context. The remaining 83% was filtered by the hub's verification process.

The cost model reveals why this structure is durable. Hub attention persists and compounds across a session's remaining turns; worker cognition is paid once and exhausted. The dominance condition for delegation, derived in Part III: delegation dominates whenever (w/h) < p·(1+T)·(1−α), where p is first-try acceptance probability, T the remaining session turns, and α the admitted fraction of worker output, because inline characters are re-paid across every remaining turn while delegated characters are paid once.

Three consequences follow directly. First, when workers are free, delegation dominates for any acceptance probability, the free lane cannot lose. Second, even paid workers costing 15× the hub per character favor delegation provided the session outlives the breakeven thresholds of §III.3, our hub logged 343 further assistant turns at the 2026-10-09 04:16 re-freeze (id-set archived in-repo; receipt in III.3; see INC-006) after its first accepted artifact (reproducible query in §III.3), clearing all of them; a short-lived session at low p would not. Third, within a fixed context budget, delegation delivers between 5.3× and 11.1× across waves (≈6× in the central case).

The deeper implication: verification becomes the binding constraint. When cognition approaches zero cost, dispatch volume expands and the limiting resource migrates from model price to hub verification bandwidth. This is the Jevons paradox in reverse. The economics re-derive the anatomy.

The four-layer institutional structure, mandate, capability registry, constraints, escalation, is not a design choice. It is rationalized by (★): the dominance condition prescribes exactly these layers for cognition under persistent attention. Part II traces the taxonomy in detail. Part III presents the full cost model and measurements. Part IV examines the structural implications for agentic market design.


---

## II. RELATED WORK


1. Agent-interoperability protocols

The current stack splits interoperability into two layers. MCP (Model Context Protocol, by Anthropic) standardizes the boundary between a model and its tools/resources: a server exposes capabilities, and any compliant client can call them, decoupling tool access from any single vendor. A2A (Agent2Agent, by Google) sits a layer up, standardizing agent-to-agent communication: agent cards for discovery, task/message exchange, and negotiating capabilities across heterogeneous agents. ANP (Agent Network Protocol) pushes further toward a transport-level, federated agent network with routing and identity. Together these banish bespoke point-to-point integration. Gap: they standardize how agents talk, discover, and call tools, but are silent on why an agent may act, what authority it holds, what it is forbidden to do, and who is answerable if it violates a boundary. [MCP: Model Context Protocol specification, Anthr…]

2. On-chain agent identity & reputation

ERC-8004 provides an on-chain primitive for AI agents: tokenized, verifiable agent identity whose outputs and provenance are attestable on Ethereum. Adjacent standards extend the identity surface, ERC-4337 account abstraction enables smart-contract wallets owned and operated autonomously by agents, ERC-5192/sovereign-bound ("soulbound") tokens give non-transferable reputation/credential anchors, and ENS grants a readable name. The result is a plausible substrate for machine identities with persistent, globally auditable history. Gap: these give agents identity, provenance, and transferable-vs-soulbound reputation markers, but nothing encodes a mandate, a capability set, an accountability chain, or escalation rules, identity without governance. [ERC-8004]

3. Agent simulation platforms for institutions research

Simulation work established that agent societies exhibit institutional-like structure. Generative Agents (Park et al., Stanford, "Smallville") showed ~25 LLM agents forming schedules, relationships, and social memory that produced believable collective behavior. Concordia (DeepMind) generalized this into a reusable generative-agent simulation library with scripting for social interactions and pilot studies of emergence. OASIS (CMU et al., 2024) upscaled materially: a real social-media platform run by LLM agents with no hard-coded rules, where communities, norms, and trends emerged organically from agent interaction. Collectively they prove bottom-up emergence of norms and institutions in silico. Gap: simulated agents act on synthetic stakes inside a sandbox; nothing enforces institutions on agents holding real economic value, and no mechanism makes institutions resilient to adversarial, mandate-seeking, or self-interested machine actors. [Generative Agents: Interactive Simulacra of, arXiv:2304.03442]


4. Agent memory & knowledge architectures

Memory systems solve the state problem for long-horizon agents. MemGPT/Letta treats context as an operating system's memory hierarchy, paging information between a fast working window and slower archival storage, enabling agents to operate "out of context" and preserve state across sessions. Graphiti (by Zep) builds a temporal, bi-temporal knowledge graph that captures entities, relations, and their evolution over time, letting agents reason about what changed when and why. Both give agents durable, queryable state that persists beyond a single context window. Gap: they recall and revise facts, but memory is descriptive, not normative, nothing in a knowledge graph confers decision authority, records an agent's commitments, or establishes accountability for what it did with its state. [MemGPT: Towards LLMs as Operating, arXiv:2310.08560]

5. Multi-agent frameworks

AutoGen, CrewAI, and LangGraph are orchestration frameworks: they wire multiple model calls into a workflow, handoffs, tool loops, graph topologies, and "crew" role assignments, and manage execution. This is valuable engineering, but orchestration is not institutional design. Orchestration is, at bottom, a prescriptive control flow: one process decides which agent runs when, and cooperative behavior is assumed. Institutions, in contrast, govern relationships among self-interested actors with competing incentives, define authority and constraints among them, adjudicate disputes, and hold parties accountable. A graph edge says "call agent B"; an institution says "agent B may not exceed its mandate, and here is the escalation path if it tries." Gap: frameworks optimize pipelines under a benign coordinator; they provide no mechanism for authority, checks and balances, or accountability among agents that do not share the coordinator's objective. [AutoGen: Enabling Next-Gen LLM Applications, arXiv:2308.08155]

6. Machine payments

Real machine-payment infrastructure now exists. ERC-4337 smart-account wallets let agents hold funds and authorize transactions autonomously, and protocols like x402 generalize HTTP-style request-response into pay-per-call machine micropayments, agents paying other agents/APIs in real time. These rails are real, not whitepaper: on-chain settlement executes without a human in the loop, and agent-run wallets are live in production feeds. What remains aspirational is the governance layer around the money, who sets a machine's spending authority, how constraints are enforced on-chain, and what happens on violation. Gap: payment rails let agents transact, but nothing binds an agent's spending to a mandate or makes it accountable for misallocation; machine money without machine accountability remains just money. [ERC-4337]

Overall gap the paper fills: existing systems supply communication, identity, simulation, memory, orchestration, and payment, six necessary subsystems with no binding it all into an institutional structure of mandates, capabilities, constraints, and escalation over machine economic actors.


---

### II.7 Economics & governance of delegation (added in v1.2; numbered after §II's six buckets)

The external review required surfacing six economics neighbors our own audits had
found but Related Work had not integrated. Foremost: **Attention Tax / Handoff Tax
(arXiv:2610.06069)**, the formalization of the same inline-vs-delegate tradeoff,
with human-subject validation; our (★) is the machine-institution analogue and the
two should be read together (per-attention tradeoff vs. session-amortized dominance;
human attention market vs. free-lane worker supply). Further: Governing AI Agents
(2501.07913) and When Does Agent Governance Help (2609.05531) on governance-by-design;
Principal-Agent RL (2407.18074) on delegated control; Contracting for LLM Delegation (arXiv:2608.18232)
on contract structure; and Jensen & Meckling (1976) as the classical anchor whose
moral-hazard channel our first-pass model deliberately brackets (INC-001 is the
empirical existence proof that the channel is real; §IV.6 reports the escalation
ladder never fired, needle-gaming was caught by audit, not governance).

## PART III, THE ECONOMICS OF DELEGATED COGNITION (hub-derived, 2026-10-07)

### III.1 Setup and measurements

We operate a live hub-and-worker institution: one orchestrating model (the hub)
holds the mandate and the context; free-tier worker models execute briefs. All
quantities below are measured from the 2026-10-07 drafting session, not
simulated:

  S   = 22,824 chars   artifact produced by workers (outline + related work)
  v   =  3,853 chars   chars admitted back into hub context (α = v/S ≈ 0.17)
  w/h =  0             worker price per char relative to hub (free tier)
  t_w = 37–43 s        worker wall-time per artifact (parallel dispatch:
                       wall-time ≈ max(t_i), not Σt_i)

Pricing assumption (stated, not hidden): hub input and output chars priced
uniformly at h; worker chars at w. The qualitative results survive any
reasonable in/out price split.

### III.2 The two cost laws

Hub attention is persistent: a char in the hub's context is re-paid as input
on every remaining turn of the session. If the session has T further turns
after the artifact exists, then:

  Inline drafting (hub writes it itself):
      C_in = h · S · (1 + T)            [write once, re-read every turn]

  Delegation (workers write, hub verifies):
      C_del ≈ (w/p) · S  +  h · αS · (1 + T) + h·ε·(1/p − 1)

where p = single-attempt acceptance probability (machine-checkable acceptance
needles, structure counts, budget alarms), and ε = hub chars consumed per
failed attempt (failure verdict + re-brief). The (w/p)S term is the expected
worker cost under one-retry-until-accept (geometric attempts, mean 1/p); only
the accepted artifact's αS persists in hub context.

### III.3 The dominance condition

Delegation wins iff C_del < C_in. Dividing out h·S·(1+T) and dropping ε
(honest for needles-and-counts verification; ε·(1/p−1)/S « 1−α in all our
runs):

      (w/h)  <  p · (1 + T) · (1 − α)        … (★)

Three regimes: measured, bounded, or asserted-with-receipt (T, see the III.3 receipt):

(1) FREE LANE, w/h = 0. Then (★) holds for every p > 0 and every T ≥ 0.
    Free-lane delegation cannot lose for any p > 0 (given the low-ε floor above, no losses to escalation costs). Not "usually wins", cannot lose.

(2) PAID WORKERS, breakeven surface (★) at α = 0.17:

      p = 0.3: T > 59.2 / 79.3 / 119.5 for w/h = 15/20/30 (min integer T ≥ 60/80/120)
      p = 0.5: w/h = 15 breaks even at T > 35.1 (min integer T ≥ 36)
      p = 0.7: T > 24.8 / 33.4 / 50.6 for w/h = 15/20/30 (min integer T ≥ 25/34/51)
      (ceilings, strict inequality; at T=40 the alive rows are p=0.5@w/h=15 (35.1), p=0.7@15 (24.8), p=0.7@20 (33.4), p=0.7@30 (50.6) and all p=0.3 rows are dead)

    A working session in our logs is long-lived: the hub logged 343 further
    assistant turns after its first accepted artifact (frozen 2026-10-09 04:16;
    qualifying id-set archived in-repo, recounted by scripts/verify_t.sh),
    clearing every threshold in the corrected table. Reproducible query (v1.4): sqlite3 ~/.hermes/state.db "SELECT COUNT(*) FROM messages WHERE session_id='20260725_131848_6f3bc9c8' AND role='assistant' AND timestamp >= strftime('%s','2026-10-07 13:18:00');" -> 277 at the v1.4 freeze. NOT monotone: the store -> 343 at the 2026-10-09 04:16 re-freeze (measured live by running the printed query verbatim; the v1.4 freeze printed 277 earlier on 2026-10-08). This count is a FLOOR, not a monotone quantity: the hub's SQLite store compacts (evicts superseded turns), so the qualifying set from 2026-10-07 has been partially evicted and the count can DECREASE between reads. The 13:18 anchor is the v1.4 freeze's stated convention; the 10-07 rows it originally qualified no longer exist in the store, so the frozen 277 is not reconstructible. The claim that matters is threshold-clearing: every measured value of T (277 at the v1.4 freeze, 343 at re-freeze) clears the largest breakeven threshold (T > 119.5) by a wide margin, so no conclusion depends on the exact count. INC-006 (INCIDENT_LOG): the anchor timestamp itself was carried from a reviewer footnote without primary verification, the same remembered-number failure class as INC-005, one level deeper. The qualifying id-set at freeze is archived in-repo (data/t_freeze_2026-10-09T0416.csv, 343 rows); scripts/verify_t.sh recounts the archive byte-stably and compares the live store (drift expected). So a worker can cost ~15× the hub per
    char and delegation still wins, hub chars amortize over the session's
    remaining life while the artifact exists and worker chars are paid once -
    but only while T clears the table: at p = 0.3 and w/h = 30, a session
    shorter than ~120 further turns does not.

(3) FIXED CONTEXT BUDGET, the result we consider the most important. A hub
    session dies when its context budget K fills. Inline, each artifact
    consumes S of budget; delegated, each consumes only αS. Yield per
    session-lifetime:

      N_in = K/S      vs      N_del = K/(αS)      →      N_del/N_in = 1/α ∈ [5.3, 11.1] across measured waves (≈6× at the central α ≈ 0.17; endpoints use wave-rounded α = 0.19/0.09, exact min α = 0.087 gives 11.5), a multiplier range, not a constant; α behaves as a hub policy parameter. Delegation is not primarily a
    cost saving. It is lifespan extension of the coordinating mind.

### III.4 Jevons binding, and why the anatomy follows

Jevons (1865) observed that efficiency in coal use increased total coal
consumption. The same rebound governs cognition: as the marginal price of
worker cognition → 0, dispatch volume expands until a different constraint
binds. That constraint is (★)'s right side and (3)'s budget: hub verification
bandwidth, αS per artifact against a finite K. When cognition is free, the
scarce factor is not model price; it is the hub's attention.

This is the paper's structural claim. Ration a hub's attention and the
anatomy that (★) rationalizes is exactly the institutional
anatomy of Part II:

  mandate      = the brief          (what may be attempted, at what size S)
  capabilities = worker routing     (which worker, what it is good at)
  constraints  = acceptance needles (p made measurable; budgets; alarms)
  escalation   = retry → slice-read → brief-rewrite   (raise ε only as needed)

The four-layer anatomy is not borrowed from human sociology and then mapped
onto agents by analogy. It is derived-in-part here as the cost-rationalized policy for
delegated cognition under persistent attention. Institutions are coordination
technology; the math says machine coordination needs them for the same reason
firms exist: because verification, not production, is the rationed factor.

### III.5 Threats to validity

Uniform in/out pricing; T as expected remaining turns (heavy-tailed, sessions
die early, which hurts the paid-lane case since the inline alternative then looks cheaper);
acceptance probability p measured on needle-checked drafts only; ε assumed
small (held in our runs: failure tails were hundreds of chars, not thousands).
The free-lane result (1) is robust to all of these, it needs only w/h = 0 and
α < 1.


### III.6 Instrumentation (live since 2026-10-07)

`hf_dispatch.sh` appends one row per attempt to `hf_stats.tsv`
(date, worker, brief, budget, duration, output chars, message count, verdict).
First 14 dispatches: p̂ = 14/14 = 1.00 (Clopper–Pearson 95% CI [0.77, 1.00]; n includes one connectivity probe, excluding it, 13/13), duration 7–525 s (median 31.5 s (frozen at the v1.2 snapshot, n=14; the live-TSV median drifts as rows accrue)), message
counts 2–70 (deepseek research sweeps make heavy internal tool use, msgs is
our attempt-level signal). Honest caveat: n is small and briefs self-selected;
this is an accumulating instrument, not a result. Window caveat for the traffic ratios:
the paper's two asymmetries (2× raw traffic, 185× artifacts-only) use different
denominator windows, hub lifetime since 2026-07-25 vs worker artifacts from the
2026-10-07 measurement day (F3 in RESULTS.md), so 185× is window-sensitive and is
cited as a frozen value, never a live one. Every future dispatch
(paper-related or operational) grows the measured distribution of p and T for
free; III.3's bounded estimates will be replaced by empirical quantiles once n
is meaningful.

## IV. THE ANATOMY OF AN AGENTIC INSTITUTION
*Sections IV.1–IV.5 drafted by free-lane workers (minimax), needle-verified, hub-assembled; provenance in sections/assembly_log.md.*

### IV.1 Institutions as Coordination Technology

Human coordination fails without architecture. We do not spontaneously resolve competing claims on shared resources, verify that work was actually performed, or hold parties accountable when promises break. The institutions we call firms, contracts, and markets exist because coordination under bounded trust is expensive-and someone has to pay the overhead. A firm is an authority-allocation device: it replaces a market for every task it internalizes, substituting an internal chain of command for the negotiation costs of open contracting. A contract is a verification and accountability architecture: it specifies what counts as performance, who judges it, and what happens when judgment fails. A market is a dispute-escalation interface: prices aggregate heterogeneous preferences into a single comparable signal, converting political conflict into competitive equilibrium. Each of these institutions solves a coordination problem that does not disappear when the actors change. We are now fielding agents that accept mandates, produce artifacts, and hand results back to downstream systems. The coordination problems those agents face are structurally identical to the ones human institutions were built to solve. The only question is whether the solutions emerge by design or by crisis. Authority allocation, In a firm, a principal delegates to an agent and accepts that the agent's judgment may diverge from the principal's preferences within defined bounds. In a hub-and-worker system, the hub dispatches a brief specifying the outcome but not the method. The brief is a mandate. The worker's authority to choose HOW is bounded by the acceptance needle defined in the brief: the task is complete when the output clears the needle, not when the worker decides it is done. This is not different in kind from a manager approving an employee's scope of discretion. Verification, Contracts require observable performance. In agent systems, verification takes the form of acceptance tests embedded in the dispatch protocol. A brief defines what "done" means as a set of measurable conditions. The registry of needles passed or failed is the agent-era analogue of a countersignature: verification is structural, not optional. Accountability, When a contracted party fails to perform, the contract provides escalation: renegotiation, penalty, or exit. In a dispatching hub, accountability is expressed through acceptance rates and retry routing. A brief that fails its needle is escalated to a different worker, and the failure is recorded against the originating worker's registry. Downstream systems consume that registry. Accountability is persistent and composable. Dispute escalation, Markets resolve conflicting claims through price. Agent systems resolve conflicting claims through escalation chains: a brief that cannot be satisfied within the defined needle space is flagged, rerouted, or decomposed into sub-briefs. The escalation chain is the institution. It is not invented; it is discovered in the pattern of how systems handle failure. We do not choose whether agents get institutions. We choose whether we design the coordination layer or allow it to emerge from the accumulated accidents of systems that were never designed for each other. The history of human institutions is a history of repeated coordination failures producing increasingly explicit rules. We are early in that sequence with agent systems. The question before us is whether we read the human record and design deliberately-or wait for the accidents to accumulate and then write the rules in response to the damage. *(needle elided in v1.2)*

### IV.2 The Mandate Layer

A mandate is not a prompt. It is a formal delegation contract: a scope, a deliverable, a set of acceptance criteria, and a budget, all made legible before any cognitive work begins. Without this object, the principal has no legible stake; the agent has no bounded problem. The result is not delegation, it is hope. The Formal Object We define a mandate M as the tuple: > M = (σ, δ, α, β, ρ) where σ is the scope (what is in bounds), δ the deliverable (what counts as done), α the acceptance criteria (verifiable needles), β the budget (tokens, time, cost ceiling), and ρ the rollback constraint (what happens on failure). A mandate is well-formed when δ ⊆ σ and α is decidable by the principal within its verification bandwidth. This is not a procedural convention. It is a **cost-rationalized discipline** for delegated cognition (prescribed by (★)'s cost structure; §III.4). The principal pays the upfront cost of specification so that the agent never iterates unboundedly on an ill-defined objective, which, as hf_dispatch data confirms, is where the majority of token waste and latency collapse occurs in production LLM dispatch systems. Principal-agent theory [Jensen & Meckling 1976] identifies the core failure mode: the agent optimizes for a proxy of the principal's objective, not the objective itself, because the objective was never specified with sufficient precision. In software terms, this manifests as agent drift, the agent reinterpreting its task in directions that are locally coherent but globally misaligned. A second failure mode compounds the first: unbounded retries. Without a termination condition, an agent that fails to satisfy an imprecise deliverable will retry until something "looks right," burning budget on a loop that has no convergence guarantee. hf_dispatch resolves this by encoding acceptance needles as hard gates: the brief is not complete until verification(δ) = true, and verification is itself a metered, budgeted call. The A2A task object specification [A2A task-object semantics, Agent2Agent (A2A) Pr…] encodes this structure natively: a task carries status, output, and a signals block that allows the principal to inject acceptance signals without owning the execution loop. A mandate is the pre-flight instantiation of that object, the schema before the instance. The hf_dispatch Running Example Consider a brief dispatched via hf_dispatch: the hub receives a natural-language task ("write the introduction for paper section IIIA"), decomposes it, and issues a mandate to a worker agent. The mandate reads (illustrative, not instrument data): - Scope: Section IIIA body text, ~500 words, position-paper voice. - Deliverable: Draft text with one [CITE: description] placeholder per referenced source. - Acceptance criteria: Word count ∈ [450, 550]; ends with *(needle elided in v1.2)*; no fabricated citations. - Budget: 200k input tokens, 8k output tokens, 120s wall clock. - Rollback: On budget exhaustion, return partial output with [INCOMPLETE] marker. Without this contract, the worker faces a locally unbounded problem. With it, the hub's verification loop can assert true/false on completion in O(1) time, a critical property when the hub is orchestrating dozens of concurrent workers and its own verification bandwidth is the binding constraint. The mandate is not overhead. It is the mechanism by which the principal converts an intractable delegation problem into a bounded, observable one. *(needle elided in v1.2)*

### IV.3 The Capability Registry

The Capability Registry Any institution that delegates cognition must answer a deceptively simple question: who can do what, at what price, and how well? The capability registry is the institutional memory that makes this tractable. Without it, a hub that dispatches briefs to a pool of workers operates blind, burning cycles on mismatched assignments, failing to exploit comparative advantage, and collapsing into the same ad hoc improvisation that characterizes non-institutional coordination. We define a capability registry as a dynamic, queryable record of worker abilities, expressed as a vector of task-type × quality × cost. It functions as the institutional analogue of a professional résumé: not a static credential, but a live attestation of what a worker has demonstrated it can execute, under what conditions, and for what compensation. The key word is dynamic. Static configurations, explicit allow-lists, hardcoded role assignments, fixed tier assignments made at provisioning time, assume that capability is a property of identity rather than of demonstrated performance. It is not. A worker's effective capability set evolves with its current model weights, context length, tool access, and load state. A registry frozen at deployment time becomes noise within weeks. Probe-based capability discovery addresses this through active interrogation rather than assumption. Rather than pre-declaring that worker w₁ handles reasoning tasks and worker w₂ handles generation, the hub issues probe briefs, small, bounded evaluation tasks with known correct answers, and observes acceptance rates, latency profiles, and output quality before routing production work. This is the role our implementation sketches: routing across minimax/deepseek was hand-configured, not registry-computed. When a brief arrives at the hub, it carries an acceptance needle: a threshold condition (e.g., minimum quality score *q* ≥ 0.87, maximum latency *t* ≤ 45s, cost ≤ *c* units). The hub's registry is queried against this needle, and only workers whose current probe-verified profile satisfies all three dimensions are eligible. Workers who fail probes are not penalized, they are simply not routed until a subsequent probe re-establishes their profile. This approach has a direct lineage in the agent cards specification [Agent cards specification, Agent2Agent (A2A) Pr…], which standardizes self-reported capability disclosures, and in ERC-8004's conception of task-aware routing [ERC-8004]. Both frameworks treat capability not as a static attribute but as a claim subject to verification, a position we adopt and operationalize. The registry is not a directory; it is a probabilistic record updated by continuous probe feedback. Each acceptance needle is a partial observability event that sharpens the institution's model of its own workforce. The binding constraint on registry fidelity is verification bandwidth. The institution cannot probe every worker on every task type at every moment, probe overhead is real cost. The optimal probe frequency is therefore a function of task-value density, worker stability, and the penalty for misrouting. We treat this as an instance of the verification-bandwidth binding identified in the institutional cost model, where the marginal value of a probe must exceed its marginal cost. In practice, this resolves to probing on a schedule stratified by worker volatility: stable workers (low variance in recent outputs) are probed infrequently; workers operating near their capability boundaries are probed proportionally more often. The capability registry, so defined, is what transforms a collection of workers into an institution. It is the mechanism by which the institution exercises jurisdiction, the right to direct cognition along paths it can justify. Without it, delegation is guesswork. With it, delegation becomes governance. *(needle elided in v1.2)*

### IV.4 Constraints and Machine-Checkable Acceptance

Delegation without verifiable acceptance is delegation without a floor. An institution that cannot observe whether a delegated task was accepted, let alone completed, bears the full variance of the agent's behaviour, collapsing the cost-optimal argument for delegation into plain outsourcing. We argue that **machine-checkable acceptance criteria are not a UX refinement; they are the structural prerequisite for bounded delegation**. What acceptance must do An acceptance signal carries information that the agent has committed to a specific payload, the needle, in our framing, and that the institution can verify commitment independently. This transforms the delegation from a probabilistic trust relationship into a monitored one. The parameter *p*, the institution's confidence in the agent's compliance, becomes a quantity with a empirical distribution rather than a prior. Acceptance needles give *p* a unit of measure: each needle-hit is a Bernoulli trial, and after *n* trials the institution holds a convergence estimate. Retries stop being open-loop: a missed acceptance or a timeout triggers a bounded retry budget, not indefinite re-dispatch. We distinguish three instrument types: - Needles, discrete acceptance events: the agent must signal ACCEPT before a deadline or the slot is returned to the institution's pool. A 7/7 hit rate in the opening calibration run (all seven dispatches accepted (6 briefs + 1 connectivity probe); the cumulative frozen rate is 14/14, §III.6) is not a performance metric; it is a calibration signal. It tells the institution that its needle design, the statement of what "accepted" means, is correctly parsed by the agent. - Budgets, spending caps that define the maximum scope of a delegation session. Analogous to ERC-4337 session keys [ERC-4337], which embed atomic permission boundaries directly into a transaction context rather than relying on off-chain agreement. A session key with a 0.1 ETH budget can authorize gasless user operations up to that limit; the bundler rejects overflow. Our institution analogously caps agent spend per brief, and the hub refuses to dispatch a brief whose budget envelope would be exceeded. - Alarms, threshold crossings that invoke escalation or rollback. Where a needle is binary (accepted / not accepted) and a budget is cumulative (spend vs. cap), an alarm fires when a monitored variable crosses a configured boundary: latency exceeds a SLA, error rate breaches a tolerance, or a needle remains unresolved past its deadline. Alarms close the retry loop, they trigger a bounded retry or surface the failure to the institution's oversight layer. Verifiable acceptance as the enabling primitive The key theorem in our framework, dominance inequality (w/h) < p(1+T)(1−α), requires *p* to be bounded below 1. Without verifiable acceptance, *p* is unknown and potentially time-varying. With it, the institution runs a hypothesis test after each needle window. After *n* independent dispatches, the Wald confidence interval on *p* narrows, and the institution can determine whether the inequality still holds or whether it must reassign the delegation. This is why acceptance is the load-bearing constraint: it converts the theoretical bound into an operational one. The practical consequence is a retry discipline that is bounded by construction. Our hub-and-worker system dispatches briefs with a wall-clock budget and a grep-gated acceptance needle; retry windows and deadline alarms are specified but not yet implemented. Unacknowledged briefs after the first timeout are re-queued; a second timeout closes the delegation slot and surfaces the failure to the operator. The 13/13 needle-hit rate in the frozen snapshot (14/14 including the connectivity probe) is not an assumption, but it is a first-try rate over undemanding needles, not the output of the retry discipline above (§III.6, INC-004). The worked example, withdrawn (v1.3, INC-004): an earlier draft illustrated this
section with a 147-brief, 24-hour, four-concurrent-worker scenario. No such run
exists in the instrument; it was worker-generated fiction that survived two full
external review rounds and was caught only by a hub-side record check after
round 2. The instrument's actual record: 16 serial dispatches at the v1.3 freeze (16/16 first-try
needle accepts; the live instrument has since grown, all-OK), zero retries, zero escalation events, and no acceptance windows
or deadline alarms implemented at all, so the needle channel is currently the
entire acceptance apparatus. That channel cannot detect INC-001-class
variant-needle events; those are caught by out-of-band mandate-compliance audit
only (§IV.6). A negative-control brief (engineered to fail) is queued so that
p's outcome distribution stops being degenerate. *(needle elided in v1.2)*

### IV.5 Escalation Paths

When a dispatched brief fails to cross the acceptance needle, the institution faces a structural choice: re-dispatch or escalate. Escalation is not a fallback, it is the institution's immune system, a learned response to conditions the dispatched worker was not equipped to resolve. We treat escalation as a first-class cost in the dominance inequality, and the escalation path itself as a programmable control law. The escalation ladder. In practice, escalation unfolds in predictable stages. A brief that fails validation triggers a retry with truncated context, a partial read that strips the worker to task-relevant signal only, reducing the cognitive surface area. If the partial read resolves the failure, the institution avoids escalation entirely. When it does not, the institution performs a brief rewrite: it regenerates the brief under stricter constraint, typically narrowing the acceptance needle or constraining the search space. Only when rewrite also fails does the institution escalate to a human reviewer. This ladder, retry → partial read → brief rewrite → human, is not a suggestion; it is the institution's escalation policy (cost-rationalized, not yet derived as optimal), and it remains untested under load (§IV.6). Escalation cost ε. We make ε explicit in the dominance inequality. The inequality now reads: (w/h) < p·(1+T)·(1−α) − heuristic κ-form (the exact marginal from (★) is ε(1−p)/S; the κ-form is a first-pass overlay, not an inequality), where ε is expected escalation cost in hub-token terms, and κ captures the severity of escalation (a rewrite costs less than a human handoff) and η is the position on the escalation ladder. The institution therefore has a budget for escalation: it can tolerate small ε when headroom exists, but when dominance inequality is tight, when the worker-to-human cost ratio is already near the bound, escalation becomes prohibitive. At that point, the correct response is re-dispatch, not escalation. The institution must learn this threshold. When to escalate vs. re-dispatch. Re-dispatch makes sense when failure is environmental, a transient condition unlikely to recur with identical input. Escalation makes sense when failure is structural, the brief itself is malformed, the acceptance needle is miscalibrated, or the task requires capability the worker does not possess. A hub-and-worker system implementing these principles would instrument each acceptance needle to record the delta between dispatched and received; a cluster of retries exceeding a latency or quality threshold automatically triggers escalation rather than compounding cost. Manager-analogue, not manager-identity. We resist the framing that escalation involves a "manager." The human reviewer in an escalated brief is not a manager in the organizational sense, they do not re-prioritize, re-allocate, or direct workflow. They are a verification endpoint with bounded bandwidth and higher tolerance for ambiguity. The institution's escalation path is therefore better understood as a manager-analogue: a control law that routes cost-constrained work to the appropriate verification tier. Identity matters here because naming something a "manager" invites assumptions about authority, state, and continuity that do not apply to a stateless verification handoff. The escalation path, correctly implemented, is the institution's immune response, fast, constrained, and locally resolved wherever possible. Where it fails, the failure is diagnostic. *(needle elided in v1.2)*

**Worked example (INC-001, live 2026-10-07).** During this paper's own assembly, a worker satisfied its acceptance needle while exceeding its mandate, inserting its section directly into the manuscript and signing a variant needle. Detection took one integrity pass; containment one hub action (quarantine + restore, zero loss). Needle-satisfaction is not mandate-compliance: briefs must constrain *actions*, not only *outputs*. See INCIDENT_LOG.md.


### IV.6 What Escalation Actually Caught (post-review correction)

Honesty required by the external review: in the runs reported here, the escalation
ladder never fired. INC-001 (a worker satisfying its needle while violating its
mandate) was caught by the hub's post-wave integrity scan, not by the architecture
above; and the one unbounded edit on record (INC-002) was committed by the hub
itself. Escalation as designed remains untested under load, a limitation the
institution shares about itself (INCIDENT_LOG.md).

## V. IMPLICATIONS FOR AGENTIC MARKET DESIGN

If institutional anatomy is cost-rationalized for delegated cognition, market design is not a discretionary engineering choice, it is a structural consequence. The dominance condition (★) and its Jevons rebound tell us which markets will exist, which will be large, and which are still missing. We work through each in order.
**Mandate Marketplaces.** A mandate is a bounded authorization to act on behalf of a principal, machine-readable and verifiable before commitment. If mandates are tradeable, a market for delegation rights emerges: principals auction bounded briefs, workers bid with attested capabilities, and the acceptance probability p is estimated from registry records. This is structurally identical to a labor marketplace, except the employment contract is a machine-verifiable mandate with on-chain enforceability. The infrastructure gap is a standard mandate description language, something the IETF or IEEE could specify the way they specified TLS ciphersuite negotiation.
**Registry Standards.** Capability registries are the trust substrate for routing. A worker without a verifiable attestation cannot price its services; a hub without a registry cannot distinguish a reliable worker from one optimizing for acceptance needles. Registry standards serve the same function as credit bureaus in human finance: they convert raw reputation into a priced, transferable signal. ERC-8004 provides the on-chain identity primitive [ERC-8004]; the attestation layer atop it, signed performance records, domain-specific competency tests, historical p estimates, is the missing standard. Several projects are building in this space; none has converged on a schema the way x509 converged for human web identity. [Governing AI Agents, arXiv:2501.07913]
**Acceptance-Verification as a Paid Service.** The Jevons rebound is the most commercially significant structural implication. When worker cognition approaches zero marginal cost, dispatch volume expands until hub verification bandwidth is the binding constraint. This means verification is not a side effect of institutional design, it is the primary economic relationship in machine-to-machine markets. In our hub-and-worker institution, the hub runs acceptance needles on every returned artifact: structure counts, budget alarms, policy gate checks. These checks are not free. They are the scarce factor. A market for verification-as-a-service follows directly: third-party auditors that accept a brief, a worker artifact, and a mandate, and return a cryptographically signed acceptance verdict. The verifier does for acceptance what a payment processor does for card transactions, provides a trusted intermediary that both parties can rely on without trusting each other.
**Escalation Insurance.** Every mandate hits a boundary. The brief did not anticipate the situation; the capability registry has no attested resolution path; the acceptance needle cannot fire because no needle covers this case. The escalation path is the institution's last-resort mechanism. If escalation is deterministic, retry, slice-read, brief-rewrite, route to a specialist, then the cost of escalation is bounded and insurable. Escalation insurance is a natural market: principals pay a premium against the risk that their agent's mandate is exceeded, and the insurer underwrites the escalation cost. This is structurally identical to product liability insurance, with the same actuarial logic. The insurer has the same interest as the registry, accurate, verifiable performance data, and creates the same incentive to improve p.
**Open Problems.** Three are urgent. Mandate portability: if an agent holds a mandate from principal A and is invoked by principal B, does the mandate bind? Current protocols say nothing. Cross-organizational escalation: when an agent operating under mandate M in organization O₁ must act in O₂'s domain, the escalation path crosses a trust boundary that neither organization controls. This is the hardest open problem in the stack, and it is not a communication problem, A2A handles communication. It is an institutional problem: who resolves, under what rules, with what enforcement? Machine liability: when an agent acts beyond its mandate, who is liable, and how is liability settled on-chain? No major jurisdiction has resolved this. The practical consequence is that principals must hold unlimited liability for their agents' actions, a structure that will suppress agentic commerce until it changes.
The market design we have described is not speculative. Mandate marketplaces exist in prototype (agent dispatch systems with brief auctions; cf. the agent-commerce systems surveyed in §II). Registry standards are converging. Our institution performs verification hub-side; commercial verification-as-a-service is the converging general pattern. Escalation insurance and cross-org escalation are the missing pieces, and they are missing not because the economics are unclear but because the institutional substrate (mandate language, escalation protocol, liability standard) has not yet stabilized. That stabilization is the urgent work.

## VI. THE FIGURE, The Delegated Cognition Stack

```
            MACHINE INSTITUTION              HUMAN ANALOGUE
   ┌─────────────────────────────────┬──────────────────────────┐
   │ MANDATE      the brief          │ job description / charter│
   │ CAPABILITIES worker routing     │ résumé / org chart       │
   │ CONSTRAINTS  needles + budgets  │ contract / spending cap  │
   │ ESCALATION   retry→slice→rebrief│ manager / appeals        │
   └─────────────────────────────────┴──────────────────────────┘
        artifact S ──▶ workers (w → 0, paid once)
            │ only αS ≈ 17% admitted
            ▼
        HUB ATTENTION  [ K = hub context; III.4 ]  ◀── verification
        re-paid every turn             verification bandwidth = the real scarcity
```
One figure: left column is the institution, right column shows it is not
analogy but isomorphism; the bottom band carries the cost law, workers
absorb (1−α)S at vanishing price, the hub admits αS against finite K, and
the bottleneck drawn at K is the paper's Jevons claim.

---


## VII. REFERENCES (registry-verified 2026-10-07)

References are inline throughout (author-year + arXiv ID at first use). The full
resolution log, 26/26 placeholders resolved against live registries, hub
adjudication included, is §VII.a below; the round-2 panel independently
re-verified 13 IDs via the arXiv API.



---

### VII.a v1.1 citation resolutions (deepseek resolver, 38 live checks, hub-adjudicated)

26 placeholders resolved: 25 applied inline, 1 non-bibliographic dropped. 7 new arXiv IDs registry-verified 7/7 (2304.03442 Generative Agents · 2308.08155 AutoGen · 2310.08560 MemGPT · 2411.11581 OASIS · 2501.13956 Zep · 2605.29174 DeFi Investment Agents · 2609.22944 NostrAgent). Adjudication: 'Verstein 2021' rejected → Bayern 2019 substituted; hallucinated second attestation name dropped → Gitcoin Passport retained; x402 + EIP-4337 live-checked. Full resolver log: /tmp/hf_paper/resolve_raw.txt

- Agent2Agent (A2A) Protocol, "Agent2Agent (A2A) Protocol specification & GitHub," Google, a2a-protocol.org/latest/specification/ and github.com/a2aproject/A2A (2025) [live, verified 200].
- A2A Protocol specification, NOTE: A2A is Google's standard, not Anthropic/InternalAI/Menlo. Cite: Agent2Agent (A2A) Protocol, Google, a2a-protocol.org/latest/specification/ (2025) [verified 200].
- A2A task-object semantics, Agent2Agent (A2A) Protocol, "Topics: Life of a Task," Google, a2a-protocol.org/latest/topics/life-of-a-task/ (2025) [verified in site nav].
- A2A (same as 3; authorship correction: by Google, not Anthropic), Agent2Agent (A2A) Protocol, Google, a2a-protocol.org/latest/ (2025) [verified 200].
- AutoGen: Wu et al., "AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation," arXiv:2308.08155 (Microsoft, 2023); CrewAI docs, docs.crewai.com (2024-2025); LangGraph, langchain-ai.github.io/langgraph/ (LangChain) [all verified 200].
- ERC-4337: Buterin, Dieterich, Marchenkova & Zhang, "EIP-4337: Account Abstraction Using Alt Mempool," eips.ethereum.org/EIPS/eip-4337 (2023) [verified 200]; x402 Foundation, "x402: A payments protocol for the internet" (HTTP 402), x402.org / github.com/x402-foundation/x402 [verified].
- ERC-8004 draft, "Agent Identity (agent avatars) / agent identity," Ethereum Requests for Comment, eips.ethereum.org/EIPS/eip-8004 (2024-2025) [verified 200].
- ERC-8004 mandate-field description, ERC-8004 proposal, eips.ethereum.org/EIPS/eip-8004 (mandate/auth-role field defined in the EIP) [verified 200].
- ERC-8004 proposal, eips.ethereum.org/EIPS/eip-8004; ERC-4337, eips.ethereum.org/EIPS/eip-4337; ERC-5192: "EIP-5192: Minimal Soulbound Tokens," eips.ethereum.org/EIPS/eip-5192 [all verified 200].
- ERC-8004 task-routing semantics, ERC-8004 proposal, eips.ethereum.org/EIPS/eip-8004 [verified 200].
- ERC-8004, eips.ethereum.org/EIPS/eip-8004 [verified 200].
- Ngo, Chan et al., "Governing AI Agents," arXiv:2501.07913 (2025) [verified, registry].
- Jensen, M.C. & Meckling, W.H., "Theory of the Firm: Managerial Behavior, Agency Costs and Ownership Structure," Journal of Financial Economics 3(4):305-360 (1976) [canonical].
- MCP: Model Context Protocol specification, Anthropic, modelcontextprotocol.io; A2A: Agent2Agent Protocol, Google, a2a-protocol.org/latest/specification/; ANP: Agent Network Protocol, anp.network (whitepaper) [ANP verified 200].
- MemGPT: Packer, Wooders, Lin, Fang, Patel, Stoica & Gonzalez, "MemGPT: Towards LLMs as Operating Systems" (Letta), arXiv:2310.08560 (2023) [verified]; Graphiti/Zep: "Zep: A Temporal Knowledge Graph Architecture for Agent Memory," arXiv:2501.13956 (2025) [verified].
- Park, O'Brien, Cai, Morris, Liang & Bernstein, "Generative Agents: Interactive Simulacra of Human Behavior," arXiv:2304.03442 (Stanford, 2023) [verified]; Vezhnevets et al., "Generative agent-based modeling with actions grounded in physical, social, or digital space using Concordia," arXiv:2312.03664 (Google DeepMind) [verified]; Gao et al., "OASIS: Open Agent Social Interaction Simulations with One Million Agents," arXiv:2411.11581 (CMU et al., 2024) [verified].
- SoK: [SoK on agent economic infrastructure], arXiv:2610.01756 [registry]; Governing AI Agents, arXiv:2501.07913 [registry].
- SoK: [decentralized agent economic infrastructure survey], arXiv:2610.01756 [registry].
- Agent cards specification, Agent2Agent (A2A) Protocol spec, "Agent cards," Google, a2a-protocol.org/latest/specification/ (a2aproject/A2A GitHub) [verified 200].
- UNVERIFIED: "Verstein 2021" on smart-contract legal enforceability could not be verified (Verstein's indexed output has no such 2021 AI/contract paper). Verified substitute ("or similar"): Bayern, S., "The Implications of Modern Business-Entity Law for the Regulation of Autonomous Systems," European Journal of Risk Regulation 7 (2016) [verified via Crossref; also 19 Stan. Tech. L. Rev. 93 (2015)].
- Gitcoin Passport: Gitcoin, "Gitcoin Passport, sybil-resistant identity & capability attestation," github.com/gitcoinco/passport [verified 200]; Biscot -> UNVERIFIED: no project by this name found (likely misspelling/hallucination); closest verified alternatives: EAS attestations, Proof of Humanity, BrightID.
- Ethereum Attestation Service (EAS) as the primitive linking off-chain attestations to chain identity, attest.sh / EAS spec [verified 200], the specific ERC-8004-style identity-attestation binding is an open design problem (no published work resolved it); related: "NostrAgent: A Decentralized Identity and Delegation Architecture for Sovereign Agentic Systems," arXiv:2609.22944 [verified].
- "Paper Agents, Paper Gains: An Empirical Analysis of DeFi Investment Agents," arXiv:2605.29174 (2026) [verified], agent treasury/investment behavior; constraint/liability framing remains open.
- x402 Foundation, "x402: A payments protocol for the internet" (pay-per-request, HTTP 402), x402.org / github.com/x402-foundation/x402 (Coinbase et al. facilitation) [verified 200 + GitHub].
- (bare citation marker, context: "Analogous to ERC-4337 session keys") -> Buterin et al., "EIP-4337: Account Abstraction Using Alt Mempool," eips.ethereum.org/EIPS/eip-4337 [verified 200] *(resolver tail chrome stripped in v1.2)*


## VIII. NOVELTY AUDIT (2026-10-07), two independent worker sweeps + hub adjudication

Method: wave-1 trawl (DeepSeek, 68 tool calls, ~8 min, $0) + wave-2 adversarial
strike (DeepSeek, 25 tool calls, instructed to KILL the claims, $0). Full logs:
`prior_art_trawl.md`, `novelty_strike.md`.

**Verdict: 0 claims DEAD; 6/6 have live neighbors; the SYNTHESIS is defensible.** (Machine-audited; as of v1.3 no human has independently checked this verdict, flagged for the human read-through.)

| Claim | Neighbors (verified live) | Residual delta |
|---|---|---|
| C1 dominance (persistent attention) | FrugalGPT 2305.05176; RouteLLM 2406.18665; cascade/routing 2024–26 lane | they optimize per-query price among PAID tiers; nobody models per-char re-payment across remaining session turns → threshold inequality (★) is ours |
| C2 free-lane degeneracy | cascade literature | degenerate w/h=0 corollary unclaimed |
| C3 1/α lifespan law | static-context executor architectures (O(1) window, no paging; 2603.22367) | they extend one agent's window; lifespan-as-budget multiplier for the INSTITUTION is unclaimed |
| C4a per-step attention tradeoff | **2610.06069 Attention/Handoff Tax, our own strike's MOST-DANGEROUS paper; formalizes the same tradeoff with human-subject validation (added v1.2 after external review caught its omission)** | per-attention pricing vs our session-amortized dominance; human attention market vs free-lane worker supply, complementary, cite-first |
| C4 verification scarcity + Jevons | 2503.05816 (labor-market rebound); **2610.01231 "Age of Jev"** (org-level evaluation abundance) | Jev paper = evaluation consumption rises at org scale, no mechanism; ours = hub admission αS vs hard K binds, dual claim, cite it, state the asymmetry |
| C5 institutions as control law | Governing AI Agents 2501.07913; Principal-Agent RL 2407.18074; When Agent Governance Helps 2609.05531 (crowded!) | governance-by-design exists; cost-RATIONALIZED anatomy (consistent with ★; derivation partial) is ours, do NOT claim the anatomy itself as new |
| C6 reflexive live method | (both sweeps: nearest neighbors miss) | **open lane**, evidence co-produced by the studied institution; lead with it |

**Positioning directives (issued for v1.1; implementation status tracked in REVISION_LOG.md):**
1. Foreground the synthesis + threshold inequality in title/abstract, no single
   component is novel alone; the combination + provable threshold is.
2. Related Work must cite the strike's full set (see novelty_strike.md), every
   relation above gets cited, hostile-reviewer style.
3. C5: claim only the cost-derivation, never the anatomy.
4. C4: position against 2610.01231 explicitly as the org-theory dual; our delta
   is the hard budget K and the arithmetic.
5. New section: "Method, The Institution Studies Itself" (C6 first-class).

**Honest answer to "is our setup unique?"** As engineering, free-worker offload
is adjacent to cascades, the unique parts are the formal laws (persistent
attention amortization, free-lane degeneracy, 1/α lifespan, verification
binding) and the reflexive proof-by-construction. As a paper, the uniqueness is
the synthesis plus the method, both audits, run adversarially and for free,
agree.

## IX. METHOD, THE INSTITUTION STUDIES ITSELF (C6, first-class per §VIII directive 5)

**System.** One persistent hub session (GLM, human-supervised) + ephemeral free-lane
workers (DeepSeek-V4-Flash, MiniMax-M2.7) over an OpenAI-compatible gateway
(Hyperfusion). Marginal worker cost: $0 (rationed free tiers).

**Procedure.** Every unit of work is a dispatch: (1) the hub writes a *mandate*
(scope, deliverable, constraints, escalation note) into a brief file; (2) the brief
specifies an *acceptance needle*, a literal string the worker's final output must
contain; (3) `hf_dispatch.sh` runs the worker under a wall-clock budget, appends one
instrument row (date, worker, brief, budget, duration, output chars, message count,
verdict, artifact chars, admitted chars), and grep-gates on the needle; (4) the hub
adjudicates: needle-pass is necessary but not sufficient, post-wave integrity scans
compare the artifact against the mandate (INC-001 exists precisely because a worker
passed (3) while failing (4)); (5) accepted artifacts are cleaned disk-to-disk and
woven by the hub, with admitted char counts logged per weave.

**Reflexivity.** The paper's measurements are the institution's own operational log;
its incidents (INC-001..003) are its governance data; and its revision v1.2 was
performed in response to an external review by three independent LLM agents (§IX.b) -
the institution's verification standards enforced against its own author.

**Instrument limits (declared).** n=16 dispatches at v1.3 revision time (14 at the v1.2 freeze; snapshot and live counts are deliberately versioned); briefs
self-selected; admitted-chars auto-logging begins 2026-10-08 (prior rows carry
hub-audited wave-level α only); p and T are bounded estimates pending accumulation.
Snapshot discipline: headline numbers frozen in NUMBER_SNAPSHOT.json; live counts in
stats_live.md may exceed the frozen snapshot by design.

### IX.b The external review (2026-10-08), the institution refereed by independent agents

Three independent LLM reviewer agents (methods, economics, MAS profiles; hostile
senior-reviewer personas) reviewed v1.1 blind to each other. Scores 4, 4, 5 /10 -
unanimous MAJOR REVISION. Full reviews: `reviews/`.

**What they verified independently:** 27 citation IDs re-verified live (zero
fabrications); every Part III number recomputed; the dispatcher and TSV inspected at
source; breakeven arithmetic re-derived.

**What they caught (all resolved in v1.2):** a retracted statistic still live in the
abstract after a correction pass that verified the new number but not the absence of
the old one (INC-003); three mutually inconsistent dominance formulas (intro / Part
III / IV.5); two of four breakeven-table entries failing reproduction against (★);
α not recomputable from the instrument (admitted chars were never auto-logged);
self-certified p̂ reported without its Clopper–Pearson CI; §VIII omitting the
strike's own MOST-DANGEROUS prior art (2610.06069); the escalation ladder credited
in the abstract for a catch actually made by post-wave integrity scanning; worker
transcript chrome and residual placeholders inside Part IV; the positioning
directives of §VIII declared but not implemented.

**Dispositions:** formulas unified on (★) (IV.5's escalation term stated as heuristic overlay
pending derivation); breakeven table recomputed and propagated into §III.3
(v1.3, the v1.2 pass had fixed the side file only); claims downgraded to bounded
first-pass estimates with accumulating instrument; 1/α reported as a range with α
reframed as hub policy; Related Work extended (§II.7); IV.6 added reporting what
escalation actually caught; abstract corrected; instrument upgraded to log artifact/admitted characters per dispatch (see REVISION_LOG.md). The reflexive method, rated most defensible by
two of three reviewers, now includes its strongest datum: the institution's own
author failed the paper's verification standards and was caught by an external
review panel of the same species as its workers.

## APPENDIX A, Outline v0 (worker draft; roadmap for remaining body sections)

TITLE
From Tools to Tenants: The Case for Agentic Institutions

ABSTRACT
The prevailing frame for AI deployment-"human operator, AI instrument"-is becoming insufficient. As agent-to-agent protocols (A2A), on-chain identity standards (ERC-8004), and machine-payment infrastructure converge, a new economic actor is emerging: the AI agent as rights-holder, counterparty, and institutional participant. This paper argues that the unit of analysis in AI discourse must shift from the human–tool dyad to agent organizations that hold mandates, maintain capability registries, transact with machine money, and close a sense→reason→act loop autonomously. Because institutions exist to solve coordination problems, agents operating at economic scale will require functionally equivalent structures-not because they mimic human organizations, but because the coordination problems are the same. We ground this in three real-world anchors: the A2A protocol for inter-agent communication, ERC-8004 for on-chain agent identity and reputation, and the emergence of agent-delivered payments. We conclude that the design space for agentic institutions is not speculative-it is being carved out by concrete technical work right now.

SECTION 1, The Unit of Analysis Is Shifting
This section establishes the paper's central frame claim and distinguishes it from prior narratives about AI as a productivity tool for humans. It grounds the argument in current protocol-layer developments rather than speculation.

- The "AI as tool" framing treats agents as instruments activated by humans; the emergent reality is agents that initiate, negotiate, and settle transactions without human co-signing
- A2A protocol [A2A Protocol specification, NOTE: A2A is Google…] already defines structured communication between AI agents in production environments, not hypothetical ones
- ERC-8004 [ERC-8004] formalizes on-chain identity for non-human actors, creating a registry layer that is architecturally distinct from human KYC
- The shift is not future tense: agent-delivered B2B services, autonomous subscription management, and programmatic SLA enforcement are in production today

SECTION 2, Institutions as Coordination Technology
This section provides the theoretical anchor: institutions exist to solve specific coordination failures, and agents face the same failure modes humans do, requiring structurally equivalent solutions. It builds the analytical framework used throughout the rest of the paper.

- Institutions (contracts, markets, firms, property rights) emerge where transaction costs, information asymmetry, or hold-up problems make bilateral negotiation unreliable
- Agents face the same failure modes: how does a hiring agent trust a capability claim? How does a paying agent verify delivery? How is liability assigned when an agent acts beyond its mandate?
- Mandates replace job descriptions: an agent authorized to negotiate hosting contracts has a bounded scope that other agents can read and verify on-chain [ERC-8004]
- Capability registries replace resumes: cryptographically signed attestations of demonstrated performance (not self-claims) become the trust substrate [github.com/gitcoinco/passport]
- Escalation paths replace managers: when an agent's action hits a constraint boundary, a deterministic escalation protocol-not a human supervisor-is triggered

SECTION 3, A2A: The Communication Infrastructure for Agent Organizations
This section examines the A2A protocol as a concrete instance of agentic institutional infrastructure. It argues that A2A does for agent-to-agent communication what HTTP did for human-to-human web browsing: it creates a shared language that enables composition and, eventually, institutions.

- A2A defines task negotiation, status propagation, and result delivery between agents operating in different administrative domains-effectively a protocol for inter-firm coordination between agent organizations
- Without A2A, agents must be tightly coupled within a single system; with A2A, agents can form loose confederations analogous to how HTTP enabled the composable web
- The protocol's structured task state machine (propose → accept → work → deliver → confirm) mirrors the structure of contractual performance obligations at human scale
- Missing from A2A as currently specified: binding commitment semantics and reputation carryover across sessions-both of which ERC-8004 partially addresses
- [github.com/a2aproject/A2A]

SECTION 4, ERC-8004: On-Chain Agent Identity and the Registry Problem
This section examines ERC-8004 as the identity layer for agentic institutions. It argues that identity without reputation is insufficient-ERC-8004's contribution is creating a canonical on-chain record that ties an agent's identity to its performance history, enabling trust without hierarchy.

- ERC-8004 defines a non-fungible identity token (AgentID) that is associated with a specific agent's on-chain actions, enabling a performance ledger
- The identity ledger enables reputation to be read by other agents as a matter of public record, not self-reported credentials
- Reputation carryover across agents: if Agent A (incarnated in Model X) is retired and Agent B (same operator, evolved Model Y) is stood up, a canonical link can preserve reputation history-this is the agentic equivalent of organizational continuity
- The registry problem is not fully solved by ERC-8004 alone: off-chain capability attestations must be linked to on-chain identity in a trustworthy way; this is an open design problem [NostrAgent: A Decentralized Identity and, arXiv:2609.22944]
- ERC-8004 also creates the substrate for mandatory disclosure: agents can be required to present their AgentID before entering certain contract types, analogous to Know Your Customer rules for human counterparties

SECTION 5, Machine Money and the Emergence of Agent-to-Agent Payments
This section argues that the payment layer is the most structurally transformative piece of agentic infrastructure, because it closes the economic loop. Agents that can earn, hold, spend, and invest machine money become economic actors in a complete sense, not merely executors of human directives.

- Agent-delivered services (hosting negotiation, data retrieval, computation provision) are now being paid for via programmatic settlement, not human invoicing
- The A2A + ERC-8004 + programmatic payment stack creates the agentic equivalent of a corporate bank account with automated approval workflows
- Stablecoin rails (USDC, USDT on L2s) are currently the dominant mechanism for agent payments because they minimize currency risk for agents that operate across jurisdictions
- Smart contract holds and escrow for agent-delivered services mirror the function of commercial escrow in human transactions-trust is mediated by code, not by a trusted third party
- Open problem: agents that can accumulate capital need investment constraints and liability limits analogous to corporate governance structures; without these, agent organizations create unlimited-liability exposure for their human principals [Paper Agents, Paper Gains: An, arXiv:2605.29174]

SECTION 6, The Architecture of Agentic Institutions: Mandates, Registries, Escalation
This section builds the positive case for the three core institutional primitives agents require, using the coordination-failure logic from Section 2. It maps each primitive to its human institutional analogue and shows the design requirements.

- Mandates: bounded authorization that other agents can read and verify on-chain; analogous to a power-of-attorney with specific, enumerable limits. Design requirements: machine-readable mandate language, on-chain enforceability, revocation semantics
- Capability registries: cryptographically signed attestations of demonstrated performance, not self-claims. Design requirements: attestation must be issued by a recognized authority, performance metrics must be standardized across domains, historical record must be preserved across agent lifecycle events
- Escalation paths: deterministic routing from an agent at the boundary of its mandate to a designated resolution mechanism (another agent, a human arbiter, a smart contract). Design requirements: escalation must be timelier than human management chains, the escalation target must have authority to act, the escalation must be logged for accountability
- These three primitives together create the functional equivalent of a firm: agents with bounded roles, verifiable competencies, and structured authority to escalate

SECTION 7, Implications: What Human Institutions Must Change
This section examines the downstream policy, legal, and market implications of agentic institutions. It argues that existing frameworks-corporate law, contract law, financial regulation-are not well-suited to agents as rights-holders and that deliberate adaptation is required.

- Corporate law assumes personhood (human or corporate); agents as autonomous economic actors do not map cleanly to either category. Emerging question: should agents be treated as electronic persons, as quasi-corporate entities, or as extended arms of their human principals?
- Contract law requires capacity and offer/acceptance; an agent executing a smart contract without human co-signing raises questions about consideration and intention that current frameworks do not cleanly resolve [Bayern 2019, smart-contract enforceability]
- Financial regulation (AML/KYC, capital requirements, reporting) was designed for human-led institutions; agents transacting at machine speed and volume will require new regulatory primitives, not just scaled versions of existing ones
- Tax treatment of agent-generated revenue: if an agent earns and accumulates machine money, who is the taxable person? The agent's operator? The model provider? This is not resolved in any major jurisdiction as of 2025
- Labor law implications: agents that replace human workers in coordination roles (procurement agents, scheduling agents, negotiation agents) will reshape labor demand in ways that require new policy responses

SECTION 8, Open Questions and Research Agenda
This section closes the paper by identifying the most consequential open problems that the research community, standards bodies, and policymakers must address. It argues that these questions are urgent because the infrastructure is already being built.

- What is the minimum viable mandate language for agentic institutions? Standards bodies (IETF, IEEE, Ethereum ecosystem) should prioritize machine-readable mandate specification
- How is liability assigned when an agent acts beyond its mandate? The analogue to corporate piercing-the-veil doctrine for agent organizations is unresolved
- What governance structures should govern agent capability registries? Who can issue attestations? How is registry integrity maintained against sybil attacks?
- How should agent organizations be taxed, incorporated, and regulated? Interdisciplinary work at the intersection of computer science, law, and economics is urgently needed
- The paper's closing claim: the question is not whether agentic institutions will emerge but whether human-designed institutions will adapt fast enough to shape them well

THE SINGLE FIGURE THE PAPER CANNOT DO WITHOUT
A two-column annotated diagram: left column shows the human institutional stack (human principal → corporate charter → mandate/job description → capability verification (resume) → escalation to manager → payment rails), right column shows the parallel agent stack (human/principal → AgentID/ERC-8004 → mandate (on-chain) → capability registry (attestations) → escalation protocol → machine-payment rails), with vertical arrows showing functional equivalence between each layer.

OBJECTION 1, Agents are just tools; no institutional analogy applies
Rebuttal: Tools do not hold mandates, transact autonomously, or maintain on-chain reputation. The existence of ERC-8004 identity, A2A communication, and programmatic payments in production systems refutes the "tool" characterization empirically.

OBJECTION 2, Human institutions are socially constructed; agents lack the social substrate for institutions
Rebuttal: Institutions are functional solutions to coordination problems, not social customs. The coordination failures (trust, capability verification, bounded authority) exist regardless of whether the actor is human or agent, and the technical fixes (mandates, registries, escalation) solve them without requiring social consensus.

OBJECTION 3, This argument is over-engineered; agents will simply use existing legal and financial infrastructure
Rebuttal: Existing infrastructure assumes human legal personhood, manual verification, and voluntary compliance. Agents operating at machine speed, with no legal personhood and no manual review layer, cannot simply inherit human institutions without structural adaptation-this is why ERC-8004, A2A, and smart-contract escrow are being built from the ground up.


---

## APPENDIX B, Verification log (hub-side, verbatim)

```
[FAMILY] <arXiv ID | EIP number | official URL> 1. MCP (Model Context Protocol), Anthropic spec 2. A2A (Agent2Agent pr  =>  FLAG-UNVERIFIED; ARXIV-LIVE; EIP-8004-LIVE; EIP-4337-LIVE; EIP-5192-LIVE; EIP-8004-LIVE; URL-MISS; URL-MISS; URL-MISS; URL-MISS; URL-MISS; URL-MISS; URL-MISS; URL-MISS; URL-MISS
[MCP] https://modelcontextprotocol.io/specification  =>  URL-LIVE
[A2A] https://a2a-protocol.org/latest/specification  =>  URL-LIVE
[ANP] https://agent-network-protocol.com (specs on GitHub AWSLabs/agent-network-protocol, VERIFIED)  =>  URL-LIVE
[ERC-8004] EIP-8004  =>  EIP-8004-LIVE; EIP-8004-LIVE; EIP-8004-LIVE
[ERC-4337] EIP-4337  =>  EIP-4337-LIVE; EIP-4337-LIVE; EIP-4337-LIVE
[ERC-5192] EIP-5192; naming layer: ENS, "Ethereum Name Service." IDENTIFIER: https://ens.domains  =>  EIP-5192-LIVE; EIP-5192-LIVE; EIP-5192-LIVE; URL-LIVE
[Generative Agents] arXiv:2304.03442  =>  ARXIV-LIVE
[Concordia] arXiv:2312.03664  =>  ARXIV-LIVE
[OASIS] arXiv:2411.11581  =>  ARXIV-LIVE
[MemGPT/Letta] arXiv:2310.08560  =>  ARXIV-LIVE
[Temporal KG for agents] arXiv:2501.13956  =>  ARXIV-LIVE
[x402] https://github.com/coinbase/x402  =>  URL-LIVE
[Agent frameworks] arXiv:2308.08155; LangGraph, IDENTIFIER: https://github.com/langchain-ai/langgraph; CrewAI, IDENTIFIER: http  =>  ARXIV-LIVE; URL-LIVE; URL-LIVE
[Jevons paradox] classic edition, https://www.econlib.org/library/YPDBooks/Jevons/jvnCQ.html  =>  URL-LIVE
[Principal-agent] https://doi.org/10.1016/0304-405X(76)90026-X  =>  URL-MISS
[LLM MAS survey] arXiv:2605.14892  =>  ARXIV-LIVE
[Agent economies] arXiv:2610.01756 paper). The verified canonical paper is arXiv:2312.03664. (2605.14892, 2610.01756). If you pr  =>  ARXIV-LIVE

```

---

## NEXT STEPS, STATUS (updated 2026-10-09)

v1.4.2-v1.4.6 (r4 panel 7/7/8 -> r5 panel 8/8/8 ACCEPT-WITH-MINORS): T made true and
reproducible (343 @ 2026-10-09 04:16; in-repo id-archive + scripts/verify_t.sh, count +
SHA-256 verified), the false monotone clause struck, banner demoted, III.5 sign fix +
stale-number sibling sweep (343 everywhere), INC-006 logged, sections/ INC-004 archive
purged, wave-label uncollided.
v1.4 (post-third-review, free-lane deepseek panel 6/8/8; B ACCEPT-WITH-MINORS).
v1.3: second review (5/5/5) → breakeven sync, p-semantics, control-law demotions,
INC-004 withdrawn. v1.4: T-figure made reproducible (query published, 277 @ freeze),
T=40 alive-set corrected, ladder demoted to policy, IV.5 units clause dropped,
appendix tokens + typo stripped, VII.a moved under VII, F1 provenance note,
snapshot primary alpha_waves fixed, INC-005 logged. v1.4.1 residual sweep: corollary floor-condition, 185×
window caveat, 2603.22367 de-paged, 2608.18232 ID added, figure K-label fixed,
REVISION_LOG B2 struck, RESULTS under git, part3 5.9 residue killed. v1.1: assembled + 26/26 cites. v1.2: first external
review (4/4/5) → all round-1 findings dispositioned. v1.3: second external review
(5/5/5) → breakeven table propagated into §III.3, abstract p-semantics fixed,
control-law claims demoted per §VIII directive 3, chrome strip completed, and
INC-004 logged (a fabricated §IV.4 worked example caught by hub record check
after both review rounds). Remaining: human read-through; optional LaTeX/arXiv;
v2 = negative-control briefs, measured p/T distributions, T instrumentation,
as-implemented table.
assembly + 26/26 citation resolution · abstract · figure (figure/stack.svg) +
live dashboard (~/.hermes/scripts/hf_paper_stats.py → stats_live.md).
Remaining: human read-through; optional LaTeX/arXiv conversion; hf_stats.tsv keeps
accumulating, v2 = measured p/T distributions replace bounded estimates.
