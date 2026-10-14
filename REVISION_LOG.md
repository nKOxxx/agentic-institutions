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

## v1.6 (2026-10-13): external panel round 1 on v1.5 (four personas, different model family, author's review tooling)

Verdict REVISE, 12 required changes R1–R12 (chair synthesis in logs/review-run-031.md of the review engine). All twelve applied in v1.6: acceptance restated as exit-zero completion with hub-attested needle status and mandate-compliant <= 11/13; T de-duplicated (343 raw, 122 compaction rows, 221 turns) with hash, commit and zones in §3.3; Assumption E (persistence) and P2 (caching) stated and carried into abstract/§8; Proposition 1 with (★ε), Corollary 1 with p*, Lemma 1; §3.4 relabelled Observation with 1/α an upper bound; maturity labels made true per element; provenance audit added as the acceptance apparatus of record; mandate tuple typed; review process described as it was; §6 relabelled conjecture; Table 1 Wall column recomputed, resolver row added, median corrected; four references added.

## v1.7 (2026-10-13): external panel round 2 on v1.6

Verdict REVISE, 10 required changes S1–S10; chair sign-off on the diff suffices. Dispositions:
- S1 Table 1 total 860 → 840 (INC-007 recorded; panel including chair named as source; scripts/check_table1.sh invoked by latex/build.sh).
- S2 ν defined once as the predicate on the artifact against the specified string; INC-001 is a variant-needle scope violation, not a needle pass, everywhere; §4.2 derivation uses x ∈ δ from assembly; §4.5 names INC-004 alone as the pass.
- S3 CLI echo stated in §3.7 (INC-008 recorded); "captured after the needle" and "neither admitted" replaced; the round-4 worker-side file write characterised as INC-001 action class with its permission status unrecorded.
- S4 dispatcher v2.1: echo and exit summary cut before the gate, exec-or-die, non-empty precondition, mkdir lock, o logged as returned bytes, Session parsed from stdout, HERMES_KANBAN_TASK asserted unset; fixture + test in instrument/test/ (passes); labelled "not yet been exercised" twice in the paper.
- S5 ledger made symmetric in §4.4, §5, §6, §8 (panel catches of INC-003/005/006 named with reviewer and round).
- S6 Lemma 1 printed in exact form with residue and assumptions; cross-reference repointed to §4.5.
- S7 symmetric eviction stated; reduced condition and threshold ≈ 0.015 printed.
- S8 ski-rental identification moved to Proposition 1; online rule replaced by committed-policy bounds.
- S9 RESULTS.md banner; sec_s3c pointer; snapshot top level regenerated at n = 16; README; verify_t.sh asserts 221; INCIDENT_LOG INC-006 addendum, INC-007, INC-008; this log; DRAFT.md canonical copy is the one in this repository, the author's working copy is synced to it before each commit.
- S10 wording pass complete; citation transcript committed as reviews/citation_check_2026-10-13.md.

## v1.7.1 (2026-10-13): chair sign-off residuals

Chair verdict on v1.7: ACCEPT, with four pre-tag fixes and six optional notes, all applied here: check_table1.sh wired into latex/build.sh with the locale pinned, "every instrument-derived cell"; hf_paper_stats.py guards the store block and degrades without state.db; incident counts in §5/§6/§8 reconciled with the seven-entry register and INC-008 added to Appendix B; README page count 19; INCIDENT_LOG INC-007 names the chair; the needle-trailer claim labelled hub-attested; Lemma 1 residue at p = 0.3 noted; v2.1 non-empty precondition applied to the response; access date stated for all web references.
Note: commit c9aa08e (amended away into 5dbd00a) contained a stats_live.md regenerated at 18:10 against a store that did not hold the hub session (workers: 0); it was reverted before the commit was finalised. The regeneration ran because the stats script had no guard, which the v1.7.1 fix adds.

## v1.7.2 (2026-10-13): James Whitfield's S3/S4 check

S3 PASS, S4 FAIL: the v2.1 gate missed on output shaped by the CLI's actual libraries (prompt_toolkit writes CRLF when stdout is a file) and the hand-written fixture could not see it; the echo cut removed only the first echo line. Fix: dispatcher v2.2 uses the quiet path (-Q: response only, session id on stderr), normalises CR, uses [[:blank:]] instead of \t in sed classes (BSD sed), keeps a row in a pending file on lock timeout, removes stale locks older than the budget; hf_admit.sh fails unless exactly one row matches; fixtures generated by instrument/test/gen_fixtures.py with a CRLF case and a leading-'t' line. Paper: §3.7 and §4.4 describe the quiet path instead of an echo cut; §3.7 reports the TIMEOUT rows' transcript bytes (17,507 / 21,035) and explains the v1 artifact column; the round-4 file-write sentence cites the post-INC-001 single-file-write regime. Still not exercised against a live worker; labels retained.

## v1.7.3 (2026-10-14): first live v2 run on the hub failed before the worker started

`hermes chat -Q "<brief>"` exits 2: -Q is a store-true flag, the brief must still be passed with -q. v2.2's first live dispatch therefore logged an ERROR row (rc 2, 0 bytes, 1 s) with no worker involved; the row and its .out/.err files were removed before the corrected run, since they measure the script, not a worker. Fix: `-Q -q "<brief>"` (dispatcher v2.3). The hub's live T query returned 1,046 rows on 2026-10-14; the paper continues to cite the frozen 343/221.

## v1.7.4 (2026-10-14): first live v2.3 row

Probe brief to DeepSeek: 9 s, 449 bytes, needle hit as the last of two response lines, session id captured; row 1 of instrument/hf_stats_v2.tsv with raw output and stderr retained. §3.7 and §4.4 now say v2 was exercised once; no paper number comes from it.

## v1.7.5 (2026-10-14): briefs recovered and committed

briefs/ added (23 dispatched briefs + review2_common.md; hf_probe2.txt not retained). §3.7 needle-trailer claim verified; round-4 file write characterised as within mandate; brief/needle permutation explained; §5 states INC-004 was spontaneous and names the hub-authored origin of two struck overclaims; strike brief's pre-seeded leads disclosed. Tag v1.7.5 on this commit; §5 cites it.

Note: the first v1.7.5 commit (d25616e) carried the repo-side changes but not the manuscript edits, because the edit script aborted before writing; the tag was moved to the corrected commit minutes later.

## v1.7.6 (2026-10-14): briefs README and method wording

briefs/README.md added: a row-by-row map (TSV row, brief, section, needle, output file) so the permuted section-brief filenames need no decoding. §3.7 points at it. §5 restates the two brief-derived disclosures as audit trail and the novelty strike as a two-stage design (hub probe, then worker strike). Tag v1.7.6; §5 cites it.

## v1.7.7 (2026-10-14): panel round 3 (ACCEPT) items 1-10 and the wording pass

1 Drafting briefs carried no action constraint; §4 preamble, §4.2 σ, Appendix B INC-001 restated (INC-001 addendum 2). 2 b printed from briefs/: b/S = 0.17 pooled, p* 0.022, grid ×1.25 (largest cell T > 150), multiplier bound 3.3 pooled; §3.1-§3.6, F1. 3 Committed-policy bound restated as max{1, (w/h)/p + α}. 4 Abstract "same-model" replaced. 5 Ledger attributions: INC-004 licence line, INC-006 re-run at the hub's instruction, [15] omitted by the hub's weave. 6 probe_v2_brief.md reconstructed byte-for-byte and committed with a note; v2 section in briefs/README. 7 Stats script guards the partial-store case (v1.7.1 covered a missing store only). 8 README, snapshot, INCIDENT_LOG synchronised with dispatcher v2.3/v2.4. 9 ERROR-row policy in the dispatcher header; §3.7 "retained" carries its exception. 10 Four hub-authored struck claims counted; the intro brief's (2−p) formula reconciled; ε ≪ αS dependence stated. Wording pass applied. INC-007 addendum records the two panel-sourced sentences. Dispatcher v2.4 adds the missing-brief check. Tag v1.7.7; §5 cites it.

## v1.7.8 (2026-10-14): panel round 4 (ACCEPT) items 1-8

1 Row policy added to the dispatcher header (both halves: worker rc ≠ 0 after exec → ERROR row, files kept; script precondition failure → no row, exit 2); header, README and snapshot all say v2.4; `[ -f ] && [ -s ]` replaces `[ -r ]`. v1.7.7's entry reported item 9's header sentence and "dispatcher v2.4" as done; neither was in the file at cd5174d (INC-003 addendum). 2 §5 ledger: the INC-006 bullet rejoined; "Α" (U+0391) restored to α in §5 and F1. 3 Every printed b/S names its denominator; the per-brief range 0.09–0.38 is attached to the ten rows it is true of; 3.6 / 3.2 / 0.021 printed as the single-denominator alternatives; p = 0.3 cells with b carry one decimal (74.5 / 99.7 / 150.1). 4 §5 "6×" sentence restated: "cannot lose" is a theorem of the brief's variant for α < 1/2; 1/α survives as the §3.4 bound and only the lifespan reading was withdrawn. 5 "nine review briefs (ten dispatches)"; the n = 10 sentence carries its detection basis and the three round-5 /tmp writes (§4, INCIDENT_LOG INC-001 addendum 2). 6 §5 names both unretained briefs; "byte-for-byte" replaced by "from the author's record of the command (not retained; hub-attested)" in §5 and briefs/README; §3.7 and §5 count 23 v1 briefs plus the reconstructed v2 probe. 7 §4.4 "because the hub did not run its own cross-check" restored beside the INC-006 credit. 8 Wording residues: INCIDENT_LOG addendum (a) qualified to rows 7–26; §4.4 "satisfied by construction" qualified; briefs/README "second panel"; README "seven addenda", page count; §5 "two of the five used the licence"; §2.7 "at zero overhead". Recommended items applied: §3.6 eviction threshold at measured b (0.018) and "(at zero overhead)" on p > α; Appendix B "draft brief". INC-007 addendum 2 records the four panel-sourced sentences with sources. Every line of this entry was checked against `git diff v1.7.7 v1.7.8` before the tag. Tag v1.7.8; §5 cites it.

## v1.7.9 (2026-10-14): chair sign-off fixes on the v1.7.8 diff

The v1.7.8 dispatcher header listed "unreadable brief" among the precondition failures while the same commit replaced `[ -r ]` with `[ -f ] && [ -s ]`, which does not test readability; `[ -r ]` restored beside the new test and the failure message says so. README version strings (lines 3 and 18) and its `briefs/` row brought to the tag. §5 and `build.sh` cite v1.7.9. Nothing else changed.

## v1.8 (2026-10-14): outside reader's feedback, items 1-4 and smaller fixes

1 Free-lane corollary made the main result: abstract, §1.4 and §3.3 lead with it; the paid-worker grid is labelled conditional on Assumption E, which the hub violates, and §3.3 states that at w = 0 the horizon factor cancels and that under eviction (★) reduces to per-query routing [23][24]. 2 p and α labelled as illustrative estimates on a hub-attested record at the abstract, §1.4, §3.4 and §8; §3.2 says what p is in this paper (a heterogeneous, incident-corrected first-try rate over a selected brief mix, not a worker-level constant). 3 "Provenance checks must be run by someone other than the author of the number" withdrawn from the abstract and §8 (INC-007 contradicts it: a panel supplied the wrong total); the narrower lesson printed: a reproducible source record and independent recomputation from it, with no single check sufficient. 4 Contribution stated explicitly in the abstract and §1.3 (conditional horizon model, context-admission accounting, instrumented self-study with incident record); the anatomy named as a framing with counterparts in electronic institutions [31] and §2, and the paper says it does not establish a general institutional design. Smaller: abstract opening narrowed from "a dominant mode of knowledge production" to a common mode in agent systems; the ★ glyph rendered as one filled star in prose and code (postprocess.py mapped prose ★ to \star, which printed ⋆ beside the code-block ★); PDF keywords metadata added in build.sh. Declined: a tagged PDF, which the tectonic pipeline cannot produce. Item 5 (moving reconstruction detail to a supplement) deferred to a later revision by the author's decision. No number changed. Tag v1.8; §5 cites it.
