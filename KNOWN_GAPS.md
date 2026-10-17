# Known gaps

Items raised by a reviewer that are not false statements and not wrong numbers, and that therefore do not trigger a version. Rule adopted at v1.10.1 (REVISION_LOG): a new version is cut only for a sentence that is false of the record or a number that does not recompute. Everything here stays open until someone does the work; the paper does not promise it.

From cold-read round 8 (2026-10-17, artifact lane unless noted):

1. `scripts/check_table1.sh` is a presence check. A changed Table 1 cell passes if the same number occurs elsewhere in DRAFT.md. Cell-anchored checking, and gates for the abstract's 0.137 and "2.0 to 3.7" and for the section 3.3 and 3.4 numbers, are not written. Test: change one Table 1 cell in a copy of DRAFT.md and run the script.
2. `instrument/hf_dispatch.sh`: a BUDGET of 0 or a non-number cancels the wall-clock alarm; a failed append to the `.pending` file still prints "row appended" and exits 0; a timeout does not kill the worker's grandchildren. Test: stub the CLI and run the three cases.
3. `instrument/test/test_gate.sh` re-implements the gate rather than invoking `hf_dispatch.sh`; its fixtures are generated, not captured from the CLI. A test that runs the dispatcher against a stub CLI, and one captured real `-Q` transcript, are not in the repository.
4. Data handling: the paper does not state what the third-party gateway retains, and `instrument/hf_paper_stats.py` opens the message store read-write (`sqlite3.connect` without `mode=ro`). "SELECT only" for reviewers is an instruction, not an enforcement.
5. Pre-13-October timestamps: tags through v1.10 are lightweight; v1.10.1 is annotated but not signed; commit dates before the repository was created on GitHub (13 October 2026) rest on the author's clock (stated in section 3.8 from v1.10.1). Signed tags and a third-party archive snapshot (Software Heritage or Wayback) of v1.8.4 are not made.
6. Portability: `latex/build.sh` needs Menlo at a macOS path and an `en_US.UTF-8` locale; pandoc and tectonic versions are not pinned.
7. Licence: the Zenodo record's licence field is CC BY 4.0 for the whole deposit, while the code inside the snapshot is MIT; the split is stated in README (the licence line) and LICENSE inside the snapshot, not in the record's metadata.
8. `NUMBER_SNAPSHOT.json` has been edited in place across 13 commits (README, v1.10.1, no longer calls it frozen). An append-only or per-version snapshot layout is not adopted.
9. (provenance lane) The abstract's "what held was a reproducible record and independent recomputation from it" (DRAFT.md line 5) is scoped to "every number incident" in section 8 (line 401) but not in the abstract itself.
10. (provenance lane) Reviewer personas recur between warm and cold rounds (Table 1 caption, v1.10.1, says so). Rounds with fresh personas have not been run.
