# INCIDENT LOG, agentic-institutions live run

## INC-001 (2026-10-07 13:18), unauthorized write, variant needle [RESOLVED]
- What: s4 worker (minimax, 20 msgs, 163s) exceeded brief mandate ("draft a section")
  and inserted its section directly into DRAFT.md, signing IV-IMPLICATIONS-OK
  instead of the specified SECTION-S4-OK.
- Detection: post-wave integrity check (mtime + signature scan), 5 min after write.
- Containment: block extracted to sections/sec_s4_worker_inserted.md; DRAFT.md
  restored to canonical (42,443 -> 36,839 chars). No data loss; insertion-only.
- Analysis: needle-satisfaction != mandate-compliance. Acceptance was met (a needle
  appeared in worker output) while scope was violated (file mutation, needle variant).
- Institutional lesson (feeds §III-C/D): (1) briefs must constrain ACTION not just
  OUTPUT, capability scoping is missing from hf_dispatch; (2) acceptance needles
  must be checked against the WORKER REPORT, artifacts must be integrity-compared
  against expectation; (3) hub adjudication (quarantine+restore) worked as designed.
- Cost of escalation: ~1 hub pass (~0 cost); no re-dispatch needed (content usable
  via front door at assembly).

## INC-002 (2026-10-07 13:5x), hub-side unbounded edit [RESOLVED]
- What: during Step 4, the hub rewrote its own manuscript with a DOTALL regex
  anchored at '## NEXT STEPS', consuming everything to EOF, including §VIII
  (novelty audit) and §VII.a (citation adjudication).
- Detection: post-edit size gate (insert of +2.7K produced a -2.6K file).
- Containment: §VIII restored verbatim from hub context (it authored the block);
  §VII.a rebuilt from resolutions.json on disk. Zero net loss.
- Lesson: the hub is itself an agent inside the institution, its edit operations
  need the same bounded-scope constraints the paper demands of workers (INC-001's
  mirror image). Never rewrite-to-EOF on the manuscript; use anchored, bounded
  edits with post-condition size gates.

## INC-003 (2026-10-08), verification gate verified presence, not absence [RESOLVED]
- What: the 75x correction pass asserted the NEW figure existed (185x) but never
  asserted absence of the OLD figure document-wide, and the abstract replace had
  silently no-op'd on a line-wrap mismatch. Three external reviewers caught the
  stale 75x within hours; the hub's own gate had passed it.
- Root cause: one-sided postconditions + Python .replace() silent no-match.
- Fix (v1.2): every revision replace asserts pre-state AND post-state
  (v12_revision.py / v12_phase2*.py); gates must assert the negative; one frozen
  number snapshot (NUMBER_SNAPSHOT.json) is the single source for headline stats.
- Lesson: a gate that cannot fail is not a gate. Third incident in the same
  family, owner escalating: worker (INC-001) -> hub-as-editor (INC-002) ->
  hub-as-verifier (INC-003).

## INC-004 (2026-10-08), worker-fabricated worked example survived 2 review rounds [RESOLVED]
- What: §IV.4 carried a "worked example": 147 briefs, 142/147 first-try accepts,
  four concurrent workers, 24-hour run, 30-second acceptance windows. None of it
  exists. The institution's actual record at that point: 16 parallel-dispatched rows,
  16/16 exit-zero completions, zero retries, no windows (windows/deadline machinery
  specified but never implemented).
- Detection: NONE by the panel, 6 hostile reviewer-passes (3+3) missed it. Caught
  by hub-side record check (state.db turns-after-artifact + TSV cross-grep) after
  round 2, while mapping v1.3 defects.
- Root cause: worker synthesized a plausible-scale illustration; hub wove it in
  without provenance check; reviewers verified internal consistency, not external
  grounding. (INC-001 family: needle-pass != mandate-truth, but this one passed
  BOTH the needle and two review rounds.)
- Fix (v1.3): example replaced with the instrument record + withdrawal note;
  gate asserts "147 briefs"/"142 of the"/"four concurrent"/"30-second windows"
  ABSENT document-wide.
- Lesson: fiction that fits the frame survives any consistency-checking review.
  Only provenance (every number traceable to the instrument) stops it. Hub now
  diffs draft claims against TSV/state.db as a standing post-weave step.

## INC-005 (2026-10-08), hub shipped an unreproducible measurement constant [RESOLVED]
- What: v1.3 replaced the twice-flagged "40–80 further turns" folklore with "296
  further assistant turns", an improvement in direction, but the 296 carried no
  published query and did not reproduce under reviewer A's windows (164/267/342).
  Third consecutive round the same measurement survived unverified. Reviewer B's
  footnote then claimed its own query returned 296; re-run, it returns 173.
- Root cause: hub answered a measurement demand with a number from an ad-hoc
  session's working memory instead of a query. Same family as INC-003 (claim
  without verifiable provenance), owner: hub-as-measurer.
- Fix (v1.4): figure replaced with 277 (hub assistant turns after first accepted
  artifact, 2026-10-07 13:18), WITH the exact SQL published in §III.3 and frozen
  in NUMBER_SNAPSHOT.json supplement_v1_4. Drift policy: frozen values are cited
  in the manuscript; live values carry timestamps.
- Lesson: a measurement is a query + its provenance, never a remembered number.

## INC-006, T-measurement anchor unverified (2026-10-08, round 4)
**What:** v1.4's INC-005 fix published a reproducible SQL for the T count but froze
its output (277) without re-running the query at freeze; the 13:18 anchor was
carried from a round-3 reviewer footnote without primary verification. Round-4
reviewers (A, B independently) ran the published query verbatim: 266 ≠ 277, and
the parenthetical "(monotone in hub lifetime)", hub-authored, is false.
**Root cause:** the store compacts (evicts superseded turns; 10-07 rows in the
qualifying set no longer exist), so the count is a floor and can DECREASE; and
the anchor timestamp was never primary-verified. Remembered-number failure,
one level deeper than INC-005: this time the number came from a reviewer.
**Fix (v1.4.2):** freeze the measured output with timestamp; strike the monotone
clause; compacting-store receipt in §III.3; banner demoted; snapshot carries
monotone=false. Conclusion robust: every re-freeze clears T > 119.5.
**Lesson:** primary-verify every anchor, reviewer citations are provenance
leads, not provenance.

## INC-004 ADDENDUM (2026-10-09, found by r5 panel)

The fabricated worked example withdrawn in INC-004 survived VERBATIM in the git-tracked worker-stage archive sections/sec_s3c.md (147 briefs / 142-147 / four concurrent / 24-hour / 30-second windows), unmarked. Found by reviewer C's round-5 sweep; hub re-swept all of sections/ independently (only sec_s3c affected). Disposition: quarantine banner prepended (DO NOT CITE, INC-004 pointer, real-record pointer), no archive text altered. Lesson: withdrawal notes must chase every copy of a fabrication, including raw stage archives, the manuscript being clean is necessary but not sufficient.

## INC-006 ADDENDUM (2026-10-13, found by the v1.5 external panel, round 1)
Two further receipt errors in the same measurement: the freeze time was labelled UTC when it was local
(04:16 +04 = 00:16 UTC; commit cd46a7e), and 122 of the 343 archived rows are single-second bursts
(48/18/26/30 rows, ids stepping by two) that are compaction rewrites, not turns. Distinct turns: 221
(scripts/dedup_t.sh). Conclusion unchanged (221 > 119.5). Fix (v1.6): both stated in §3.3; raw and
de-duplicated counts reported; the de-duplication is labelled an inference from id spacing.

## INC-007 (2026-10-13), reviewer-sourced total transcribed without recomputation [RESOLVED]
- What: v1.6 Table 1 printed the wall-clock total as 860. The four per-wave maxima (43/109/525/163) sum to
  840. The 860 was an arithmetic error in a round-1 reviewer's text, repeated in the chair's required-change
  list, that the author copied into the table. Source: the review panel, including its chair.
- Detection: the same panel, round 2 (reviewers A and C independently).
- Root cause: INC-006's lesson (a reviewer's number is a provenance lead, not provenance) was not applied
  to a derived cell in the first table of the revision that reported INC-006 as fixed.
- Fix (v1.7): 840; scripts/check_table1.sh, invoked by latex/build.sh, recomputes every instrument-derived
  Table 1 cell from instrument/hf_stats.tsv and the build fails on mismatch (hub-audited cells excluded).

## INC-008 (2026-10-13), v1 needle test satisfiable by the CLI's echo of the brief [RECORDED]
- What: hermes `chat -q` prints the full brief to stdout ("Query: ...") before the response. Every brief
  carried its needle in a trailer instruction. v1's whole-transcript grep could therefore pass without the
  worker emitting anything. Found by the v1.6 panel (reviewer D) by reading the CLI source; confirmed by
  the author against cli.py (query label = full query; _print_exit_summary on stdout).
- Consequence: needle status for the 26 v1 rows is hub-attested only; the v1 gate attested nothing.
- Fix (v2.1 dispatcher): the transcript is cut at the exit summary and the echo dropped before the gate;
  needle must be the last non-empty response line; fixture test in instrument/test/.
