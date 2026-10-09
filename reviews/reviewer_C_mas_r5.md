# HOSTILE RE-REVIEW ROUND 5 — REVIEWER C (Multi-Agent Systems / Agent-Governance) — T-kit verification round

**Paper:** *Agentic Institutions* (Draft v1.4.5, 2026-10-09)
**Reviewer role:** unchanged from rounds 1-4 — MAS / multi-agent-systems researcher
(mandates, escalation, institutional design). This round's PRIMARY question: with the
round-4 T MAJOR repaired by the v1.4.3 T-kit, does anything still hold the paper below
8 — and is the T-kit itself sound? I verify from raw files and a live tamper test only;
I never trust the paper's claims about itself.
**Materials reviewed (full):** DRAFT.md v1.4.5 (607 lines, 81.1K), my own
reviews/reviewer_C_mas_r4.md, REVISION_LOG.md (through the POST-R4 HUB AUDIT),
INCIDENT_LOG.md (INC-001..INC-006), NUMBER_SNAPSHOT.json, part3_math.md, RESULTS.md,
`data/t_freeze_2026-10-09T0416.csv` (343 rows), `scripts/verify_t.sh`, `sections/*.md`,
`~/.hermes/scripts/hf_stats.tsv` (live, 25 data rows), and `~/.hermes/state.db`
(READ-ONLY, SELECT only).
**Verification method:** every r4 finding re-checked against v1.4.5 bytes with verbatim
line evidence; sibling + regression sweeps run document-wide; the T-kit audited with a
real tamper experiment in a /tmp clone (delete-a-row and alter-a-value-in-place);
the numeric core re-derived in Python; the archive content-verified against state.db
(6/6 sampled ids). The paper dir is under git (HEAD `4c2a622` = v1.4.5); git status
shows only the two in-flight sibling reviews (`reviewer_{A,B}_econ_r5.md`) untracked —
I have written nothing but this file.

---
## T1 — Dispositions of my round-4 findings (each with verbatim v1.4.5 evidence)

My r4 scorecard was 3 issues (1 MAJOR, 2 MINOR) + the T3 residuals I named:

| Finding (r4) | Verdict in v1.4.5 | Verbatim evidence |
|---|---|---|
| **r4 Issue #1** (MAJOR) the published T-measurement query does not reproduce the frozen 277; "monotone in hub lifetime" false; no DB-dependence receipt | **FIXED** | DRAFT L186-189: "the hub logged 343 further assistant turns after its first accepted artifact (frozen 2026-10-09 04:16; qualifying id-set archived in-repo, recounted by scripts/verify_t.sh)"; "NOT monotone: the store -> 343 at the 2026-10-09 04:16 re-freeze …"; "This count is a FLOOR, not a monotone quantity: the hub's SQLite store compacts … so the frozen 277 is not reconstructible." The threshold-clearing conclusion is explicitly insulated ("every measured value of T … clears the largest breakeven threshold (T > 119.5) by a wide margin"). |
| **r4 Issue #2** (MINOR) "wave-1" used for two incompatible groupings (7 dispatches §IV.4 vs 2 dispatches RESULTS Table 1) | **PARTIAL** | DRAFT L270: "A 7/7 hit rate in the wave-1 calibration run (all seven dispatches accepted (6 briefs + 1 connectivity probe); the cumulative frozen rate is 14/14 — §III.6)". The "6 briefs + 1 connectivity probe" clarification is in and correct, but the label "wave-1" still denotes a 7-dispatch group in §IV.4 and RESULTS F2, while RESULTS Table 1's first Wave row is "Drafting (outline+related) \| 2". Same collision as r4. |
| **r4 Issue #3** (MINOR) frozen acceptance headline drifts against a live now-non-OK instrument | **FIXED** | DRAFT L274-275: "16 serial dispatches at the v1.3 freeze (16/16 first-try needle accepts; the live instrument has since grown, all-OK), zero retries, zero escalation events". The "at the v1.3 freeze" stamp is added, resolving the drift I flagged. |

**Net: 2 FIXED / 1 PARTIAL.** The r4 MAJOR — the single gap that capped me at 8 — is
genuinely dead at the content level (see T3: the 343 is a real freeze, archived as raw
ids and content-verified). The only surviving r4 item is the MINOR wave-label taxonomy
collision, which is cosmetic and does not touch any number.

---
## T2 — Sibling sweep (helps / 277 / monotone-in-hub-lifetime / 331)

Grep across DRAFT.md, part3_math.md, RESULTS.md, sections/, NUMBER_SNAPSHOT.json,
INCIDENT_LOG.md, REVISION_LOG.md:

- **`helps`**: ZERO as a live sign claim in DRAFT or part3. DRAFT §III.5 L229-230 now
  reads "sessions die early, which **hurts** the paid-lane case since the inline
  alternative then looks cheaper"; part3_math.md L100 reads identically ("hurts").
  The only `helps delegation`-shaped string is gone. (`helps` survives solely as the
  legitimate cited title "When Agent Governance Helps 2609.05531" in §VIII C5, and as
  the REVISION_LOG L130 fix descriptor quoting the old error. — **clean**.)
- **`277`**: zero *live* claims. It survives only as correctly-framed history: the
  III.3 receipt (DRAFT L189 "277 at the v1.4 freeze … the frozen 277 is not
  reconstructible"), the changelog (L591 "query published, 277 @ freeze"),
  NUMBER_SNAPSHOT `t_measurement_count_at_v14: 277`, and the INCIDENT/REVISION logs.
  No current claim uses 277 as the T magnitude. — **clean as history.**
- **`monotone in hub lifetime`**: ZERO in DRAFT/part3/RESULTS/sections. Appears only in
  INCIDENT_LOG L84 and REVISION_LOG L116 as the record of the struck false clause. — **clean.**
- **`331`**: ZERO in DRAFT/part3; appears only in REVISION_LOG L116 as the historical
  v1.4.2 intermediate re-freeze (331@22:01) that 343@04:16 superseded. — **clean.**

**Verdict: NONE as stale siblings.** All four dead tokens that survive do so as
explicit, correctly-framed historical receipts — which is exactly what the INC-005/006
doctrine requires.

---
## T3 — T-kit audit (the centerpiece — I tried to break it)

**(a) Row count.** `wc -l data/t_freeze_2026-10-09T0416.csv` = **344**; minus header = **343**. ✓

**(b) `bash scripts/verify_t.sh`** (in-repo, on HEAD) returns:
```
archive recount : 343
PASS: archive == frozen 343 (byte-stable; git-attested)
live store      : 392 (walks by design: compaction evicts + turns accrue; ...)
```
exit 0. The live store (392 now, up from 343 at freeze) walking is consistent with the
"NOT monotone / a FLOOR" framing.

**(c) TAMPER TEST (real, in a /tmp clone, clone verified clean first):**
- **Delete one data row** → `archive recount : 342` / `FAIL: archive != frozen 343` /
  **exit 1**. Fails loudly. ✓
- **Alter a timestamp in place, preserving all 343 rows and the byte/line structure**
  (binary replace, 9272→9272 bytes) → `archive recount : 343` / `PASS: archive == frozen
  343 (byte-stable; git-attested)` / **exit 0**. The verifier **does not** detect
  in-place value tampering that preserves the count. The alteration *is* visible to
  git (`M data/t_freeze_2026-10-09T0416.csv`), but `verify_t.sh` itself never checks
  git status or a content hash — its "git-attested" PASS message is not enforced by
  the script. This is a robustness gap in the *tool*, not a falsification of the number
  (the count — the only load-bearing quantity — is still 343 and correct).

**(d) Receipt reconciliation — 343 @ 2026-10-09 04:16 across all three:**
- III.3 receipt (DRAFT L186-189): "the hub logged 343 further assistant turns after its
  first accepted artifact (frozen 2026-10-09 04:16 … archived in-repo …)". ✓
- NUMBER_SNAPSHOT supplement_v1_4: `"t_measurement_refreeze_value": 343`,
  `"t_measurement_refreeze_at": "2026-10-09 04:16"`, `"t_measurement_monotone": false`,
  `"t_measurement_archive": "data/t_freeze_2026-10-09T0416.csv"`. ✓
- Archive filename `t_freeze_2026-10-09T0416.csv`, 343 rows, timestamps 2026-10-08
  06:42:08 → 2026-10-09 00:16:14, all unique ids. ✓
All three mutually consistent.

**(e) Does the kit satisfy "true and reproducible" as I defined it in r4?** YES. I
defined it operationally: the frozen number must be recoverable/attestable, not a
remembered value. The kit goes further than a re-run: it archives the **raw qualifying
id-set** in-repo (git-attested), recounts it by script, and I content-verified the
archive against state.db — 6/6 sampled ids are genuine `messages` rows in session
`20260725_131848_6f3bc9c8`, role='assistant', timestamp ≥ 2026-10-07 13:18 (my spot
check, consistent with reviewer B's full 343/343). The count is therefore true and
reproducible at the data level. The single substantive limitation — `verify_t.sh` is a
cardinality check that does not itself authenticate archive content or enforce the
git-attestation it prints — is a robustness gap in the *verifier tool*, not a failure
of the archive to be true or reproducible (the committed archive + git carry that).

---
## T4 — Regression hunt (~22 dead tokens; DASH/WRAP VARIANT BEWARE)

Across DRAFT.md + part3_math.md + RESULTS.md + sections/ — **all CLEAN except the
section-archive hits below.** The clean list: `75x`, `T ≈ 61` (spaced), `57/15`,
`failure probability`, `four concurrent` (in DRAFT), `30-second` variants, `INTRO-OK`,
`RELATED-WORK-OK`, `v1.1 COMPLETE`, `cost-optimal control` (in DRAFT), `cost-optimal
path` (in DRAFT), `296`, `40–80`/`40-80`/`40‑80`, `K = the binding budget`, `binding
budget`, `PAPER-OUTLINE-OK`, `CITATIONS-RESOLVED-OK`, `(paging`, `≈ 5.9`, `5.9`
(false-positive ERC-**519**2 substrings + the changelog's own "part3 5.9 residue
killed"), `monotone in hub lifetime`, `*helps* delegation`. The `75×` at RESULTS
L40 and `T≈61` at part3_math L52 are correction-trail history. The `147-brief` at
DRAFT L271 sits inside the honest §IV.4 WITHDRAWAL note ("No such run exists in the
instrument"). **Manuscript: CLEAN.**

**The hits — sections/ raw files carry the dead tokens:**
- **sections/sec_s3c.md:60-61: "In a representative 24-hour run across four concurrent
  worker agents, our hub dispatched 147 briefs. … The overall needle-hit rate across
  all categories was 142/147, with 5 misses attributable to worker-side deserialisation
  errors …"** and L53 "acceptance windows (typically 30 seconds)". This is the **entire
  INC-004 worker-fabricated worked example** — 147 briefs / 142/147 / four concurrent /
  24-hour / 30-second windows — surviving **verbatim** in a git-tracked file that
  sections/assembly_log.md:18 labels a **"post-clean copy"** ("Archives:
  sections/sec_*.md = post-clean copies"). The fabricated scenario is present as if it
  were the institution's record.
- **sections/sec_s3a.md:15** "It is a **cost-optimal control law for delegated
  cognition**" and **:27** "the agent reinterpretng its task" (typo); **sec_s3d.md:17**
  "institution's cost-optimal path given verification-bandwidth constraints";
  **sec_s4_worker_inserted.md:3** "If institutions are cost-optimal control laws". These
  are pre-correction raw drafts. `sec_s4_worker_inserted.md` is the explicitly-quarantined
  INC-001 block (archival, defensible); but sec_s3a/s3c/s3d are labelled "post-clean
  copies" yet are not clean.

This matters for this round specifically: INCIDENT_LOG INC-004 and REVISION_LOG both
assert these strings are "ABSENT document-wide" (gate), and assembly_log asserts the
section copies are "post-clean." Both assertions are **false for the repo as a whole**:
the exact fiction INC-004 repudiates is sitting in a git-tracked file a
provenance-following reader (the very audience the T-kit round is audited for) would
open. It never reaches the manuscript or any number, but it is INC-004 re-surfacing at
the archive layer.

---
## T5 — Re-derivation (raw arithmetic) and the III.5 sign

- **α = 3853/22824 = 0.1688.** Breakeven table at the stated α=0.17 reproduces exactly
  cell-for-cell: T=(w/h)/(p·0.83)−1 → p=0.3: 59.2/79.3/119.5; p=0.5@15: 35.1; p=0.7:
  24.8/33.4/50.6; integer ceilings 60/80/120, 36, 25/34/51 — all ✓ (my python: matches
  to 0.1 at α=0.17; the raw-α 0.1688 gives 119.3 for the last cell, which is why the
  table correctly states "at α = 0.17" and the hub audit separately states 0.1688 —
  internally consistent).
- **T=40 alive set:** alive {p=0.5@15 35.1, p=0.7@15 24.8, p=0.7@20 33.4}; dead {0.7@30
  50.6, all p=0.3} — re-derived exactly. ✓
- **CP:** 0.025^(1/14) = **0.7684** ✓ (abstract "[0.77, 1.00]").
- **1/α endpoints:** 1/0.19=5.26, 1/0.09=11.11; exact min α=0.087 → 11.5 (disclosed);
  central 1/0.1688=5.92≈"≈6×". Abstract L26 "[5.3, 11.1] … ≈6× … endpoints use
  wave-rounded α = 0.19/0.09 — exact min α = 0.087 gives 11.5" — all consistent. ✓
- **III.5 sign logic:** (★) RHS = p(1+T)(1−α) ⇒ d(RHS)/dT = p(1−α) > 0. Early session
  death = smaller T = smaller RHS = delegation *less* likely to dominate = the paid-lane
  (paid-worker delegation) case is **hurt**. The manuscript's corrected clause — L230
  "sessions die early, which **hurts** the paid-lane case since the inline alternative
  then looks cheaper" — has the **correct sign**, as does part3_math L100. The hub's own
  audit (REVISION_LOG L130, d(dominance)/dT = p(1−α) > 0) agrees. The earlier
  "helps"-error is genuinely fixed and monotone-consistent (no reintroduced monotonicity
  claim).

---
## T6 — Fabrication hunt (3 quantitative claims in IV/V traced to the instrument)

- **Claim A — §IV.4 L270 "7/7 hit rate in the wave-1 calibration run (all seven
  dispatches accepted (6 briefs + 1 connectivity probe); the cumulative frozen rate is
  14/14 — §III.6)".** Trace: hf_stats.tsv rows 2-8 = outline, related, intro, cites,
  priorart, strike (6 briefs) + hf_probe2.txt (connectivity probe), all verdict=OK →
  **7/7 (6 briefs + 1 probe) consistent. Grounded.** No fabricated number.
- **Claim B — Abstract "produced the manuscript across 14 instrumented dispatches …
  p̂ = 14/14 via machine-checkable needles".** Trace: hf_stats.tsv rows 2-15 (the
  2026-10-07 frozen session) = exactly 14 dispatches, all verdict=OK →
  **14/14 consistent. Grounded.**
- **Claim C — §IV.4 L274-275 "16 serial dispatches at the v1.3 freeze (16/16 first-try
  needle accepts … zero retries, zero escalation events)".** Trace: at v1.3 freeze the
  TSV held 16 data rows (14 frozen + 2 post-freeze probes, rows 2-17), all OK, each
  brief once → **16/16, zero retries consistent**; matches INCIDENT_LOG INC-004 exactly.
  **Grounded.**
No unprovenanced number found in §IV/§V. The 2×/185× asymmetries trace to
NUMBER_SNAPSHOT + RESULTS F3 with the §III.6 window caveat; §V is qualitative. The one
thing I could not re-derive from the TSV alone is the wave-level α (admitted-char
logging only began 2026-10-08), but that is explicitly declared in RESULTS F1 /
snapshot, not fabricated.

---
## T7 — Verdict

**Score: 8/10.** Round trajectory: 4 → 5 → 8 → 8 → (this) 8. **Recommendation:
ACCEPT-WITH-MINORS.**

**Does anything hold the paper below 8?** The only thing that held it at 8 (not 9) in
r4 — the T MAJOR — is **genuinely fixed**, and the T-kit is sound: the count is true
(343 rows, content-verified against state.db), reproducible (in-repo git-attested
archive, recountable by script), and the delete-tamper fails loudly. So the r4 cap is
lifted. What keeps me at 8 rather than 9 is not a MAJOR but a set of MINORs — most
substantively, the INC-004 fabricated worked example surviving verbatim in the
git-tracked, "post-clean"-labelled section archive (sec_s3c.md), and the verifier's
cardinality-only gap. Neither reaches the manuscript or any headline number; neither is
a BLOCKER; neither is a number-fabrication in the paper. On the paper's own INC-004
doctrine the archive sibling is worse than cosmetic (that doctrine says such strings
are "ABSENT document-wide"), which is why I cannot call it nothing — but it does not
force the paper below ACCEPT.

**Remaining issues (≤3, severity-tagged):**

1. **MINOR (borders MAJOR under INC-004 doctrine) — the INC-004 fabricated worked
   example survives in the tracked section archive.** sections/sec_s3c.md L60-61 still
   carries the full worker-fabricated scenario — "In a representative 24-hour run across
   four concurrent worker agents, our hub dispatched 147 briefs. … The overall needle-hit
   rate across all categories was 142/147" — plus L53 "acceptance windows (typically 30
   seconds)"; and sec_s3a.md retains "cost-optimal control law" (L15) and the
   "reinterpretng" typo (L27), sec_s3d.md "cost-optimal path" (L17). assembly_log.md:18
   calls these "post-clean copies," and INC-004 asserts the strings are absent
   document-wide — both false for the repo. **Fix:** quarantine/re-annotate the raw
   section files (as was done for sec_s4_worker_inserted.md), correct the "post-clean
   copy" label, and extend the absence-gate to sections/.

2. **MINOR — verify_t.sh authenticates only cardinality, not content.** I altered a
   CSV timestamp in place (343 rows, byte-count preserved); `verify_t.sh` printed
   "PASS: archive == frozen 343 (byte-stable; git-attested)" and exited 0. The change is
   caught by `git status` but not by the script that claims "git-attested." **Fix:** have
   verify_t.sh hash the archive against a stored SHA-256 and/or verify `git status` /
   `git diff --quiet` on the CSV before PASS.

3. **MINOR (bookkeeping pack):** (a) the r4 wave-label collision persists — §IV.4/F2
   "wave-1 calibration run" = 7 dispatches vs RESULTS Table 1 wave-1 "Drafting
   (outline+related) | 2"; (b) the DRAFT "NEXT STEPS — STATUS" changelog (L587-607,
   header "updated 2026-10-08") is stale — it lists v1.4.1 as latest and omits v1.4.2,
   v1.4.3 (T-kit), v1.4.4 (sign fix), v1.4.5, INC-006, and the 343 re-freeze entirely;
   (c) NUMBER_SNAPSHOT top-level `"frozen": "2026-10-08"` is stale vs the 2026-10-09
   04:16 T re-freeze, and `supplement_v1_4.t_measurement_count_at_v14: 277` sits unmarked
   beside the refreeze fields.

None is a BLOCKER. The paper's two load-bearing claims survive hostile re-derivation
this round: the breakeven/CP/alive-set/1-α arithmetic is machine-correct (T5-clean),
and the headline empirical constant T is now **true and reproducible** at the data
level — the r4 MAJOR is dead and the T-kit accomplishes exactly the INC-005/006
doctrine ("a measurement is a query + its provenance, never a remembered number") by
archiving the ids themselves rather than a remembered count.

---
REVIEW5-C-OK
