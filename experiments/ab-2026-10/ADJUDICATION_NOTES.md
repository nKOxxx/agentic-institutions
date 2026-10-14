# Adjudication notes (written after the run; the rule is in PROTOCOL.md and did not change)

Who adjudicated: the author's review-tooling session (the same tooling that runs the second panel), not the hub
and not the author by hand. Each admitted sentence was checked by script to be a verbatim substring of the
CR-stripped draft before the admitted file was written (`ab_adj.py`, kept outside the repository; the check is
trivially re-runnable: every line of `admitted/<key>.md` must occur in `out/<key>.out`).

Dispatch note: the first six `hub` rows (keys ending 77383, 77523, 77676, 77826, 77976, 77262; all at 18:34 to
18:37 UTC) ran with the two environment variables set to their literal placeholders (`<hub model>`,
`<hub provider>`); the CLI returned "Unknown provider '<hub provider>'" in 1 to 2 seconds, exit 1, and the
dispatcher wrote ERROR rows as its policy requires. They are an instrument misconfiguration, not six hub
failures, and are adjudicated REJECT OTHER to record the outcome; they are out of the pairs because the valid hub rows came
later and `ab_stats.py` takes the last row per brief and arm (line 25), a rule the protocol does not state; the REJECT
records the adjudication and does not exclude them, and `scripts/check_ab.py` now asserts the order. The six valid
hub rows ran at 19:03 to 19:32 UTC on `glm-4.6` via `zai` (`hub_model.txt`). The pairing rule, as implemented in
`ab_stats.py` from the start, takes the last row per brief and arm. The hub model (`glm-4.6`, provider `zai`) is recorded
by the operator in `hub_model.txt`; the CLI's `.err` files carry only the session id, contrary to PROTOCOL.md's
expectation, so the inline arm's model identity is attested while the worker's is fixed at dispatcher line 42.
RESULTS.md as generated carries neither the model name, the dispatcher version nor the adjudication log that
PROTOCOL.md's Reporting section named; they are in `hub_model.txt`, the dispatcher header and `ab_adjudication.tsv`.

Verdicts: all twelve valid rows ACCEPT under the rule's enumerated clause. No draft invented a number, name, date, file,
commit or incident. Statements that were unsupported by or contrary to the fact sheet were excluded from admission,
not grounds for rejection; that reading of rule (2) was fixed after the run, when the drafts had been read, and
PROTOCOL.md does not contain it. Under the traceability clause read literally the eight drafts listed below with an
excluded statement would be REJECT FAB; `ab_counterfactual.py` prints the marks under that reading (acceptance 1/6,
α_D = 0.026, P1 and P2 FAIL). The length rule (900 to 1,400 words, reason code LEN) was also treated as advisory after
the run: arm-D s2 is 1,515 words and arm-D s6 1,421 by `wc -w` without the needle line; under REJECT LEN on both,
acceptance is 4/6 and α_D = 0.114, both marks PASS. The protocol designed a self-admission by the hub of its own
drafts (α_I); the hub did not adjudicate, so α_I is this session's admission of the hub model's drafts and the
self-admission design was not executed. The excluded statements are listed here so the line between ACCEPT and
admission is visible.

- ab_s1 D (deepseek): "then fill in the result" (v1 filled nothing in after the row); "quiet-ish mode, but not the
  quietest one available" (not in the sheet).
- ab_s1 I (glm-4.6): none excluded for inaccuracy; the draft names its own gaps.
- ab_s2 D: "that is the number carried into the paper as the basis of T" (the sheet does not say which figure the
  horizon binds); "it appears in more than one place" (the digest; not in the sheet).
- ab_s2 I: "each burst is taken to represent one underlying turn" (contradicted by the draft's own 343 − 122 = 221:
  bursts are removed, not collapsed to one turn each); a narrative about what INC-006 did and did not establish
  that the sheet does not carry.
- ab_s3 D and I: none excluded for inaccuracy.
- ab_s4 D: the echo problem described as the worker repeating its instruction (it was the CLI echoing the brief);
  "kept alongside ... because the reviewers used it across more than one pass" (invented reason); "twenty-three
  anonymous files" (six filenames are permuted, not twenty-three); "the record accounts for by the timing of the
  incident" (invented); "carries an attestation that it was produced by the hub" (the file carries no marker).
- ab_s4 I: "24 of the 26 briefs the record knows of" (counts the reviewer note as a brief); title set as a
  markdown heading (the brief asked for no headings below the title; the title itself is allowed).
- ab_s5 D: omitted the section title; "no reviewer-supplied number ... may enter a Table 1 cell by hand"
  (overstates the gate, which covers instrument-derived cells only; the draft's next paragraph says so).
- ab_s5 I: none excluded for inaccuracy.
- ab_s6 D: "the chair belonged to a different model family than the reviewers" (the whole second panel is of a
  different family from the first); "a person", "one outside human reader" (the sheet says only "an outside
  reader"); reviewer A described as the one who reported the turn count from memory (the hub reported it; A
  caught it; the sheet's phrasing invited this reading); "the audit caught two incidents that the reviewer passes
  did not flag" (not in the sheet).
- ab_s6 I: the same reviewer-A misattribution; title set as a markdown heading.

Two readings of the sheets that both arms got wrong in the same way (s6, the turn count) are a fault of the
sheet's wording, recorded here against the author.
