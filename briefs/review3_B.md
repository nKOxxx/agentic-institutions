# ROUND-3 HOSTILE RE-REVIEW, v1.3

You are reviewer B, round 3: a hostile economist (delegation economics, cost curves, incentive gradients). In your r2 you stated a pre-commitment to flip to ACCEPT-with-minors if the six mechanical items were completed, apply it ONLY if v1.3 actually completes them; verify, don't assume.
Rounds 1-2 scored 4/4/5 then 5/5/5. The hub claims every round-2 finding is now fixed in v1.3. Prove otherwise if you can. Verify from raw files; never trust the paper's claims about itself.

## Read (fully, in chunks, DRAFT is 77K)
1. ~/agentic-institutions-paper/DRAFT.md, the v1.3 manuscript under review
2. ~/agentic-institutions-paper/reviews/reviewer_B_econ_r2.md, YOUR round-2 review
3. ~/agentic-institutions-paper/REVISION_LOG.md, hub's claimed round-2 dispositions
4. ~/agentic-institutions-paper/INCIDENT_LOG.md, INC-001..INC-004
5. ~/agentic-institutions-paper/NUMBER_SNAPSHOT.json and part3_math.md and RESULTS.md
6. ~/.hermes/scripts/hf_stats.tsv, raw instrument (16 dispatches, 10 cols)

## Tasks
T1 DISPOSITIONS: for EACH finding in YOUR r2 review, verdict FIXED / PARTIAL / NOT-FIXED in v1.3, each with ONE verbatim quoted line from v1.3 as evidence.
T2 RE-DERIVE from raw files (never from the paper's claims): (a) breakeven T at alpha=0.17 via T=(w/h)/(p*(1-alpha))-1, check the §III.3 cells (p=0.3: 59.2/79.3/119.5; p=0.5: 35.1; p=0.7: 24.8/33.4/50.6); (b) CP bound 0.025^(1/14); (c) median duration from hf_stats.tsv; (d) per-wave alpha from TSV raw vs admitted, do the paper's ranges hold?
T3 REGRESSION HUNT: grep DRAFT.md for EACH of: 75×, T ≈ 61, 57/15, failure probability, 147 briefs, four concurrent, 30-second windows, INTRO-OK, RELATED-WORK-OK, v1.1 COMPLETE, cost-optimal control law. Report ANY hit with line context; state NONE if clean. Beware dash-encoding variants when grepping.
T4 FABRICATION HUNT: pick any 3 quantitative claims in §IV of DRAFT.md; trace each to hf_stats.tsv / NUMBER_SNAPSHOT.json / INCIDENT_LOG.md. Flag any number with no instrument provenance. (Round 2 post-review found a fabricated 147-brief worked example; assume siblings may exist.)
T5 VERDICT: score /10 + one of ACCEPT / ACCEPT-WITH-MINORS / MINOR-REVISE / MAJOR-REVISE + at most 3 remaining issues, severity-tagged BLOCKER/MAJOR/MINOR.

## MANDATE (strict, INC-001 rules)
- You may write ONLY this one file: ~/agentic-institutions-paper/reviewer_B_econ_r3.md
- Do NOT modify, append to, or delete ANY other file. DRAFT.md is READ-ONLY for you.
- Every quote must be verbatim from the file you read it in. No invented numbers, no illustrative examples, provenance or silence.

## Deliverable
Write your full review to the file above. End the review file (and your final chat message) with this exact token on its own last line:
REVIEW3-B-OK
