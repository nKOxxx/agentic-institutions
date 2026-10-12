# REVIEW ROUND 5, REVIEWER A (Empirical Methods), HOSTILE RE-REVIEW of v1.4.5 (T-kit verification round)

**Manuscript:** DRAFT.md v1.4.5 (HEAD 4c2a622), REVISION_LOG.md, INCIDENT_LOG.md, NUMBER_SNAPSHOT.json, RESULTS.md, part3_math.md, data/t_freeze_2026-10-09T0416.csv (the T-kit), scripts/verify_t.sh, `~/.hermes/scripts/hf_stats.tsv` (24 rows, live), `~/.hermes/state.db` (SELECT-only), git v1.4.3..v1.4.5.
**Role:** unchanged, hostile senior empirical-methods reviewer. Rounds 1–4 scored 4, 5, 6, 7. Every claim below verified this session from raw files and a live DB; nothing taken from REVISION_LOG on faith.
**PRIMARY QUESTION:** Is the T-fix genuinely sound, and does the paper now earn 8+?
**Confidence:** 5/5. All re-derivations and the archive content check run this session against the raw instrument, the verbatim SQL, and the freeze archive.

**Recommendation: ACCEPT-WITH-MINORS. Score: 8 / 10.**

The four-round MAJOR, regime (2)'s T asserted under a false "all measured or bounded" banner and unreproducible (296 → 277 → actual 266), is now genuinely closed and, for the first time, independently verifiable at the content level. I re-derived every cell, ran the verifier, tampered with the archive in two ways, and cross-checked all 343 archived ids against the live DB. The dataset is real, the banner is demoted in the manuscript, the monotone lie is gone, and the sign fix in III.5 is correct. What blocks a 9 are three MINOR residuals, of which the most galling is that the exact banner sentence I have flagged for four rounds still sits verbatim unswept in the companion file part3_math.md, the very round the hub claimed to sweep all files.

---

## T1, DISPOSITION OF MY ROUND-4 FINDINGS

### 1 (MAJOR), T=277 unreproducible (actual 266); banner "all measured or bounded" verbatim; monotone false, **FIXED in the manuscript** (with a companion-file sibling gap, flagged in T2/remaining issues)
The three things I demanded in r4 are done in DRAFT:
- Banner demoted, DRAFT L174, verbatim: `Three regimes: measured, bounded, or asserted-with-receipt (T, see the III.3 receipt):`
- Monotone struck and inverted to the truth, DRAFT L189, verbatim: `NOT monotone: the store -> 343 at the 2026-10-09 04:16 re-freeze (measured live by running the printed query verbatim; the v1.4 freeze printed 277 earlier on 2026-10-08). This count is a FLOOR, not a monotone quantity: the hub's SQLite store compacts`
- T re-frozen to a content-grounded value with an archive, DRAFT L186–188, verbatim: `the hub logged 343 further assistant turns after its first accepted artifact (frozen 2026-10-09 04:16; qualifying id-set archived in-repo, recounted by scripts/verify_t.sh), clearing every threshold`
I verified the archive is not a remembered number: all 343 ids in data/t_freeze_2026-10-09T0416.csv are genuine `messages` rows in session 20260725_131848_6f3bc9c8 with role='assistant' AND timestamp ≥ 2026-10-07 13:18:00 (343/343 exist, all match the III.3 predicate, verified by direct SQL). The old 277 survives in the manuscript only as correctly-framed history (the §III.3 receipt explaining 277→343, and the §IX version-recap L591 `query published, 277 @ freeze`). **No live claim uses 277.**
  - Residual: the banner demotion did NOT propagate outside DRAFT, see T2 (part3_math.md L46) and remaining issue #1.

### 2 (MINOR), §IV.4 "16 serial dispatches, 16/16" stale vs live instrument, **FIXED**
DRAFT L274, verbatim: `The instrument's actual record: 16 serial dispatches at the v1.3 freeze (16/16 first-try needle accepts; the live instrument has since grown, all-OK)`. Now stamped with the freeze time and the live-growth disclosure. Matches the TSV (rows 1–16 all OK).

### 3 (MINOR), "all seven briefs" counts a connectivity probe, **FIXED**
DRAFT L270, verbatim: `all seven dispatches accepted (6 briefs + 1 connectivity probe)`. Probe now named, arithmetic truthful.

---

## T2, SIBLING SWEEP (grep ALL tracked files)

Exact terms requested: `helps`, `277`, `monotone in hub lifetime`, `331`.
- `helps`: REVISION_LOG.md:130 only, the fix descriptor (`III.5 claimed early session death *helps* delegation - backwards`). DRAFT and part3_math now say **hurts** (L230 / part3). No manuscript sibling.
- `277`: DRAFT L189 (historical receipt, framed as the superseded v1.4 freeze) and L591 (version-recap `query published, 277 @ freeze`), both correctly historical, not live claims; NUMBER_SNAPSHOT supplement field (see residual below); INCIDENT_LOG/REVISION_LOG incident records. **No live assertion of 277 in the manuscript.**
- `monotone in hub lifetime`: INCIDENT_LOG.md:84 + REVISION_LOG.md:116 + my own r4 review, incident documentation only. **ZERO in DRAFT.**
- `331`: REVISION_LOG.md:116 only (the v1.4.2 22:01 re-freeze, historical). **ZERO in DRAFT or part3.**

So on the four requested terms: **no stale live-manuscript siblings.**

**BUT**, a same-family stale sibling exists that the sweep missed, and it is the exact banner sentence from my r4 finding #1:
- **part3_math.md L46, verbatim: `Three regimes, all measured or bounded:`**, the precise non-demoted banner I demanded change, still sitting verbatim in the companion math file while DRAFT L174 carries the demoted version. The v1.4.5 commit synced part3's count (343) and sign (hurts) but not its banner. This is a MINOR residual (no result depends on it; both files agree T=343), but it undercuts the hub's "swept ALL files" claim in the exact round meant to close it.
- Residual: NUMBER_SNAPSHOT.json top-level `"frozen": "2026-10-08"` is stale (current T basis is 2026-10-09 04:16), and `supplement_v1_4.t_measurement_count_at_v14: 277` sits unmarked next to the new refreeze fields, so a reader scanning primary fields could take 277 as current. MINOR.

---

## T3, T-KIT AUDIT (centerpiece; I tried to break it)

**(a) Row count:** `wc -l data/t_freeze_2026-10-09T0416.csv` = 344 lines; minus header = **343**. ✓ Matches.

**(b) Verifier:** `bash scripts/verify_t.sh` output:
```
archive recount : 343
PASS: archive == frozen 343 (byte-stable; git-attested)
live store      : 392 (walks by design: ...)
```
Exit 0. Live store now reads **392** (turns have accrued since the 04:16 freeze, disclosed behavior, consistent with the non-monotone receipt).

**(c) TAMPER TEST** (copied repo to /tmp/tamper, no git):
- **Delete one row** (342 rows): `archive recount : 342` / `FAIL: archive != frozen 343`, **exit 1, loud.** ✓ Fails as specified.
- **Alter one value in place** (343 rows, id 34490→99999): `archive recount : 343` / `PASS: archive == frozen 343`, **exit 0, SILENT PASS.** ✗ **The verifier authenticates row COUNT only, not content.** The script never hashes the file nor checks it against the committed git blob; the "byte-stable; git-attested" guarantee lives in the git layer (the CSV is committed at cd46a7e, git status clean), not in verify_t.sh itself. A content-integrity tamper that preserves row count is invisible to the kit's own checker.

**(d) Receipt + snapshot + archive reconciliation (343 @ 2026-10-09 04:16):**
- DRAFT §III.3 receipt: `frozen 2026-10-09 04:16` + `343 rows`. ✓
- NUMBER_SNAPSHOT `supplement_v1_4`: `t_measurement_refreeze_value: 343`, `t_measurement_refreeze_at: "2026-10-09 04:16"`, archive `data/t_freeze_2026-10-09T0416.csv`. ✓ (Filename's `T0416` matches 04:16.)
- Archive: 343 rows, filename T0416. ✓
All four mutually consistent on 343 @ 04:16. (Only the snapshot's top-level `"frozen":"2026-10-08"` date is stale, see T2 residual.)

**(e) Judgment, does this satisfy "true and reproducible" as I defined it in r4?** My r4 demand was: a reviewer-measurable number must match the manuscript's frozen value, under an honest banner, and (per INC-004/005 doctrine) not be a remembered number. In v1.4.5:
- **TRUE:** yes. I independently verified all 343 archived ids are genuine DB rows matching the published III.3 predicate (343/343 present). This is not a recalled constant, the claim is grounded in the store and survives my cross-check. (The one thing I cannot reconstruct is whether exactly 343, not 342/344, existed at 04:16, post-freeze compaction/accrual prevents it, but the margin 343 ≫ 119.5 makes this immaterial.)
- **REPRODUCIBLE:** yes, the id-set archive + recount script + my DB cross-check reproduce 343.
- **The residual weakness is the verifier's cardinality-only check (c)**: content tampering that preserves row count is not caught by the script itself. The honest statement is "content-integrity is git-atomically attested", not "verify_t.sh attestation". This is a MINOR defect in an otherwise sound kit, it does not falsify T, but it is exactly the class of gap a reproducibility kit should not leave open.
Verdict: **the kit satisfies true + reproducible as I defined them, with a MINOR tamper-evidence gap at the script level** (remaining issue #2).

---

## T4, REGRESSION HUNT (~22 dead tokens)

| term | hits in DRAFT | disposition |
|---|---|---|
| 75× / 75x | 0 | CLEAN |
| T ≈ 61 / T≈61 / ≈ 61 | 0 | CLEAN |
| 57/15 | 0 | CLEAN |
| failure probability | 0 | CLEAN |
| 147 briefs | 1 (L271, `a 147-brief, 24-hour, four-concurrent-worker scenario. No such run exists`) | CLEAN, INC-004 withdrawal note, properly quarantined |
| four concurrent | 0 | CLEAN |
| 30-second / 30 second | 0 | CLEAN |
| INTRO-OK / RELATED-WORK-OK / PAPER-OUTLINE-OK / CITATIONS-RESOLVED-OK | 0 | CLEAN |
| v1.1 COMPLETE | 0 | CLEAN |
| cost-optimal control / cost-optimal path | 0 | CLEAN |
| 296 | 0 | CLEAN |
| 40–80 / 40-80 | 0 | CLEAN |
| K = the binding budget / binding budget | 0 | CLEAN |
| reinterpretng | 0 | CLEAN |
| paging | 2 | LEGITIMATE, L99 MemGPT memory-hierarchy; L386 "no paging" (the C3 fix itself) |
| ≈5.9 | 0 | CLEAN ('5.9' hits are ERC-**5192** regex false-positives + L596 "5.9 residue killed" history) |
| α≈0.17 | 0 | CLEAN |
| monotone in hub lifetime | 0 | CLEAN |
| helps delegation / *helps* | 0 | CLEAN (now "hurts") |

**No previously-clean token reappeared; no regression. Regression axis genuinely clean.**

---

## T5, RE-DERIVATION (from raw files; the verifier's independent math)

- **α = 3853/22824 = 0.1688** ✓ (paper's 0.17).
- **Breakeven T = (w/h)/(p(1−α)) − 1 at α=0.17**, all cells correct: p=0.3: 59.24 / 79.32 / 119.48 (paper 59.2 / 79.3 / 119.5 ✓); p=0.5: 35.14 ✓; p=0.7: 24.82 / 33.42 / 50.64 (paper 24.8 / 33.4 / 50.6 ✓).
- **T=40 alive-set:** alive = {p=0.5@15 (35.1), p=0.7@15 (24.8), p=0.7@20 (33.4)}; p=0.7@30 (50.6) and all p=0.3 dead. DRAFT L184 matches exactly. ✓
- **CP 0.025^(1/14) = 0.7684** → [0.768, 1.00] ✓ (abstract's [0.77, 1.00]).
- **1/α endpoints:** 1/0.17 = 5.88, 1/0.19 = 5.26, 1/0.09 = 11.11 (with the disclosed 11.5 at wave-3 0.087); paper range [5.3, 11.1] ✓; hub audit's 5.26/11.11 + 11.5 ✓.
- **III.5 sign logic:** dominance RHS of (★) is p(1+T)(1−α); d/dT = p(1−α) > 0 (0.249 at α=0.1688, p=0.3). A larger T enlarges the right side, making delegation easier to satisfy, so long-lived sessions *help* the paid-lane case and **early death *hurts* it**, exactly as the v1.4.4 fix states and the manuscript now says (L230 `which hurts the paid-lane case`). The sign fix is arithmetically correct.

---

## T6, FABRICATION HUNT (3 quantitative claims in §IV, traced to instrument)

1. **§IV.4: "A 7/7 hit rate in the wave-1 calibration run (all seven dispatches accepted (6 briefs + 1 connectivity probe); the cumulative frozen rate is 14/14, §III.6)."** Trace: hf_stats.tsv rows 1–7 = {outline, related, intro, cites, priorart, strike, hf_probe2} all OK ⇒ 7/7 (6 briefs + probe) ✓; rows 1–14 all OK ⇒ 14/14 ✓. **Provenanced.**
2. **§IV.4: "The 13/13 needle-hit rate in the frozen snapshot (14/14 including the connectivity probe)."** Trace: first-13-brief rows (excluding hf_probe2 at TSV row 7) all OK = 13/13; +probe = 14/14 ✓. **Provenanced.**
3. **§IV.4: "16 serial dispatches at the v1.3 freeze (16/16 first-try needle accepts; the live instrument has since grown, all-OK)."** Trace: TSV rows 1–16 all OK = 16/16 at the v1.3 freeze ✓, correctly stamped. **Provenanced.** Micro-nit (pre-existing, non-arithmetic): the "all-OK" tail is loose against the current 24-row TSV, where two review4_C rows carry verdict TIMEOUT, but those are review dispatches (not brief dispatches), and the 16/16 is explicitly scoped "at the v1.3 freeze," so the claim's arithmetic holds.

Plus the headline **T=343** (from §III.3) traces to the in-repo archive, all 343 ids verified against the live DB (T3e). **No unprovenanced number found in the sample.** Unlike the 296→277→266 chain, 343 survives an independent content check.

---

## VERDICT

**Score: 8 / 10.** Rounds: 4 → 5 → 6 → 7 → **8**.

The decisive MAJOR that capped the score at 7 across three rounds, regime (2)'s T asserted under a false banner and unreproducible, is now genuinely closed and, for the first time, content-verified: the archived 343 ids are real DB rows matching the published predicate, the number clears the worst threshold (343/119.48 ≈ 2.9×) with enormous margin, the manuscript banner is demoted, the monotone lie is struck, and III.5's sign is arithmetically correct ("hurts"). The full quantitative core re-derives to the decimal from raw files, the regression and fabrication sweeps are clean, and all three of my r4 findings are FIXED in the manuscript. This clears the bar my r4 verdict set: "one frozen-value-and-banner fix from being there." They delivered it.

Three MINOR residuals keep it at 8 rather than 9:

1. **MINOR, part3_math.md:46 retains the exact verbatim non-demoted banner `Three regimes, all measured or bounded:`**, while DRAFT L174 carries the demoted version. The companion file the hub edited this very round (syncing its 343 and its sign) kept the sentence I have flagged for four rounds. No result depends on it, but it is a stale sibling of the flagship fix and contradicts the hub's "swept ALL files" claim. Fix: demote it to match DRAFT.
2. **MINOR, verify_t.sh authenticates row count only.** An in-place value tamper (343 rows, id altered) reports `PASS` with exit 0; only row addition/removal fails loudly. Content integrity is delegated to git (the CSV is committed at cd46a7e, clean), not checked by the script. For a kit whose entire purpose is tamper-evident T-freezing, pin a fixed hash (or verify against the committed blob) so the checker itself is content-tamper-evident.
3. **MINOR, NUMBER_SNAPSHOT.json top-level `"frozen": "2026-10-08"` is stale** (current T basis is 2026-10-09 04:16), and `supplement_v1_4.t_measurement_count_at_v14: 277` remains as an unmarked field beside the refreeze, so a reader scanning the primary/supplement fields could take 277 as current. Bump the frozen date and mark 277 as superseded-by-343.

| Dimension | R4 | R5 | Note |
|---|---|---|---|
| Novelty of synthesis | 7 | 7 | unchanged |
| Formal model | 8 | 8 | unchanged; all cells re-derive |
| Empirical support | 6 | 8 | T now true + content-verified; 343 ≫ thresholds; alive-set/CP/median reproduce |
| Internal consistency | 8 | 8 | banner demoted in DRAFT; only part3 banner sibling + snapshot date |
| Instrument quality | 6 | 8 | archive genuine + recountable; verify_t cardinality-only (MINOR #2) |
| Reflexive method | 8 | 8 | INC-006 resolution is the strongest datum |
| Scholarship | 7 | 7 | unchanged |
| Clarity | 8 | 8 | T receipt unusually transparent |
| **Overall** | **7** | **8** | |

**Bottom line:** The measurement I have flagged four rounds is now sound and reproducible at the content level, under an honest banner. That is ACCEPT-WITH-MINORS at 8. The three named MINORs (part3 banner sibling, verify_t's count-only verifier, snapshot date/277 residue) are cosmetic-to-robustness and touch no claimed result; with them swept this is a clean 9.

*All re-derivations run this session against hf_stats.tsv (24 rows), the verbatim §III.3 SQL on ~/.hermes/state.db (SELECT-only), a /tmp tamper-fork of the T-kit, and an independent DB cross-check of all 343 archived ids (343/343 present and predicate-matching), as of 2026-10-09., REVIEWER A, round 5.*

REVIEW5-A-OK
