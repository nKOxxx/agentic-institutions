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
  silently no-op'd on a line-wrap mismatch. Three LLM reviewer agents caught the
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
- Fix (v2.3 dispatcher): the worker is invoked on the quiet path (-Q -q), which prints the response alone and the
  session id to stderr; line endings are normalised (the interactive path writes CRLF to files, which a
  hand-written fixture had missed: found by the v1.7 S4 check); needle must be the last non-empty response
  line; fixtures generated with the same print call, including a CRLF case, in instrument/test/.

## INC-001 / INC-004 ADDENDA (2026-10-14, briefs recovered)
The 23 dispatched briefs were recovered and committed to briefs/. They establish: (a) every brief ends with a
trailer naming its needle, so the v1 whole-transcript test was satisfiable by the CLI echo for rows 7–26, written on the
CLI path the committed v1 script uses (that script is established for rows 15–26; INC-008 confirmed; rows 1–6 came from an earlier script version and rows 1–2 logged
fewer bytes than their briefs); (b) the INC-001 worker signed its brief's section label (IV-IMPLICATIONS) instead of
the specified SECTION-S4-OK; (c) the constraints brief (sec_s3b_brief.md) asked for the 7/7 needle-hit rate
as the worked example and, in its rules line, licensed concrete examples from a system the worker could not
observe, so the INC-004 figures were the worker's own and the under-specified deliverable the hub's; (d) the round-4 reviewer
brief permitted exactly one file write, so the review4_C file write was within mandate; (e) the section
briefs' filenames, section labels and needles are permuted (hub-side naming), which explains why the
quarantined fabrication lives in sections/sec_s3c.md though dispatched from sec_s3b_brief.md; (f) the
intro brief instructed the worker to write "cost-optimal control law" and "the economics re-derive the
anatomy", so those overclaims were hub-authored.

## INC-007 ADDENDUM (2026-10-14, panel round 3)
Two further panel-sourced sentences were transcribed into v1.7 without checking: a committed-policy bound in
§3.3 stated as a ratio to the optimum below 1 (from the chair's round-2 required-change list, S8) and an
abstract clause asserting "same-model" review for two rounds whose model is not recorded (from a reviewer's
round-2 suggestion adopted by the chair, S10). Both caught by the panel's third round, both against its own
interest. Fix (v1.7.7): bound restated as max{1, (w/h)/p + alpha}; abstract clause replaced. Lesson unchanged:
a panel's sentence is a lead to re-derive, not text to transcribe.

## INC-001 ADDENDUM 2 (2026-10-14, panel round 3)
The 13 drafting briefs carry no action constraint of any kind (grep over briefs/); scope and single-file
writes were instructed only in the nine review briefs (ten dispatches) after INC-001, which record no write
to the paper tree outside the permitted file; three round-5 workers copied the repository to /tmp to
tamper-test the verifier, outside the briefs' literal text and invisible to the hub's tree diff, self-reported
and not treated as incidents (panel round 4). v1.6/v1.7 said scope "was a sentence in the brief"; v1.7.7 says it was unstated in the drafting
briefs and instructed, never enforced, in the review briefs.

## INC-003 ADDENDUM (2026-10-14, panel round 4)
REVISION_LOG v1.7.7 asserted a dispatcher-header row-policy sentence and a "v2.4" version label that the
committed file at cd5174d did not carry; briefs/README.md pointed a reader at the missing sentence; the
review panel's brief to its fourth round repeated the log's claim as fact. Caught by three reviewers
independently, each by opening the file. Same class as INC-003: a post-state asserted from the fix list, not
from the diff. Fix (v1.7.8): sentence added, version string made one string across header, README and
snapshot, `[ -f ] && [ -s ]` replaces `[ -r ]`. Rule: every REVISION_LOG line is checked against `git diff`
before the tag.

## INC-007 ADDENDUM 2 (2026-10-14, panel round 4)
Four more panel-sourced sentences in v1.7.7, source named by the panel itself:
- Reviewer Morrow, round-3 K2, carried by the chair as item 2: "0.09–0.38 per brief" over the twelve
  drafting briefs, a range true of ten (rows 1–2 give 1.16 and 1.21); and "3.3 pooled (3.0 at wave 1)"
  pairing a hub-audited α with an instrument-denominated pooled b/S without saying so. Arithmetic right,
  set and pairing unstated. Caught by Morrow, round 4, against her own text.
- Reviewer Morrow, round-3 K3 fix text, carried as item 10: "'6×' … a theorem of that variant and withdrawn
  under (★ε)", when 1/α is live in the abstract and §3.4 and only the lifespan reading was withdrawn.
- Reviewer Whitfield, round-3 H1, carried as item 1: "the ten review briefs": nine files, ten dispatches.
- The chair, round-3 item 1: "record no scope incident (n = 10)", written from this log without the
  round-5 transcripts, which record three /tmp writes outside the one permitted file. Caught by Okafor and
  Whitfield, round 4.
Fix (v1.7.8): every b/S names its denominator; the "6×" sentence restated; "nine review briefs (ten
dispatches)"; the n sentence carries its detection basis. Lesson, extended: the panel's own recomputation of
its numbers is not the author's; the author re-derives from the files every time, ranges and denominators
included.

## INC-006 ADDENDUM (2026-10-17, cold-read round 7)
The entry above says the 13:18 anchor "was carried from a round-3 reviewer footnote" and that "this time the number
came from a reviewer". Neither is supported by the public record: no round-1, 2 or 3 reviewer file contains 13:18
or 277; reviewer B's round-3 footnote (reviews/reviewer_B_econ_r3.md lines 270 to 272) anchors a different count at
11:58 and reports 296; the 13:18 anchor is row 13's append time (the INC-001 worker's completion; launch about 13:15:51) and first appears in the
hub's own v1.4 query. The 277 is the hub's frozen output of its own query. The lesson line stands for the general
case; its "came from a reviewer" clause is withdrawn. The footnote attribution appeared once in the hub's own text at v1.4.2 (8cabbcf; gone by
v1.4.3), then at four sites (§1.4, §4.6, §5, Appendix B) from v1.7.7 (cd5174d, the second panel chair's round-3
wording pass, transcribed from this entry) to v1.9.2, never checked against the reviewer files. Corrected in v1.10.

## INC-001 ADDENDUM 3 (2026-10-17, cold-read round 7)
Addendum 2 says the three round-5 /tmp copies were "outside the briefs' literal text". The briefs instructed the
copy: briefs/review5_{A,B,C}.md line 17, task T3(c), "TAMPER TEST: copy the repo to /tmp, delete or alter one CSV
row, rerun verify_t.sh", in the same file as line 24, "You may write ONLY your one review file". The mandate was
self-contradictory; the workers followed the task outside the paper tree and reported it. The n = 10 record shows a
write restriction on the paper tree holding on a benign task as far as a tree diff can see, and nothing about
instruction-only scope holding by its letter. The sentence was written by the second panel's chair in round 4 and
transcribed into §4 without opening line 17 of a file the chair had open at line 22. Corrected in v1.10.

## INC-004 ADDENDUM 2 (2026-10-17)
The addendum of 9 October says "no archive text altered". Commit 24b508e (12 October, typographic normalisation of
em-dashes across 31 files) touched sections/sec_s3c.md and every file under reviews/; the pre-edit text is in git
history (`git diff 24b508e^ 24b508e`). The quarantine banner and the fabricated figures are unchanged in substance.

## INC-007 ADDENDUM 3 (2026-10-17, cold-read round 7)
Four more panel-sourced or panel-kept sentences stood in the published v1.9.2, each falsified by one grep against
the repository, each available to the panel from files it had open at the time:
- "a write the briefs' literal text did not permit" (§4; chair, round 4): the briefs instructed it (INC-001 addendum 3).
- "carried the query's anchor from a reviewer footnote" (§1.4, §4.6, §5, Appendix B; chair's round-3 wording pass,
  transcribed from the INC-006 entry): no reviewer file carries it (INC-006 addendum).
- "a confabulated receipt" (§5; reviewer Okafor, second panel round 1, 13 October, adopted at 13baf01, v1.6, carried by the chair): the record shows
  a query that did not reproduce on a store that compacts, nothing more.
- "none invented a number, name, date, file, commit or incident" (§3.8; the adjudicator's own verdict line, kept by
  the chair in round 6 against Okafor's A1): the adjudication notes, lines below it, label two statements invented.
Also missed by six warm rounds and found by the cold round: §5 said five panel rounds when six had run; two of the
third referee's dispatches have no instrument row; Table 1's "Produced" includes the echoed brief; the build gate
passed a flipped PASS/FAIL mark; Lemma 1 at the ladder's cap gives p* = 0.09, not 0.02. Lesson, third form: warm
diff rounds verify that a required sentence was applied, not that it is true; a cold reader with no required-change
list can only open the file. Rule from v1.10: before any deposited tag, one cold read of the whole paper and
repository by reviewers with no access to earlier rounds; the chair's own sentences named in every brief; every
sentence in §4, §5 and Appendix B that names a party carries a file pointer. Reviewer and chair names in this log
are LLM personas of the author's review tooling (Anthropic Claude), not people.

## ADDENDA (2026-10-17, v1.10.1, from cold-read round 8)

- INC-007, addendum 4. The v1.10 post-tag note in REVISION_LOG stated that the deposited PDF was byte-identical to the tagged `latex/paper.pdf` and built by `latex/build.sh`, and README line 5 repeated the byte-identical claim. Neither claim was true (md5 9a0de46d63aef579877012e87ed4ee39 deposited against 4df2c98d0a75048a0d5ff376a7227ea0 at the tag; built by the ungated `paper-src/build.sh`; title date 15 October). Same failure as INC-007: a sentence about the record written without opening the record. Fix (v1.10.1): the deposit is `git show v1.10.1:latex/paper.pdf`; md5s are computed from the uploaded files and written after deposit; `paper-src/build.sh` refuses to run.
- INC-007, addendum 5. `scripts/check_table1.sh` (the "Fix (v1.7)" line under INC-007 above, lines 113 to 114) is a presence check: it asserts each recomputed value occurs somewhere in DRAFT.md, so a changed Table 1 cell passes when the same number occurs elsewhere (verified by the round-8 chair with a mutated copy). The wording "fails on mismatch" overstated it. Cell-anchored checking is not adopted at v1.10.1.
- Rule of v1.10 (above, "every sentence in §4, §5 and Appendix B that names a party carries a file pointer"): v1.10 did not meet it, and the block above reads as if it did. v1.10.1 adds pointers to some of the sentences it changes and commits `scripts/party_sentences.py`, which lists every sentence in §4, §5 and Appendix B that names a reviewer, panel, chair, referee, worker, hub, adjudicator, author, reader or session and marks whether it carries a file pointer; its output at v1.10.1 is `reviews/party_sentences_v1_10_1.txt`, with the counts in its header. The unpointed sentences are the author's account, as the Table 1 caption says.
- Build: the §5 checker table (added at v1.10) overflowed the page margin by about 1,490 pt in the tagged and the deposited PDF, and the build printed OK, because tectonic's Overfull warnings were not a gate. Found by round 8. Fix (v1.10.1): paragraph columns in `latex/postprocess.py`; `latex/build.sh` fails on any Overfull hbox.
