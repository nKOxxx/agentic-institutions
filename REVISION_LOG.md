# REVISION LOG, v1.2 (2026-10-08, post-external-review)

Reviewers: A methods 4/10, B econ 4/10, C MAS 5/10 (unanimous MAJOR REVISION).
Reviews: reviews/reviewer_{A,B,C}_*.md. This file: finding -> disposition.

| # | Severity | Finding | Disposition |
|---|---|---|---|
| B1 | BLOCKER | retracted 75x still in abstract | abstract rewritten (also INC-003) |
| B2 | BLOCKER | 3 irreconciled dominance formulas | unified on (star); IV.5 ε-term stated as heuristic overlay w/ exact term (superseded-by r2 row ⑧) |
| B3 | BLOCKER | breakeven table fails reproduction | recomputed from (star) in part3_math.md (p=.3,w/h=20 -> T>=79; p=.7,w/h=30 -> T>=51) |
| B4 | BLOCKER | alpha not recomputable from instrument | instrument patched: admitted chars auto-logged from next dispatch; paper downgraded to 'bounded first-pass estimates' |
| B5 | BLOCKER | VIII omitted own MOST-DANGEROUS prior art (2610.06069) | added as II.3 lead + VIII verdict-table row |
| M1 | MAJOR | p-hat self-certified, no CI | CP CI added (abstract + III.6); probe row disclosed |
| M2 | MAJOR | 1/alpha sold as ~6x constant | range [5.3,11.1]; alpha = hub policy parameter |
| M3 | MAJOR | abstract misattributed INC-001 catch to escalation ladder | corrected; IV.6 added (escalation caught: nothing yet) |
| M4 | MAJOR | IV contained transcript chrome, needle tokens, residue | 6 resumes + 6 needle tokens stripped, elision notes kept |
| M5 | MAJOR | Related Work missing 6 econ neighbors | II.3 added, 2610.06069 lead |
| M6 | MAJOR | number drift across documents (43s vs 37 vs 31.5; 7/7->14/14) | NUMBER_SNAPSHOT.json frozen; III.6 states 31.5s @ 2026-10-08 |
| M7 | MAJOR | INC-002 absent from body | referenced in IV.6 + IX |
| M8 | MAJOR | §VIII positioning directives declared, never implemented | implemented: II.3 bucket, synthesis foregrounded, C6 method claims, Jev dual-cite intact |

Known open (declared, not hidden): admitted-chars logging begins with the next
dispatch (14 historical rows remain output-only); escalation ladder untested
under load; n=1 institution; no external replication. These are v2 scope.

---

# ROUND 2, v1.3 (2026-10-08, post-second-external-review)

Reviews: reviews/reviewer_{A,B,C}_*_r2.md. Scores 5/5/5 (A MINOR REVISE, B MAJOR
REVISE, C 5/10). Round-1 dispositions as verified by reviewers themselves:
FIXED: B1, B2-core, B5, M1, M2, M3, M5, M7 | PARTIAL: B3, B4, M4, M6, M8.

## Round-2 findings -> v1.3 disposition

| # | Source | Finding | Disposition in v1.3 |
|---|---|---|---|
| N1 | B (MAJOR) | corrected breakeven table never reached §III.3; stale "T ≈ 61" + garbled "T ≥ 57/15/…" while §IX.b claims all resolved | table propagated into §III.3 (ceilings, measured-T note); stale rows ABSENT (gate) |
| N2 | B (MAJOR) | abstract defined p as failure probability; body uses acceptance, inverts paid-worker regime | abstract now "p is per-dispatch acceptance probability"; "failure probability" ABSENT (gate) |
| ③ | A+B+C | §IX.b / preamble overclaim "All BLOCKER findings are resolved" | rewritten to disposition-truth (round-2 recurrence stated) |
| ① | B items 1-2 (non-negotiable) | = N1 + N2 | both done |
| ② | A items | PARTIAL round-1 items: M4 chrome (A2A misattribution, dangling cites, "plain text draft", needle tokens) | stripped: A2A→Google, dangling cites removed, INTRO-OK/RELATED-WORK-OK/"plain text draft" ABSENT (gate) |
| ④ | A | M6/B4 residual: n ambiguity 7/7 vs 14/14 vs 16 | wave-labeled (7/7 wave-1; 14/14 frozen; 16 live incl. probes); snapshot supplement |
| ⑤ | A | M8 residual: "seven necessary subsystems" | six; II.3→II.7 renumbered |
| ⑥ | C §4 | new findings incl. IV.4 window/retry machinery fiction | replaced with as-implemented truth; n reconciliation done |
| ⑦ | A item 3 | version self-description (NEXT STEPS said v1.1 COMPLETE) | rewritten for v1.3 |
| ⑧ | A items 4b/6 | IV.5 κ-term sold as derived; 1/α endpoints; 15× unconditional; 17% wave label | κ-form = heuristic overlay (exact term stated); endpoints convention added; 15× conditional on T; 17% wave-labeled |
| ⑨ | A items 3/9 | false sentences (routing/insurance) + VIII human-pass caveat | both re-phrased; caveat appended to VIII verdict |

Hub-discovered (no reviewer flagged): **INC-004**, §IV.4 worked example
(147 briefs / 142 hit / 4 concurrent / 24h / 30s windows) is worker-fabricated
fiction; instrument record = 16 serial dispatches, 16/16, zero retries. Replaced
with the real record + withdrawal note; ABSENT-checks in gate.

## Gate
v13_gate.py: 17 absence + 21 presence checks, rerun-safe, GATE PASS (2026-10-08).
Lesson encoded: absence-checks on stale content, not just presence on new.

---

# ROUND 3, v1.4 (2026-10-08, free-lane deepseek re-review: hf_dispatch ×3, $0)

Reviews: reviews/reviewer_{A,B,C}_*_r3.md. Scores A 6/10 MINOR REVISE, B 8/10
ACCEPT-WITH-MINORS (pre-commitment verified then honored), C 8/10 MINOR-REVISE.
All found 3 issues each; every finding dispositioned below.

| # | Source | Finding | v1.4 disposition |
|---|---|---|---|
| 1 | A MAJOR | 296-turn figure unreproducible, no query | replaced: 277 + SQL published in §III.3 (INC-005); frozen in snapshot |
| 2 | A MINOR | T=40 parenthetical wrong twice | alive-set corrected: {0.5@15, 0.7@15, 0.7@20} alive; 0.7@30 + all p=0.3 dead |
| 3 | A MINOR | α not per-dispatch TSV-recomputable (say plainly); 186× vs 185×; part3 "40–80" echo; F2 not wave-labeled | provenance stated in F1 note + RESULTS; stats_live now int-truncates + carries frozen-value note; part3 echo killed; F2 wave-labeled |
| 4 | B MINOR | snapshot primary alpha_waves stale (orphan ~0.16) | primary field rewritten to 4-wave taxonomy; orphan deleted |
| 5 | B MINOR | reinterpretng + PAPER-OUTLINE-OK + CITATIONS-RESOLVED-OK | all absent (gate) |
| 6 | B MINOR | IV.5 stale "normalized by h" clause + stray "> " | clause dropped; stray quote removed |
| 7 | C MAJOR | IV.5 "cost-optimal path" overclaim | demoted: "escalation policy (cost-rationalized, not yet derived as optimal)" + untested-under-load |
| 8 | C MAJOR | F1 α table provenance gap | 9-line PROVENANCE note (wave-3 exact, waves 1/2/4 divergences quantified, admitted hub-audited, state.db source) |
| 9 | C MINOR | median staleness; §VII stub; uncited mandate marketplaces | frozen n=14 qualifier; VII.a moved under VII header; §II survey anchor added |

Gate: v14_gate.py, 23 absence + 12 presence/structure, PASS 2026-10-08.
Panel method note: 3rd round fully free-lane (hf_dispatch deepseek ×3, ~25 min, $0);
worker mandate discipline held (INC-001 rules: single-file writes, DRAFT read-only).

---

# ROUND 4, v1.4.1 residual sweep (2026-10-08, hub-applied; no new panel)

Scope: minor-class residuals named inside the r3 reviews' tables, outside their ≤3 caps.
| Src | Residual | Fix |
|---|---|---|
| A R2-6 | RESULTS not revision-controlled | paper dir git-init'd (4f7b8e8 = v1.4 baseline); RESULTS header states provenance |
| A R2-6 | F2 bare 7/7 without wave label | already in v1.4 ("wave-1 calibration; cumulative 14/14") |
| B tbl | 2603.22367 called "paging" | "static-context executor architectures (O(1) window, no paging)", title live-verified |
| B tbl | Contracting ID missing | arXiv:2608.18232 added (title live-verified) |
| B tbl | "cannot lose" ×2, no floor | low-ε floor cited at both III.2 corollary + III.3(1) |
| B tbl | figure draws K as the bottleneck | K relabeled "hub context; III.4"; band reads "verification bandwidth = the real scarcity" |
| B NEW-MAJOR#2 | r1 B2 row "unit-normalized" not struck | struck, superseded-by pointer to r2 row ⑧ |
| C N6 | 185× denominator-window caveat missing | abstract now points to §III.6 window caveat |
| C T4 | part3 "≈5.9" echo | replaced with wave-range pointer |
Gate: v14_gate.py extended (+13 residual checks), PASS.


# ROUND 4 PANEL, v1.4.2 (2026-10-08, free-lane deepseek x3, $0)

Panel: A methods 6->**7** MINOR-REVISE | B econ 8->**7** MINOR-REVISE (pre-commitment
flip: a verified new MAJOR drops the ACCEPT floor, exactly as pledged) | C MAS 5->**8**
flat (MAJOR caps at 8, not 9).

Convergent verdict: every r3 minor/mechanical finding confirmed dead with verbatim
evidence; both A and B re-derived the quantitative core (breakeven surface, CP bound,
frozen median, T=40 alive-set) to the third decimal from raw files; regression hunts
CLEAN (A: "no previously-correct cell, sentence, or figure was damaged"); zero
INC-004-siblings.

| Src | Sev | Finding | Fix (v1.4.2) |
|---|---|---|---|
| A+B+C | MAJOR | T=277 fails reproduction from the paper's own published query (A: 266; B: 266 x3 stable); "(monotone in hub lifetime)" is false, the store compacts and the count walks (hub same-evening re-runs: 320->331); the 13:18 anchor was carried from a reviewer footnote, never primary-verified -> INC-006 | III.3 receipt: measured re-freeze (331 @ 2026-10-08 22:01) + compacting-store warning; monotone struck; banner demoted to "asserted-with-receipt (T)"; snapshot monotone=false; conclusion robust (331 >> 119.5 max threshold) |
| A | MINOR | "16 serial dispatches, 16/16" stale vs live instrument | stamped "at the v1.3 freeze" |
| A | MINOR | "all seven briefs" counts a connectivity probe | "6 briefs + 1 connectivity probe" |
| B | MINOR | part3 side-file still says "optimal control law / cost-optimal policy" | "cost-rationalized control law / policy" |
| B | MINOR | IV.2 running example could be mistaken for instrument data | "(illustrative, not instrument data)" |

Accepted-as-scope (carried, not defects): p endogeneity, free-tier shadow price,
no formal numbered reference list (flagged for the human read-through).
Gate: v14_gate.py v1.4.2, 36 absence + 25 presence/structure, PASS (DRAFT 79,836).
Ops note: C needed 1200s (attempt 1 timed out at 900s mid-verification, no verdict
written; attempt 2 completed with needle, review archived from the worker's file).

## POST-R4 HUB AUDIT (2026-10-09)

Hub arithmetic pass, independent of the panel: every cell re-derived exact (alpha 0.1688; 6/6 breakeven cells; T=40 alive-set boundary 33.4<40<50.6; CP 0.768; 1/alpha endpoints 5.26/11.11 + disclosed 11.5; eps-corner 8x margin; T=343 clears worst threshold 2.9x). One new defect found and fixed: III.5 claimed early session death *helps* delegation - backwards, since d(dominance)/dT = p(1-alpha) > 0, so early death shrinks the paid-lane advantage. Free-lane and budget results unaffected (need only w/h = 0, alpha < 1).

## ROUND 5 PANEL + v1.4.6 CLEAN SWEEP (2026-10-09)

R5 scores: A 7->**8**, B 7->**8** (pre-commitment honored in reverse: "My round-4 ACCEPT condition is satisfied"; re-verified all 343 ids against the DB predicate at content level), C **8** flat (r4 cap lifted). All three ACCEPT-WITH-MINORS; all named the same 3 minors: count-only verifier, stale snapshot stamping, bookkeeping (part3 banner sibling, wave-label, stale changelog, B typo). C additionally found INC-004 residue in sections/sec_s3c.md (borders MAJOR). v1.4.6 closes all of it: verifier SHA-256 content pin (tamper test: same-count rewrite now FAILS loudly), snapshot frozen-date + 277 superseded-mark, part3 banner demoted (four-round flag), INC-004 quarantine banner (hub re-swept sections/ independently: only s3c affected), wave-label uncollided, changelog current, typo dead.
