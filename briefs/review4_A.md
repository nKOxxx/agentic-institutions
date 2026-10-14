# ROUND-4 HOSTILE RE-REVIEW, v1.4.1 (impact-assessment round)

You are reviewer A, round 4: a hostile senior empirical-methods/statistics professor (NeurIPS/ICML caliber); your specialty across rounds: variance, CI honesty, gate design, instrument validity, and you flagged the T-measurement three rounds running. Rounds 1-3 scored 4/4/5 then 5/5/5 then 6 (MINOR REVISE). The hub claims
v1.4.1 closes every round-3 finding (including residuals named inside review tables).
This round's PRIMARY question: what is the impact of the fixes, how many of your r3
findings genuinely died, at what severity, and did anything regress? Verify from raw
files; never trust the paper's claims about itself.

## Read (fully, in chunks, DRAFT is ~79K)
1. ~/agentic-institutions-paper/DRAFT.md, the v1.4.1 manuscript under review
2. ~/agentic-institutions-paper/reviews/reviewer_A_methods_r3.md, YOUR round-3 review
3. ~/agentic-institutions-paper/REVISION_LOG.md, hub's claimed round-3 + round-4 dispositions
4. ~/agentic-institutions-paper/INCIDENT_LOG.md, INC-001..INC-005 (note INC-005: the "296 turns" figure was replaced with a published SQL query + frozen 277)
5. ~/agentic-institutions-paper/NUMBER_SNAPSHOT.json, part3_math.md, RESULTS.md
6. ~/.hermes/scripts/hf_stats.tsv, raw instrument (now 19 rows: 16 original + 3 review dispatches; frozen manuscript stats cite n=14)
7. The paper dir is under git as of v1.4 (REVISION_LOG names the commits).

## Tasks
T1 DISPOSITIONS: for EACH finding in YOUR r3 review (including residuals you named inside tables), verdict FIXED / PARTIAL / NOT-FIXED in v1.4.1, each with ONE verbatim quoted line from v1.4.1 as evidence.
T2 IMPACT SCORE: count findings killed by severity (BLOCKER/MAJOR/MINOR), list any REGRESSIONS (previously-clean text that v1.4/1.4.1 broke), and state whether the score moves and why.
T3 RE-DERIVE from raw files (never from the paper's claims): (a) breakeven T at alpha=0.17 via T=(w/h)/(p*(1-alpha))-1, check §III.3 cells (p=0.3: 59.2/79.3/119.5; p=0.5: 35.1; p=0.7: 24.8/33.4/50.6) and the T=40 alive-set claim; (b) the T-measurement: run the query printed in §III.3 verbatim against ~/.hermes/state.db and state what you get vs the paper's 277; (c) CP bound 0.025^(1/14); (d) median duration from hf_stats.tsv, state n you used.
T4 REGRESSION HUNT: grep DRAFT.md for EACH of: 75×, T ≈ 61, 57/15, failure probability, 147 briefs, four concurrent, 30-second windows, INTRO-OK, RELATED-WORK-OK, v1.1 COMPLETE, cost-optimal control law, cost-optimal path, 296, 40–80, K = the binding budget, reinterpretng, PAPER-OUTLINE-OK, CITATIONS-RESOLVED-OK, (paging, ≈5.9 at α≈0.17. Report ANY hit with line context; state NONE if clean. Beware dash-encoding variants (– vs -) and wrapped lines when grepping.
T5 FABRICATION HUNT: pick any 3 quantitative claims in §IV/§V of DRAFT.md; trace each to hf_stats.tsv / NUMBER_SNAPSHOT.json / INCIDENT_LOG.md / state.db. Flag any number with no instrument provenance. (INC-004 and INC-005 were both hub-measurement failures; assume siblings may exist.)
T6 VERDICT: score /10 + one of ACCEPT / ACCEPT-WITH-MINORS / MINOR-REVISE / MAJOR-REVISE + at most 3 remaining issues, severity-tagged BLOCKER/MAJOR/MINOR. 

## MANDATE (strict, INC-001 rules)
- You may write ONLY this one file: ~/agentic-institutions-paper/reviewer_A_methods_r4.md
- Do NOT modify, append to, or delete ANY other file. DRAFT.md is READ-ONLY for you. state.db is READ-ONLY (SELECT only).
- Every quote must be verbatim from the file you read it in. No invented numbers, no illustrative examples, provenance or silence.

## Deliverable
Write your full review to the file above. End the review file (and your final chat message) with this exact token on its own last line:
REVIEW4-A-OK
