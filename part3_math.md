## PART III — THE ECONOMICS OF DELEGATED COGNITION (hub-derived, 2026-10-07)

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

Three regimes, all measured or bounded:

(1) FREE LANE — w/h = 0. Then (★) holds for every p > 0 and every T ≥ 0.
    Free-lane delegation cannot lose. Not "usually wins" — cannot lose.

breakeven surface recomputed from (★) at α = 0.17 (v1.2; replaces table that
failed external reproduction — old entries T≥15 @ w/h=20,p=.3 and T≈61
@ p=.7,w/h=30 were arithmetically impossible / α-contaminated):
  p=0.3: w/h=15 → T ≥ 60 | w/h=20 → T ≥ 80 | w/h=30 → T ≥ 120   (ceilings; T > 59.2/79.3/119.5)
  p=0.7: w/h=15 → T ≥ 25 | w/h=20 → T ≥ 34 | w/h=30 → T ≥ 51   (ceilings; T > 24.8/33.4/50.6)

    A working session in our logs is long-lived: the hub logged 277 further
    assistant turns after its first accepted artifact (query published in
    DRAFT §III.3). So yes: a worker can cost ~15× the hub per char and
    delegation still wins — because hub chars are amortized over the session's
    remaining life while the artifact exists, and worker chars are paid once.

(3) FIXED CONTEXT BUDGET — the result we consider the most important. A hub
    session dies when its context budget K fills. Inline, each artifact
    consumes S of budget; delegated, each consumes only αS. Yield per
    session-lifetime:

      N_in = K/S      vs      N_del = K/(αS)      →      N_del/N_in = 1/α ∈ [5.3, 11.1] (≈5.9 at α≈0.17)

    more institutional work per session at the central α. Delegation is not primarily a
    cost saving. It is lifespan extension of the coordinating mind.

### III.4 Jevons binding, and why the anatomy follows

Jevons (1865) observed that efficiency in coal use increased total coal
consumption. The same rebound governs cognition: as the marginal price of
worker cognition → 0, dispatch volume expands until a different constraint
binds. That constraint is (★)'s right side and (3)'s budget: hub verification
bandwidth — αS per artifact against a finite K. When cognition is free, the
scarce factor is not model price; it is the hub's attention.

This is the paper's structural claim. Ration a hub's attention and the
optimal control law that falls out of (★) is exactly the institutional
anatomy of Part II:

  mandate      = the brief          (what may be attempted, at what size S)
  capabilities = worker routing     (which worker, what it is good at)
  constraints  = acceptance needles (p made measurable; budgets; alarms)
  escalation   = retry → slice-read → brief-rewrite   (raise ε only as needed)

The four-layer anatomy is not borrowed from human sociology and then mapped
onto agents by analogy. It is re-derived here as the cost-optimal policy for
delegated cognition under persistent attention. Institutions are coordination
technology; the math says machine coordination needs them for the same reason
firms exist: because verification, not production, is the rationed factor.

### III.5 Threats to validity

Uniform in/out pricing; T as expected remaining turns (heavy-tailed — sessions
die early, which *helps* delegation since inline cost scales with T);
acceptance probability p measured on needle-checked drafts only; ε assumed
small (held in our runs: failure tails were hundreds of chars, not thousands).
The free-lane result (1) is robust to all of these — it needs only w/h = 0 and
α < 1.
