# Briefs: the mandates behind every instrument row

Each file is the brief handed to a worker by `hf_dispatch.sh` (v1). The last line of every dispatched brief is a trailer naming the needle the worker had to emit. The table maps instrument rows to briefs, section labels, needles, and the files the hub kept.

The hub named worker outputs by needle, not by brief filename, and the six section briefs' filenames, section labels, and needles are permuted relative to one another. Use this table rather than the filenames.

| TSV row | Brief | Section / task | Needle | Output kept as |
|---|---|---|---|---|
| 1 | hf_paper_outline_brief.md | Paper outline (v0) | PAPER-OUTLINE-OK | woven; raw output not retained |
| 2 | hf_paper_related_brief.md | Related systems | RELATED-WORK-OK | woven; raw output not retained |
| 3 | intro_brief.md | Introduction | INTRO-OK | woven; raw output not retained |
| 4 | cites_brief.md | Citation candidates | CANDIDATES-OK | adjudicated; raw output not retained |
| 5 | priorart_brief.md | Prior-art trawl | PRIOR-ART-OK | prior_art_trawl.md |
| 6 | strike_brief.md | Adversarial novelty strike | NOVELTY-VERDICT-OK | novelty_strike.md |
| 7 | hf_probe2.txt | Connectivity probe | (one line; not retained) | none |
| 8 | sec_s2_brief.md | IIIA Mandate layer | SECTION-S3A-OK | sections/sec_s3a.md |
| 9 | sec_s3d_brief.md | IIIB Capability registry | SECTION-S3B-OK | sections/sec_s3b.md |
| 10 | sec_s3b_brief.md | IIIC Constraints and acceptance | SECTION-S3C-OK | sections/sec_s3c.md (quarantined, INC-004) |
| 11 | sec_s3a_brief.md | II Institutions as coordination technology | SECTION-S2-OK | sections/sec_s2.md |
| 12 | sec_s3c_brief.md | IIID Escalation paths | SECTION-S3D-OK | sections/sec_s3d.md |
| 13 | sec_s4_brief.md | IV Implications | SECTION-S4-OK (worker signed IV-IMPLICATIONS-OK; INC-001) | sections/sec_s4_worker_inserted.md |
| 14 | resolve_brief.md | Citation resolution | CITATIONS-RESOLVED-OK | adjudicated into the reference list |
| 15, 16 | probe2_brief.md | Connectivity probe | DISPATCH LANE OK | none |
| 17–19 | review3_A.md, review3_B.md, review3_C.md | Review round 3 | REVIEW3-{A,B,C}-OK | reviews/reviewer_*_r3.md |
| 20–23 | review4_A.md, review4_B.md, review4_C.md (rows 22–23: C, two attempts) | Review round 4 | REVIEW4-{A,B,C}-OK | reviews/reviewer_*_r4.md |
| 24–26 | review5_A.md, review5_B.md, review5_C.md | Review round 5 | REVIEW5-{A,B,C}-OK | reviews/reviewer_*_r5.md |

`review2_common.md` is the shared note prepended to the round-2 reviewer briefs; round 1 and 2 reviews were run outside the instrument and their individual briefs were not retained.

Three things a reader can check here directly: the constraints brief (row 10) asked for the 7/7 needle-hit rate as its worked example and, in its rules line, allowed "concrete examples from a live hub-and-worker system" the worker could not observe, so the INC-004 figures were the worker's own and the licence was the hub's; the round-4 briefs permit exactly one file write each; and the introduction brief (row 3) contains the phrasings "cost-optimal control law" and "the economics re-derive the anatomy" that the second panel later struck from the manuscript. The strike brief (row 6) hands the worker ten candidate papers from the hub's own probe; the strike's job was to confirm, extend, and rate them, not to find them from nothing.

## v2 table (instrument/hf_stats_v2.tsv)

| v2 row | Brief | Task | Needle | Output kept as |
|---|---|---|---|---|
| 1 | probe_v2_brief.md | Live probe of dispatcher v2.3 (2026-10-14) | PROBE-V2-OK | instrument/hf_out/20261014T055409Z_probe_v2_brief_33235.out / .err |

`probe_v2_brief.md` was not retained by the hub; it is reconstructed here from the author's record of the `printf` command that created it (the command is not retained; hub-attested); its size (87 bytes) matches the row's `brief_bytes` and its content is consistent with the retained response. The file carries no in-file marker because one would break that byte check; this row is the marker. The first live attempt (rc 2, wrong CLI switch) was removed by hand before any retention rule existed; see REVISION_LOG v1.7.3 and the dispatcher header.
