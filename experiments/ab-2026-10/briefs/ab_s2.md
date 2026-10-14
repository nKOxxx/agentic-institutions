TASK: Draft one section of SUPPLEMENT.md for the companion repository of the paper "Agentic Institutions" (Stojanow, 2026). Section title: "The frozen turn count T". Length 900 to 1,400 words. Audience: a reader who wants to reproduce the record. Plain prose, no headings below the title, no bullet lists, no citations, no code blocks.

RULES: Use only the fact sheet below. Do not invent any number, name, date, file, commit or incident. Do not restate the fact sheet line by line; write it as a section a reader can follow. If a fact is missing, say what is missing rather than fill it. Do not write any file; return the text only.

FACT SHEET (use only these facts; do not add numbers, names, dates or commits that are not here):
- T is the number of hub turns after the first worker artifact, used as the horizon term of the delegation condition.
- The hub's message store compacts: superseded turns are evicted and rewritten, so a live count walks. On 14 October 2026 the same query returned 1,046 rows against the frozen 343.
- The frozen basis is an archive, data/t_freeze_2026-10-09T0416.csv, of 343 row ids and timestamps, taken at commit cd46a7e, authored 2026-10-09 04:16 +04 (00:16 UTC). Its SHA-256 is 5572cf45f6c551739a4e7ed5afabebaf45f40deae28c27b85f0eafcd55eb4258. scripts/verify_t.sh recounts the archive and checks the hash.
- Of the 343 rows, 122 share one of four second-resolution timestamps on 2026-10-08 (48, 18, 26 and 30 rows at 08:46:41, 14:13:40, 15:21:55 and 17:42:43 UTC), with ids stepping by two inside each burst. No model emits 48 turns in one second; these are inferred to be compaction rewrites. scripts/dedup_t.sh removes them, leaving 221 distinct turns. No timestamp is shared by two, three or four rows.
- The archive carries only id and timestamp; the store columns that would confirm the inference (role, active flag, finish reason) are not public.
- An earlier anchor for the query (277) was carried from a reviewer footnote without verification; two reviewers re-running the published query got 266 (incident INC-006). The refreeze to 343 followed.

End with exactly: AB-S2-OK
