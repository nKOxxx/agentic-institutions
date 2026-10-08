# REVISION LOG — v1.2 (2026-10-08, post-external-review)

Reviewers: A methods 4/10, B econ 4/10, C MAS 5/10 (unanimous MAJOR REVISION).
Reviews: reviews/reviewer_{A,B,C}_*.md. This file: finding -> disposition.

| # | Severity | Finding | Disposition |
|---|---|---|---|
| B1 | BLOCKER | retracted 75x still in abstract | abstract rewritten (also INC-003) |
| B2 | BLOCKER | 3 irreconciled dominance formulas | unified on (star); IV.5 term unit-normalized |
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

# ROUND 2 — v1.3 (2026-10-08, post-second-external-review)

Reviews: reviews/reviewer_{A,B,C}_*_r2.md. Scores 5/5/5 (A MINOR REVISE, B MAJOR
REVISE, C 5/10). Round-1 dispositions as verified by reviewers themselves:
FIXED: B1, B2-core, B5, M1, M2, M3, M5, M7 | PARTIAL: B3, B4, M4, M6, M8.

## Round-2 findings -> v1.3 disposition

| # | Source | Finding | Disposition in v1.3 |
|---|---|---|---|
| N1 | B (MAJOR) | corrected breakeven table never reached §III.3; stale "T ≈ 61" + garbled "T ≥ 57/15/…" while §IX.b claims all resolved | table propagated into §III.3 (ceilings, measured-T note); stale rows ABSENT (gate) |
| N2 | B (MAJOR) | abstract defined p as failure probability; body uses acceptance — inverts paid-worker regime | abstract now "p is per-dispatch acceptance probability"; "failure probability" ABSENT (gate) |
| ③ | A+B+C | §IX.b / preamble overclaim "All BLOCKER findings are resolved" | rewritten to disposition-truth (round-2 recurrence stated) |
| ① | B items 1-2 (non-negotiable) | = N1 + N2 | both done |
| ② | A items | PARTIAL round-1 items: M4 chrome (A2A misattribution, dangling cites, "plain text draft", needle tokens) | stripped: A2A→Google, dangling cites removed, INTRO-OK/RELATED-WORK-OK/"plain text draft" ABSENT (gate) |
| ④ | A | M6/B4 residual: n ambiguity 7/7 vs 14/14 vs 16 | wave-labeled (7/7 wave-1; 14/14 frozen; 16 live incl. probes); snapshot supplement |
| ⑤ | A | M8 residual: "seven necessary subsystems" | six; II.3→II.7 renumbered |
| ⑥ | C §4 | new findings incl. IV.4 window/retry machinery fiction | replaced with as-implemented truth; n reconciliation done |
| ⑦ | A item 3 | version self-description (NEXT STEPS said v1.1 COMPLETE) | rewritten for v1.3 |
| ⑧ | A items 4b/6 | IV.5 κ-term sold as derived; 1/α endpoints; 15× unconditional; 17% wave label | κ-form = heuristic overlay (exact term stated); endpoints convention added; 15× conditional on T; 17% wave-labeled |
| ⑨ | A items 3/9 | false sentences (routing/insurance) + VIII human-pass caveat | both re-phrased; caveat appended to VIII verdict |

Hub-discovered (no reviewer flagged): **INC-004** — §IV.4 worked example
(147 briefs / 142 hit / 4 concurrent / 24h / 30s windows) is worker-fabricated
fiction; instrument record = 16 serial dispatches, 16/16, zero retries. Replaced
with the real record + withdrawal note; ABSENT-checks in gate.

## Gate
v13_gate.py: 17 absence + 21 presence checks, rerun-safe, GATE PASS (2026-10-08).
Lesson encoded: absence-checks on stale content, not just presence on new.

---

# ROUND 3 — v1.4 (2026-10-08, free-lane deepseek re-review: hf_dispatch ×3, $0)

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

Gate: v14_gate.py — 23 absence + 12 presence/structure, PASS 2026-10-08.
Panel method note: 3rd round fully free-lane (hf_dispatch deepseek ×3, ~25 min, $0);
worker mandate discipline held (INC-001 rules: single-file writes, DRAFT read-only).
