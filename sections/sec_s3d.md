When a dispatched brief fails to cross the acceptance needle, the
    institution faces a structural choice: re-dispatch or escalate.
    Escalation is not a fallback — it is the institution's immune system, a
    learned response to conditions the dispatched worker was not equipped to
    resolve. We treat escalation as a first-class cost in the dominance
    inequality, and the escalation path itself as a programmable control law.
    The escalation ladder. In practice, escalation unfolds in predictable
    stages. A brief that fails validation triggers a retry with truncated
    context — a partial read that strips the worker to task-relevant signal
    only, reducing the cognitive surface area. If the partial read resolves
    the failure, the institution avoids escalation entirely. When it does
    not, the institution performs a brief rewrite: it regenerates the brief
    under stricter constraint, typically narrowing the acceptance needle or
    constraining the search space. Only when rewrite also fails does the
    institution escalate to a human reviewer. This ladder — retry → partial
    read → brief rewrite → human — is not a suggestion; it is the
    institution's cost-optimal path given verification-bandwidth constraints.
    Escalation cost ε. We make ε explicit in the dominance inequality.
    The inequality now reads:
    > w/h < p(1+T)(1−α) − ε · κ(η)
    where κ captures the severity of escalation (a rewrite costs less than a
    human handoff) and η is the position on the escalation ladder. The
    institution therefore has a budget for escalation: it can tolerate
    small ε when headroom exists, but when dominance inequality is tight —
    when the worker-to-human cost ratio is already near the bound —
    escalation becomes prohibitive. At that point, the correct response is
    re-dispatch, not escalation. The institution must learn this threshold.
    When to escalate vs. re-dispatch. Re-dispatch makes sense when
    failure is environmental — a transient condition unlikely to recur with
    identical input. Escalation makes sense when failure is structural —
    the brief itself is malformed, the acceptance needle is miscalibrated, or
    the task requires capability the worker does not possess. A
    hub-and-worker system implementing these principles would instrument each
    acceptance needle to record the delta between dispatched and received; a
    cluster of retries exceeding a latency or quality threshold automatically
    triggers escalation rather than compounding cost.
    Manager-analogue, not manager-identity. We resist the framing that
    escalation involves a "manager." The human reviewer in an escalated brief
    is not a manager in the organizational sense — they do not re-prioritize,
    re-allocate, or direct workflow. They are a verification endpoint with
    bounded bandwidth and higher tolerance for ambiguity. The institution's
    escalation path is therefore better understood as a manager-analogue: a
    control law that routes cost-constrained work to the appropriate
    verification tier. Identity matters here because naming something a
    "manager" invites assumptions about authority, state, and continuity that
    do not apply to a stateless verification handoff.
    The escalation path, correctly implemented, is the institution's immune
    response — fast, constrained, and locally resolved wherever possible.
    Where it fails, the failure is diagnostic.
    SECTION-S3D-OK
  hermes --resume 20261007_131553_31ddf1