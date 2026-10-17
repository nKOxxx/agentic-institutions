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

## v1.8.1 (2026-10-14): panel round 5 (ACCEPT) items 1-9 on the v1.8 diff

Changed in DRAFT.md: 1 §3.3 Assumption E paragraph restated: the free-lane threshold is T-independent because all hub output is charged under one persistence law, so (1+T) cancels under E and under eviction alike; both thresholds printed (0.022 under E, 0.018 under eviction at the measured b, §3.6); "does not need E" withdrawn; the eviction reduction attributed to the §3.6 condition at zero overhead, not to (★); abstract eviction clause carries "full eviction" and "at zero overhead". 2 Abstract: "record supports" attached to the free-lane condition against the paid horizon, with ε named as unlogged and α as hub-audited. 3 Abstract: the second panel's errors were caught by the same panel recomputing from the record (INC-007), not by "the others"; "and this is the contribution" deleted. 4 "Measured" kept only for instrument- or brief-derived quantities: §1.4 (two), §3.1 (two), Lemma 1, §5, §2.7 (two), abstract. 5 One provenance word per quantity: α hub-audited (§1.4, §3.4, §8, abstract), p hub-attested; abstract says α is over the 12 woven dispatches and p over 13 briefs; §3.6 defines hub-audited. 6 §5: the second panel reviewed v1.5 through v1.8 over five rounds on 13–14 October; its transcripts are not in this repository, so the INC-007 source text is not public; v1.8 answers a reader outside both panels; abstract and §1.3 scope "transcripts are public" to the agent panel. 7 §3.6: heterogeneity of p enters the retry model through E[1/p_i] ≥ 1/p̄, the free-lane condition is on the harmonic mean, and the biasing terms now count four. 8 §2.7 "addresses" → "names". Recommended items applied: §4.4 INC-006 clause points at the recomputation half of the §8 lesson; §8 "each time" → "in every number incident"; §4 "13 briefs (twelve drafting, one resolver)". §5 cites tag v1.8.1. Changed elsewhere: 9 README page count dropped (it lagged the build at three tags); README version strings v1.8.1; build.sh date; postprocess.py star mapping uses \symbol{"2605} so the non-ASCII self-check no longer lists ★; paper.pdf rebuilt (22 pages). No number changed.

## v1.8.2 (2026-10-14): chair sign-off fix on the v1.8.1 diff

v1.8.1 added one derived number to §3.6, the harmonic-mean illustration (eleven briefs at 1, two at 0.05), and printed it as 0.26; 13/51 = 0.2549, so 0.25. The figure was transcribed from the chair's three-decimal value and rounded again instead of being recomputed from the inputs printed beside it (the INC-007 pattern, caught by the chair's diff check). Corrected to 0.25. §5 cites tag v1.8.2; README version strings; build.sh date; paper.pdf rebuilt (22 pages). Nothing else changed.

## v1.8.3 (2026-10-14): pre-registration of the A/B wave; third referee's items 2 and 3

A third referee (two DeepSeek dispatches plus hub-side verification, on v1.7.9) found 91 of 92 checkable numbers reproducing and one that did not (briefs total 19,256 against the paper's 19,262); that one does not reproduce against the public repository at any tag (the twelve briefs sum to 19,262 at v1.7.5, v1.7.9 and v1.8.2) and traces to a local edit of the briefs on the hub's checkout that is not on origin. Its substantive findings: α is the load-bearing input and is attested, not logged (one logged inline-versus-delegated wave fixes it); the paper has no falsification protocol; the Clopper–Pearson interval is printed on a quantity the same sentence disclaims. Changed in DRAFT.md: §3.7 interval sentence replaced by a statement of why no interval is printed; new §3.8 states what the record cannot falsify and points at the pre-registered protocol with its predictions; §5 cites tag v1.8.3. Changed elsewhere: `experiments/ab-2026-10/` added (PROTOCOL.md, six briefs, `ab_admit.sh`, `ab_stats.py`, run sheet), committed and tagged before any dispatch; `instrument/hf_dispatch.sh` v2.5 adds the `hub` worker entry resolved from `AB_HUB_MODEL` and `AB_HUB_PROVIDER`, with the header's precondition list extended; README gains the experiments row and the dispatcher version; NUMBER_SNAPSHOT dispatcher field v2.5; build.sh date; paper.pdf rebuilt. No number changed. The referee's other findings (novelty concession, paid lane non-load-bearing, the withdrawn lesson, the biasing terms, the cached-price cell, T as an upper bound, the wave-4 cell flag) were already addressed at v1.8 to v1.8.2 or already stated in the paper. (Added 2026-10-17: the referee's verdict was "MAJOR-REVISIONS, borderline NOT-READY", readiness 3 of 10; its L4 called the incident log "a rhetorical shield" and the reflexive framing "an unfalsifiable shell game".)

## v1.8.4 (2026-10-14): protocol amendment before any dispatch

A dry run of `ab_stats.py` on synthetic rows (no real data) showed two design faults in the v1.8.3 protocol: the briefs' 400-to-700-word target would put b/S near 0.5 by construction, outside the record's range, and P4's o/S prediction had no basis in the record. Changed: the six briefs ask for 900 to 1,400 words (matching the record's section drafts); PROTOCOL.md carries the amendment note, withdraws the o/S prediction (o/S reported), and states the one cost the wave does not count (the adjudication read); `ab_stats.py` reports o/S without a mark; §3.8 says so and names the condition under which P6 fails. P1, P2, P3, P5, P6 unchanged. §5 cites tag v1.8.4; README and build.sh version strings; paper.pdf rebuilt. No row exists at this tag.

## v1.9 (2026-10-15): the pre-registered wave, run and reported

Data: `experiments/ab-2026-10/` now holds 18 rows (12 valid: 6 DeepSeek-V4-Flash, 6 glm-4.6 via zai; 6 hub rows run with placeholder model variables, ERROR, retained and adjudicated REJECT OTHER), raw outputs, `hub_model.txt`, `ab_adjudication.tsv`, twelve admitted excerpts, `RESULTS.md` (generated by `ab_stats.py`), `ADJUDICATION_NOTES.md` (who adjudicated: the author's review-tooling session; every excluded statement listed), and `COUNTERFACTUAL.md` generated by the new post hoc `ab_counterfactual.py` (print-back reduced to the status line; labelled not a prediction). Protocol files unchanged since v1.8.4 (`git diff v1.8.4 -- PROTOCOL.md briefs ab_stats.py ab_admit.sh` empty). Outcome: P1 PASS (α_D 0.165), P2 PASS (6/6), P4 PASS (b/S 0.284), P5 PASS (0.83); P3 FAIL (M 0.57, o/S 1.007: the dispatcher's 25-line print-back returns the whole draft), P6 FAIL (proviso (b+o)/S 1.291 > 0.835, p* undefined). Changed in DRAFT.md: §3.8 rewritten as the wave as run, with the per-pair table, each prediction marked as the script marks it, what each failure moves, the counterfactual labelled, the uncounted costs restated, and the pointer "at tag v1.8.3 and amended at v1.8.4"; abstract, §1.4, §3.4, Corollary 1, §3.6 and §8 each carry one sentence on the outcome; Appendix A F6 added; §5 cites tag v1.9. Changed elsewhere: `scripts/check_ab.py` added and run by `latex/build.sh` (every pooled number and both per-pair ranges in §3.8 must match the generated files); dispatcher legend line lists `hub`; README rows for the experiment and the check, version strings; NUMBER_SNAPSHOT `supplement_v1_9`; build.sh date; paper.pdf rebuilt. No number outside §3.8 changed; the numbers in §3.8 are the wave's.

## v1.9.1 (2026-10-15): panel round 6 (REVISE, minor) items 1-14 on the wave's report

Round 6 re-read §3 and Appendix A against the committed rows; no mark changed, no band moved, no frozen file differs (`git diff v1.8.4 -- PROTOCOL.md briefs ab_stats.py ab_admit.sh` empty; RESULTS.md, both TSVs, `out/`, `admitted/`, `hub_model.txt` unchanged from v1.9). 1 `ab_counterfactual.py` defined the status line as o_bytes − out_bytes, which subtracts the blank lines the dispatcher strips; corrected to o_bytes − artifact_bytes (55 bytes on every valid row), COUNTERFACTUAL.md regenerated: M_cf 1.84 → 1.83 (Δ_cf 21,636 → 21,696), proviso 0.290 → 0.291, p*_cf 0.065 unchanged; §3.8, the snapshot and this log carry the moved numbers. 2 `latex/build.sh` regenerates both generated files and compares them before `scripts/check_ab.py`, which now also asserts the row order the pairing rule depends on and the realized block. 3 Every number in §3.8 is printed by a committed script: the post hoc script now prints the realized proviso 1.291, the within-arm M′ 0.69, the six inequalities o_D > S_I, o_I/S_I, and two variant readings of the adjudication rule. 4 §3.4 prints S_D/Δ_D = 0.69 under its own label and the matched 0.57 beside it; "o → 0" became "(b + o)/S → 0". 5 §3.8: "one term" withdrawn; the v1 dispatcher's identical 25-line tail and the pre-registration's own fourfold o underestimate stated; the counterfactual attributes the P3 miss to the size ratio (M′_cf 2.19 inside the band) and carries the eviction caveat with the identity Δ_cf + S_D = Δ_D; the six inequalities printed; F6 amended. 6 Who adjudicated stated with the panel-tooling clause; the "hub reads the draft" sentence reconciled; the omission's direction stated. 7 The adjudication reading named as post hoc; the literal-clause (1/6, α 0.026, P1 and P2 fail) and length-rule (4/6, 0.114) variants printed; "stands" and "confirmed" → "consistent with"; abstract and F6 carry the clause. 8 α_I attributed to the adjudicating session; the protocol's self-admission design recorded as not executed. 9 Hub model attested in `hub_model.txt`, not logged by the CLI; PROTOCOL.md's contrary sentence left frozen and recorded as false of the record. 10 Last-row pairing rule and the R = 1 departure on the inline arm stated in §3.8 and the notes. 11 Scoping: eight sentences that said o was unlogged or every α hub-audited now name the Table 1 waves; §3.6's closing proviso names the wave; F5 carries the print-back caveat. 12 Corollary 1 and §3.6 print the threshold at both magnitudes (0.02 at S ≈ 20,000; 0.065 at the wave's); §3.3's "exactly when" carries the proviso and the wave's ratio 1.456 at p = 1; Corollary 1's new sentence says the premise is the condition at p̂ = 6/6. 13 Abstract: the 1/α sentence carries its condition and the one logged value; "take the whole draft back" → "persist in hub context"; o/S printed as 1.007. 14 This entry supersedes v1.9's "No number outside §3.8 changed" with: no existing number changed at v1.9; the wave's numbers were added in the abstract, §1.4, §3.4, Corollary 1, §3.6, §8 and F6. Omitted from the v1.9 entry and recorded here: the three referee files under `reviews/` from 56c06df (the third referee's pass on v1.7.9, taken from the hub's local branch); `.gitignore` and the `__pycache__` deletion at 340fb1f; the data landed in two commits (rows and outputs at 746de7c before adjudication, adjudication at 346c3c1), differing in the admitted column only, against the run sheet's "exactly once"; R = 1 departed from on the inline arm by six reruns after placeholder variables. Run sheet updated to what was realized. §5 cites tag v1.9.1; README and build.sh version strings; paper.pdf rebuilt.

Post-tag note on the v1.9.1 entry (2026-10-15, chair diff check, no re-tag): edits in `git diff v1.9 v1.9.1` the entry above did not name: the §3.8 and snapshot time window ("the last finished at about 19:37"); the abstract's threshold clause ("at the magnitudes of the Table 1 drafting waves") and the word "gated" in the status-line sentence; the snapshot's `alpha_I` and `source` strings; the experiment README's `hub_model.txt` paragraph; item 11 touched ten sites, not eight. `scripts/check_ab.py` now also asserts the six o_D > S_I inequalities §3.8 prints (post-tag commit).

## v1.9.2 (2026-10-15): one glyph

The prime in M′ (§3.8, added at v1.9.1) is U+2032, which the body font (Latin Modern) does not carry; the v1.9.1 PDF printed a missing-glyph box at that one site, so the within-arm multiplier was indistinguishable from the matched M in the published PDF. `latex/postprocess.py` now maps U+2032 to a math prime. Found while preparing the arXiv source bundle (the build log's "missing character" warning). §5 cites tag v1.9.2; README and build.sh version strings; paper.pdf rebuilt. No number, mark or sentence changed.

Post-tag note (2026-10-16): the paper was published on Zenodo as v1.9.2, DOI 10.5281/zenodo.23392762, file md5 8bbb6d4fff75d6bbdc0b19029033b9e0 (text identical to latex/paper.pdf at v1.9.2; the PDFs differ in bytes because they were built separately three seconds apart). README names the DOI. No tag moved; the manuscript is unchanged.

## v1.10 (2026-10-17): cold-read round 7 on the published v1.9.2 (MAJOR REVISION) answered

Round 7 (four reviewers on a smaller model, given only the published paper and the repository; chair on the default model) found eleven published sentences false of the record at the tag and a set of disclosure gaps; verdict MAJOR REVISION; logged in the author's review tooling. Four of the false sentences were the second panel's own, kept through six warm rounds that verified their presence and not their truth (INCIDENT_LOG, INC-007 addendum 3).

Corrected in DRAFT.md, each false of the record: §4 the round-5 /tmp copies were instructed by the briefs' task T3(c), not "a write the briefs' literal text did not permit" (INC-001 addendum 3); §1.4, §4.6, §5 and Appendix B the INC-006 anchor was the hub's own choice of the INC-001 dispatch time, not "a reviewer footnote" (INC-006 addendum); §5 "a confabulated receipt" replaced by what the record shows, a query under a different anchor that did not reproduce on a compacting store; §3.8, abstract and F6 "none invented a number ..." replaced by the adjudication notes' own count (eight drafts with unsupported statements, two labelled invented) and the acceptance stated under both readings (6 of 6 post hoc, 1 of 6 as written); §5 six panel rounds, not five, with the sixth's verdict; §4 "every number in this paper" scoped to §3.1 to §3.7 and F1 to F5; §5 (Instrument limits) needle logging scoped to the v1 table; §3.8 the build-gate sentence now true (see below); §3.7 and README the third referee's two dispatches (R10A, R10B) named as having no public row, and the v1 script described as the lineage established for rows 15 to 26 (rows 7 to 14 carry no artifact column); §3.3 the free-lane threshold stated at the waves' sizes (0.02 at wave 3's 25,284; 0.04 to 0.06 at 11,440 and 6,741) and the abstract's threshold scoped to one wave's size with the retry-cap value beside it and "artifacts of tens of thousands" replaced by 7,000 to 25,000; abstract, §1.3 and §5 "reviewer transcripts" replaced by "reviewer reports", with the 24b508e normalisation and the non-retention of session transcripts stated.

Disclosures added: the third referee's pass, verdict and L4 critique (§5); a table of every checker with model, inputs, priming and output location (§5), naming the second panel's model family (Anthropic Claude Fable 5.1; Sonnet 5.5 for the cold round) and the verdict floors in the round-4 and round-5 briefs; the author's one full read (v1.4.6) and the unrecorded outside reader; the adjudicator not blind to arm and `ab_adj.py` committed; Table 1's echoed-brief fractions (13.3 % on wave 4; 23.7 % and 11.2 % on waves 2 and 3 if the earlier script echoed likewise); the full SHA-256 of the 26-row instrument table in NUMBER_SNAPSHOT; the Zenodo deposit's byte difference (README, §5) and the v1.7.4 tag note (README); p* at retry caps R = 1 to 50 (§3.3, from Lemma 1); the counterfactual's two regimes (§3.8: 0.40 / 1.06 / 1.11 under uniform eviction); the symmetric-α assumption behind "holds under either" (§3.3; T ≈ 18); P4 partly design-determined (§3.8); the pre-registered P3 consequence printed beside the paper's reading (§3.8); "1.5 floor" defined; "instantiates every quantity" withdrawn from the abstract; the harmonic-mean clause quantified (§3.6: p_f > 0.04); INCIDENT_LOG "external reviewers" → "LLM reviewer agents" and personas labelled; data handling of the review workers' store queries and the unredacted outputs (§4); AP2 [35] added and §2.6's gap sentence qualified (AP2's user-signed mandates bind a purchase).

Optional items adopted: abstract cut from 701 to about 290 words; §4.2 "These conditions do work" replaced by what they do (classify after the fact); §1.3 says where the horizon term bites; §3.6 states p*(r) for a verification read o = rS; §5 names the three worker texts that asserted mechanisms the institution did not have; §5 counts INC-007 once; §8 lists the six referee positions not adopted. Also changed: §1.4 and §4.6 describe INC-005 as "a count that no query reproduced" (Appendix B keeps "taken from working memory", which INCIDENT_LOG supports); §1.4 qualifies the 50,567 figure by the echo; §5 carries the seventh-round sentence and cites tag v1.10. Not adopted: a blind second adjudicator (stated as not re-run); a replication on information-bearing briefs; the remaining prior-work pointers (speculative decoding, learning to defer, Schneider, Townsend, Holmström and Milgrom), identifiers not verified by the author this revision; the commit SHA on the PDF title page (the tag is cited and the README names its commit); cell-anchored `check_table1.sh`, Table 1 internal arithmetic, `test_gate.sh` sourcing the gate, and a process-group kill; reconciling REVISION_LOG's round-2 row 6 with its line 50 on who found INC-004 (left as the record stands). Second pass (same day): a cold provenance check of the eleven corrected sites and the chair's diff check found twelve further one-line errors in the first candidate, two of them in the incident-log addenda from the chair's own synthesis (the "round 3" for "round 1" on the confabulated-receipt source; "from v1.5" for the v1.4.2 hub origin and the v1.7.7 run of the footnote attribution), one the author's README pointer to a log entry that records no tag move, the rest in the paper ("no reviewer file carries it" scoped to rounds 1 to 3; "dispatch time" corrected to the row's append time; "every number in §3.1 to §3.7" scoped to Table 1's derivatives; rows 8 to 14 and the v1 lineage; the store instruction scoped to rounds 4 and 5; the five section workers' texts; the citation count (35 references, 11 fetched, 8 by title, [35] outside the transcript); four of five outside-reader findings; the referee's inputs and the verdict-floor scope in the §5 table; file pointers on the six uncited catches; the table's provenance caption; the deposit sentence in the future tense). The Zenodo record is dated 15 October; the post-tag note below the v1.9.2 entry is dated 16 October because the DOI reached the author then.

Changed elsewhere: `scripts/check_ab.py` now also checks the six PASS/FAIL marks, every cell of the §3.8 per-pair table, each pooled figure anchored to the pooled sentence, and the abstract's multiplier, both acceptance counts and admitted fraction against the generated files (a mutation set of eight flipped values each fails the build); `instrument/hf_dispatch.sh` v2.6 (after the wave; v2.5 ran it): placeholder guard on the hub entry and LC_ALL=C on the CR-stripping pipeline, header reworded on the v1 lineage; `scripts/verify_t.sh` no longer aborts under `env -i` (HOME unbound); `experiments/ab-2026-10/ab_adj.py` committed; ADJUDICATION_NOTES dated note; NUMBER_SNAPSHOT `supplement_v1_10`; INCIDENT_LOG four addenda; README rows; build.sh date; paper.pdf rebuilt (26 pages). No computed number changed; RESULTS.md, COUNTERFACTUAL.md, both TSVs and the frozen protocol files are unchanged from v1.9.2. Tag v1.10 after one cold provenance check of the eleven corrected sites against the files and the chair's diff check.
