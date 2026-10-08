The Capability Registry
    Any institution that delegates cognition must answer a deceptively simple
    question: who can do what, at what price, and how well? The capability
    registry is the institutional memory that makes this tractable. Without
    it, a hub that dispatches briefs to a pool of workers operates blind —
    burning cycles on mismatched assignments, failing to exploit comparative
    advantage, and collapsing into the same ad hoc improvisation that
    characterizes non-institutional coordination.
    We define a capability registry as a dynamic, queryable record of worker
    abilities, expressed as a vector of task-type × quality × cost. It
    functions as the institutional analogue of a professional résumé: not a
    static credential, but a live attestation of what a worker has
    demonstrated it can execute, under what conditions, and for what
    compensation. The key word is dynamic. Static configurations — explicit
    allow-lists, hardcoded role assignments, fixed tier assignments made at
    provisioning time — assume that capability is a property of identity
    rather than of demonstrated performance. It is not. A worker's effective
    capability set evolves with its current model weights, context length,
    tool access, and load state. A registry frozen at deployment time becomes
    noise within weeks.
    Probe-based capability discovery addresses this through active
    interrogation rather than assumption. Rather than pre-declaring that
    worker w₁ handles reasoning tasks and worker w₂ handles generation,
    the hub issues probe briefs — small, bounded evaluation tasks with known
    correct answers — and observes acceptance rates, latency profiles, and
    output quality before routing production work. This is precisely the
    mechanism at work in our minimax/deepseek division of labor. When a brief
    arrives at the hub, it carries an acceptance needle: a threshold
    condition (e.g., minimum quality score *q* ≥ 0.87, maximum latency *t* ≤
    45s, cost ≤ *c* units). The hub's registry is queried against this
    needle, and only workers whose current probe-verified profile satisfies
    all three dimensions are eligible. Workers who fail probes are not
    penalized — they are simply not routed until a subsequent probe
    re-establishes their profile.
    This approach has a direct lineage in the agent cards specification
    [CITE: agent cards specification], which standardizes self-reported
    capability disclosures, and in ERC-8004's conception of task-aware
    routing [CITE: ERC-8004 task routing semantics]. Both frameworks treat
    capability not as a static attribute but as a claim subject to
    verification — a position we adopt and operationalize. The registry is
    not a directory; it is a probabilistic record updated by continuous probe
    feedback. Each acceptance needle is a partial observability event that
    sharpens the institution's model of its own workforce.
    The binding constraint on registry fidelity is verification bandwidth.
    The institution cannot probe every worker on every task type at every
    moment — probe overhead is real cost. The optimal probe frequency is
    therefore a function of task-value density, worker stability, and the
    penalty for misrouting. We treat this as an instance of the
    verification-bandwidth binding identified in the institutional cost
    model, where the marginal value of a probe must exceed its marginal cost.
    In practice, this resolves to probing on a schedule stratified by worker
    volatility: stable workers (low variance in recent outputs) are probed
    infrequently; workers operating near their capability boundaries are
    probed proportionally more often.
    The capability registry, so defined, is what transforms a collection of
    workers into an institution. It is the mechanism by which the institution
    exercises jurisdiction — the right to direct cognition along paths it
    can justify. Without it, delegation is guesswork. With it, delegation
    becomes governance.
    SECTION-S3B-OK
  hermes --resume 20261007_131553_675caa