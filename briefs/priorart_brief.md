# TASK: Prior-art audit for a position paper ;  find the CLOSEST existing work per claim

We hold 6 claims. For EACH claim: find the 1–3 closest published works (prefer
arXiv, any year, esp. 2023–2026), give arXiv IDs, one line on what they do, and
one line on the DELTA vs our claim. Rate overlap H/M/L. If truly nothing is
close, say "NO CLOSE PRIOR FOUND" and name the nearest neighbor anyway.

## Our claims (audit these)
C1. Delegation dominance with persistent hub attention: a hub model's context
    is re-paid as input every remaining session turn, so delegating artifact
    drafting to even MUCH more expensive worker models wins once the session
    has enough remaining turns (dominance inequality (w/h) < p(1+T)(1−α)).
C2. Free-tier worker offload as the primary economics (not a fallback
    "cascade"): with zero-cost workers, delegation dominates for ANY
    acceptance probability ;  the free lane cannot lose.
C3. Context budget as session lifespan: a hub session dies when its context
    fills; delegating yields 1/α more institutional work per session-lifetime
    (lifespan extension, not just cost saving).
C4. Verification-bandwidth scarcity + Jevons rebound: as cognition gets cheap,
    dispatch volume explodes until hub VERIFICATION bandwidth becomes the
    binding scarce factor.
C5. Institutions for agents: mandates/capability-registries/constraints/
    escalation as the cost-optimal control law for delegated cognition (not a
    sociological analogy); machine money + agent orgs (A2A, ERC-8004).
C6. Reflexive methodology: a paper whose evidence is generated live by the
    same hub-and-worker institution it studies (self-measuring).

## Known anchors (do NOT re-derive; find what is BEYOND these)
FrugalGPT arXiv:2305.05176 (LLM cascades, per-query cost) · RouteLLM
arXiv:2406.18665 · "Why Do Multi-Agent LLM Systems Fail?" arXiv:2503.13657 ·
MetaGPT arXiv:2308.00352 · SoK: Decentralized Agent Economic Infrastructure
arXiv:2610.01756.

## Search hints (not exhaustive)
"LLM cascade" cost · "model routing" economics · "orchestrator worker" LLM ·
"context window" cost/budget · "attention" scarce resource LLM · "Jevons"
AI/compute · "agent organizations" / "agent society" governance · "principal
agent" LLM · "verification" human-in-the-loop cost · "machine money" / "agent
payments" · "LLM inference cost" analysis.

## Hard rules
- Only works you actually found via search this session; if unsure of an ID,
  write IDENTIFIER: UNVERIFIED + what you know.
- Format per claim:
  C<n>: <overlap H/M/L>
   - <Author/Org, short title, arXiv:ID> ;  <what it does>. DELTA: <one line>.
- End with exactly: PRIOR-ART-OK
