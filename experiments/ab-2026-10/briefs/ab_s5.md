TASK: Draft one section of SUPPLEMENT.md for the companion repository of the paper "Agentic Institutions" (Stojanow, 2026). Section title: "The build gate and INC-007". Length 400 to 700 words. Audience: a reader who wants to reproduce the record. Plain prose, no headings below the title, no bullet lists, no citations, no code blocks.

RULES: Use only the fact sheet below. Do not invent any number, name, date, file, commit or incident. Do not restate the fact sheet line by line; write it as a section a reader can follow. If a fact is missing, say what is missing rather than fill it. Do not write any file; return the text only.

FACT SHEET (use only these facts; do not add numbers, names, dates or commits that are not here):
- Table 1's wall-clock total was printed as 860 in one revision. The four per-wave maxima are 43, 109, 525 and 163 seconds, which sum to 840. The 860 was an arithmetic error in a reviewer's text, repeated in the review chair's required-change list, that the author copied into the table without recomputing it (incident INC-007).
- Fix: the PDF build script now runs scripts/check_table1.sh, which recomputes every instrument-derived Table 1 cell (per-wave bytes, wall maxima, the 840 total, the resolver row) from the instrument table and fails the build on any mismatch. The locale is pinned so number formatting is stable.
- The gate covers instrument-derived cells only. The hub-audited cells (dispatch count N, admitted characters, admitted fraction) cannot be recomputed by any reader because they come from the hub's private store, and those are the cells that have failed most often.
- Lesson recorded in the incident log: a reviewer's number is a provenance lead, not provenance; the author re-derives from the files every time. Two later addenda record four more reviewer-supplied sentences transcribed without recomputation, including a per-brief range stated over twelve briefs that was true of ten.
- A later revision log entry claimed a dispatcher-header sentence that the committed file did not contain; caught by three reviewers opening the file; recorded as an addendum to INC-003 (a post-state asserted from the fix list, not from the diff). Rule: every revision-log line is checked against the diff before the tag.

End with exactly: AB-S5-OK
