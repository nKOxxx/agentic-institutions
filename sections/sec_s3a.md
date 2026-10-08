A mandate is not a prompt. It is a formal delegation contract: a
    scope, a deliverable, a set of acceptance criteria, and a budget — all
    made legible before any cognitive work begins. Without this object, the
    principal has no legible stake; the agent has no bounded problem. The
    result is not delegation — it is hope.
    The Formal Object
    We define a mandate M as the tuple:
    > M = (σ, δ, α, β, ρ)
    where σ is the scope (what is in bounds), δ the deliverable
    (what counts as done), α the acceptance criteria (verifiable
    needles), β the budget (tokens, time, cost ceiling), and ρ the
    rollback constraint (what happens on failure). A mandate is
    well-formed when δ ⊆ σ and α is decidable by the principal within its
    verification bandwidth.
    This is not a procedural convention. It is a **cost-optimal control law
    for delegated cognition**. The principal pays the upfront cost of
    specification so that the agent never iterates unboundedly on an
    ill-defined objective — which, as hf_dispatch data confirms, is where the
    majority of token waste and latency collapse occurs in production LLM
    dispatch systems.
    Why Delegation Without Mandates Fails
    Principal-agent theory [CITE: Jensen-Meckling 1976, agency costs and
    theory of the firm] identifies the core failure mode: the agent optimizes
    for a proxy of the principal's objective, not the objective itself,
    because the objective was never specified with sufficient precision. In
    software terms, this manifests as agent drift — the agent
    reinterpretng its task in directions that are locally coherent but
    globally misaligned.
    A second failure mode compounds the first: unbounded retries. Without
    a termination condition, an agent that fails to satisfy an imprecise
    deliverable will retry until something "looks right," burning budget on a
    loop that has no convergence guarantee. hf_dispatch resolves this by
    encoding acceptance needles as hard gates: the brief is not complete
    until verification(δ) = true, and verification is itself a metered,
    budgeted call.
    The A2A task object specification [CITE: A2A protocol task object
    semantics] encodes this structure natively: a task carries status,
    output, and a signals block that allows the principal to inject
    acceptance signals without owning the execution loop. A mandate is the
    pre-flight instantiation of that object — the schema before the instance.
    The hf_dispatch Running Example
    Consider a brief dispatched via hf_dispatch: the hub receives a
    natural-language task ("write the introduction for paper section IIIA"),
    decomposes it, and issues a mandate to a worker agent. The mandate reads:
    - Scope: Section IIIA body text, ~500 words, position-paper voice.
    - Deliverable: Draft text with one [CITE: ...] placeholder per
    referenced source.
    - Acceptance criteria: Word count ∈ [450, 550]; ends with
    SECTION-S3A-OK; no fabricated citations.
    - Budget: 200k input tokens, 8k output tokens, 120s wall clock.
    - Rollback: On budget exhaustion, return partial output with
    [INCOMPLETE] marker.
    Without this contract, the worker faces a locally unbounded problem. With
    it, the hub's verification loop can assert true/false on completion in
    O(1) time — a critical property when the hub is orchestrating dozens of
    concurrent workers and its own verification bandwidth is the binding
    constraint. The mandate is not overhead. It is the mechanism by which the
    principal converts an intractable delegation problem into a bounded,
    observable one.
    SECTION-S3A-OK
  hermes --resume 20261007_131553_b50f80