# ROUND-5 HOSTILE RE-REVIEW, v1.4.5 (T-kit verification round)

You are reviewer C, round 5: hostile multi-agent-systems professor; r4 you wrote "all three of my r3 issues and every residual I named are fixed" and capped at 8/10 solely on the T MAJOR. r1-r4 scores: 4/5/8/8. This round's PRIMARY question: with T repaired, does anything still hold the paper below 8, and is the T-kit itself sound?

## READ (fully, in chunks; DRAFT ~80K)
1. ~/agentic-institutions-paper/DRAFT.md, v1.4.5 manuscript
2. ~/agentic-institutions-paper/reviews/reviewer_C_r4.md, YOUR round-4 review
3. REVISION_LOG.md (post-r4 entries: r4 panel, hub arithmetic audit, v1.4.3 T-kit, v1.4.4 sign fix, v1.4.5 sibling sweep)
4. INCIDENT_LOG.md (INC-001..INC-006), NUMBER_SNAPSHOT.json, part3_math.md, RESULTS.md
5. data/t_freeze_2026-10-09T0416.csv + scripts/verify_t.sh (the T-kit)
6. ~/.hermes/scripts/hf_stats.tsv, raw instrument
7. git log in the paper dir (hub-authored commits v1.4.3..v1.4.5)

## Tasks
T1 DISPOSITIONS: for EACH finding in YOUR r4 review: FIXED / PARTIAL / NOT-FIXED in v1.4.5, ONE verbatim quoted line as evidence each.
T2 SIBLING SWEEP: the hub fixed a III.5 sign clause ("helps"->"hurts the paid-lane case") and re-froze T=343 in v1.4.4/5. Sweep ALL files for stale siblings: grep for 'helps', '277', 'monotone in hub lifetime', '331'. Report any hit; state NONE if clean.
T3 T-KIT AUDIT (the centerpiece, try to break it): (a) wc -l data/t_freeze_2026-10-09T0416.csv minus header must equal 343; (b) run bash scripts/verify_t.sh and report its output; (c) TAMPER TEST: copy the repo to /tmp, delete or alter one CSV row, rerun verify_t.sh, it must FAIL LOUDLY (nonzero exit + clear message); report actual behavior; (d) reconcile the III.3 receipt + snapshot + archive: all must cite 343 @ 2026-10-09 04:16; (e) judge: does this kit satisfy 'true and reproducible' as you defined it in r4?
T4 REGRESSION HUNT (~22 dead tokens): 75×, T ≈ 61, 57/15, failure probability, 147 briefs, four concurrent, 30-second windows, INTRO-OK, RELATED-WORK-OK, v1.1 COMPLETE, cost-optimal control law, cost-optimal path, 296, 40–80, K = the binding budget, reinterpretng, PAPER-OUTLINE-OK, CITATIONS-RESOLVED-OK, (paging, ≈5.9 at α≈0.17, monotone in hub lifetime, *helps* delegation. Report ANY hit with context; NONE if clean. Beware dash/wrap variants.
T5 RE-DERIVE: alpha=3853/22824; breakeven cells (p=0.3: 59.2/79.3/119.5; p=0.5: 35.1; p=0.7: 24.8/33.4/50.6); T=40 alive-set; CP 0.025^(1/14)=0.768; 1/alpha endpoints 5.3/11.1. Also check the III.5 sign logic: does early session death help or hurt the paid-lane case?
T6 FABRICATION HUNT: 3 quantitative claims from IV/V traced to hf_stats.tsv / NUMBER_SNAPSHOT.json / data/*.csv / INCIDENT_LOG.md. Flag unprovenanced numbers.
T7 VERDICT: score /10 + ACCEPT / ACCEPT-WITH-MINORS / MINOR-REVISE / MAJOR-REVISE + <=3 remaining issues, severity-tagged.

## MANDATE (strict, INC-001 rules)
- You may write ONLY your one review file (path below). DRAFT.md and ALL data are READ-ONLY. state.db SELECT-only.
- Every quote verbatim; no invented numbers.
- The paper dir is under git (HEAD 4c2a622 = v1.4.5); the hub will diff for unauthorized writes.

## DELIVERABLE
Write the full review to your file. End it (and your final chat message) with this exact token on its own last line:
REVIEW5-C-OK
