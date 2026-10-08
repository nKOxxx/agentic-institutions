# REVIEW ROUND 4 — REVIEWER A (Empirical Methods), HOSTILE RE-REVIEW of v1.4.1 (impact-assessment round)

**Manuscript:** DRAFT.md v1.4.1 (2026-10-08, 79,592 chars) + REVISION_LOG.md, INCIDENT_LOG.md, NUMBER_SNAPSHOT.json, RESULTS.md, part3_math.md, stats_live.md, `~/.hermes/scripts/hf_stats.tsv` (19 rows: 16 pre-freeze + 3 round-3 review dispatches), `~/.hermes/state.db`, git (4f7b8e8 v1.4 baseline → 420beaa v1.4.1 residual sweep → 06e9193 III.6 window caveat).
**Role:** unchanged — hostile senior empirical-methods reviewer. Rounds 1–3 scored 4, 5, 6. This round is an IMPACT-ASSESSMENT: how many of my r3 findings genuinely died, at what severity, and what regressed? Verified from raw files; nothing taken from REVISION_LOG on faith.
**Confidence:** 5/5. Every re-derivation below run this session against hf_stats.tsv, state.db, and the verbatim published SQL.

**Recommendation: MINOR REVISE. Score: 7 / 10.**
The mechanical and minor findings I raised in r3 are genuinely dead (T=40 alive-set now correct; F1 provenance + F2 wave-label + 185×/part3 residues all closed; RESULTS revision-controlled; needle signatures gone). The full breakeven surface, the T=40 alive set, the Clopper–Pearson bound, and the median all re-derive correctly from raw files. **But the one substantive methods finding I have now flagged THREE consecutive rounds — that regime (2)'s T is asserted rather than measured — still fails reproduction in v1.4.1.** The hub published a reproducible SQL query (a genuine transparency improvement), yet running it verbatim returns **266, not the frozen 277**, and the manuscript's own parenthetical "monotone in hub lifetime" is empirically false (the count went DOWN below the freeze). The very banner sentence I twice required to change — "Three regimes, all measured or bounded" (L174) — is verbatim unchanged for a fourth round. This is the same defect class (INC-003/INC-005 family) wearing its third specific figure (296 → 277 → actually 266).

---

## T1 — DISPOSITION OF MY ROUND-3 FINDINGS

Verdicts on each finding I raised in round 3 (including residuals I named inside tables). One verbatim v1.4.1 quote each.

### 1 (MAJOR, carries r3→r2→r1) — T asserted under "all measured or bounded"; specific figure unreproducible — **PARTIAL (still not reproduced)**
The r3 demand had two parts: publish the query as a reproducible SQL in the manuscript, AND demote the banner. v1.4.1 delivers the first half and fails the second half, and the published query's own output contradicts the figure it is cited to support.
- The query IS now published, verbatim (L189): `sqlite3 ~/.hermes/state.db "SELECT COUNT(*) FROM messages WHERE session_id='20260725_131848_6f3bc9c8' AND role='assistant' AND timestamp >= strftime('%s','2026-10-07 13:18:00');" -> 277 at v1.4 freeze (monotone in hub lifetime)`
- **I ran that exact query this session: it returns 266, not 277.** Further, all 267 assistant messages on 2026-10-07 in that session finished at 10:00:56 (well before the 13:18 artifact), so the entire returned count of 266 is composed of 10-08 messages; zero of the count comes from the artifact day itself, and the count is BELOW the claimed 277 freeze. "monotone in hub lifetime" is therefore false on the live record — the published query is (a) not returning 277 and (b) not monotone as claimed.
- The banner I twice flagged is verbatim (L174): `Three regimes, all measured or bounded:` — unchanged, fourth round.
- INCIDENT_LOG INC-005 (L76) states the paper's own doctrine: `a measurement is a query + its provenance, never a remembered number`. The manuscript now has the query but the frozen number is not what the query yields; the doctrine is violated in the very round meant to close it.

### 2 (MINOR) — §III.3 T=40 parenthetical wrong twice — **FIXED**
V1.4.1 verbatim (L184): `(ceilings — strict inequality; at T=40 the alive rows are p=0.5@w/h=15 (35.1), p=0.7@15 (24.8), p=0.7@20 (33.4) — p=0.7@30 (50.6) and all p=0.3 rows are dead)`. I re-derived every cell (T3a): exactly {p=0.5@15, p=0.7@15, p=0.7@20} are alive at T=40, p=0.7@30 and all p=0.3 dead. Correct on both counts I flagged.

### 3 (MINOR) — declared-provenance residue (three sub-items) — **FIXED**
- (a) per-dispatch α not TSV-recomputable, say it plainly: RESULTS F1 PROVENANCE (L21–28) now states `α is hub-audited at wave level and is NOT per-dispatch TSV-recomputable for the frozen waves.` Explicit next to the data, not only in the provenance note.
- (b) 186× vs 185×: stats_live.md L11 now reads `frozen manuscript values (v1.1 freeze): 2× / 185× — the live ratio drifts upward … (int-truncated)`; live is 188× with the frozen/discipline framing. The 186× discrepancy is gone; DRAFT → §III.6, abstract, and RESULTS F3 are all consistently 185× with the window caveat (L244–248).
- (c) part3 "40–80 turns" echo: `grep '40–80' part3_math.md` → 0; part3 L57 now carries the 277-with-query pointer. Killed.
- (d) F2 not wave-labeled: RESULTS F2 (L30) now reads `Acceptance needles (wave-1 calibration; cumulative frozen rate 14/14 — see §III.6)`. Labeled.

### Residual I named inside r3's R2-6 table — RESULTS not revision-controlled — **FIXED**
RESULTS L1 now states `RESULTS is revision-controlled from v1.4 (paper dir under git; commit 4f7b8e8 carries the F2 wave label + F1 provenance note)`. Git log confirms 4f7b8e8 (v1.4 baseline) → 420beaa (v1.4.1) → 06e9193 (III.6 caveat). 3 commits, real history.

### Residual I named inside r3's R2-5 table — PAPER-OUTLINE-OK / CITATIONS-RESOLVED-OK — **FIXED**
`grep` for both strings in DRAFT.md → 0 hits (see T4). The two acceptance-needle signatures I flagged as surviving in the frozen appendices are gone from the shipped manuscript.

---

## T2 — IMPACT SCORE

**Findings killed by severity:**
- BLOCKERs: none existed in my r3 set.
- MAJOR: **0 fully killed; 1 PARTIAL.** The T-measurement (my r3 issue #1) is NOT closed — value still unreproducible (266≠277), banner verbatim, monotone claim false. It is PARTIAL only in the transparency sense (a reproducible query now exists in the manuscript).
- MINORs: **all fixed.** T=40 alive-set, F1 α-provenance, 186× drift, part3 echo, F2 wave-label, RESULTS revision-control, appendix needle signatures.

**Regressions (previously-clean text that v1.4/1.4.1 broke):** **NONE.** Full regression hunt (T4) is clean; the only `paging` hits are the legitimate MemGPT memory-hierarchy description (L99) and the C3 fix itself (`O(1) window, no paging`, L386). No previously-correct cell, sentence, or figure was damaged by the residual sweep.

**Does the score move?** Yes — and this is the crux. The r3→v1.4.1 delta kills every MINOR and mechanical finding, so the floor rises. But the single MAJOR survives substantively into a fourth round, so the ceiling stays capped below ACCEPT. Net: 6 → 7. The 2-point-from-last-round is fully attributable to the closed minor/mechanical work; it does NOT clear the persistent measurement defect.

---

## T3 — RE-DERIVATION FROM RAW FILES (never from the paper's claims)

**(a) Breakeven T at α=0.17 via T=(w/h)/(p·(1−α))−1 — all cells correct, including the corrected alive set.**
- p=0.3: 15/(0.3·0.83)−1 = **59.24** ✓ (59.2); 20 → **79.32** ✓ (79.3); 30 → **119.48** ✓ (119.5).
- p=0.5: 15 → **35.14** ✓ (35.1).
- p=0.7: 15 → **24.82** ✓ (24.8); 20 → **33.42** ✓ (33.4); 30 → **50.64** ✓ (50.6).
- Ceilings (60/80/120; 36; 25/34/51) all strict-inequality-correct. T=40 alive set verified above (T1 #2). **T=40 claim: CORRECT.**
- The "T=40 session keeps alive-set" claim (L184) is now right; this was wrong in v1.3.

**(b) T-measurement — run the query printed in §III.3 verbatim against ~/.hermes/state.db.**
Result: **266.** The paper's frozen value is **277** (in DRAFT §III.3 L186–189 and NUMBER_SNAPSHOT.json `supplement_v1_4.t_measurement_count_at_v14 = 277`). **Mismatch: 266 ≠ 277.** Additionally: the 10-07 assistant-message time-range in that session is 06:21:30→10:00:56 — i.e. every one of that day's 267 assistant messages predates the 13:18 artifact — so the published query's returned 266 is entirely composed of 10-08 messages, and 0 of it is "after the first accepted artifact" on the artifact day. The paper's "monotone in hub lifetime" is contradicted (277 frozen → 266 live). **NOT reproduced.**

**(c) CP bound 0.025^(1/14).** ln(0.025)/14 = −0.26349 → e^−0.26349 = **0.76836** → [0.768, 1.000]. Abstract's "[0.77, 1.00] at n=14" ✓ correct.

**(d) Median duration from hf_stats.tsv.** I used the **n=14 pre-freeze rows** (durations {37,43,24,109,479,525,7,24,25,25,25,26,163,234}); sorted, even-n median = (26+37)/2 = **31.5 s**, range 7–525 ✓ matches §III.6 (L241, "median 31.5 s (frozen at the v1.2 snapshot, n=14)"), RESULTS, and NUMBER_SNAPSHOT. (All-19 median would be 37; the paper correctly freezes n=14. As of the live stats, p50=37 is the running value with a timestamp — policy-consistent.)

---

## T4 — REGRESSION HUNT (grep DRAFT.md)

| term | hits | disposition |
|---|---|---|
| 75× | 0 | CLEAN |
| T ≈ 61 / T≈61 | 0 | CLEAN |
| 57/15 | 0 | CLEAN |
| failure probability | 0 | CLEAN |
| 147 briefs | 0 | CLEAN (only in the honest INC-004 withdrawal note, correctly disposed) |
| four concurrent | 0 | CLEAN |
| 30-second windows / 30 second | 0 | CLEAN |
| INTRO-OK | 0 | CLEAN |
| RELATED-WORK-OK | 0 | CLEAN |
| v1.1 COMPLETE | 0 | CLEAN |
| cost-optimal control law | 0 | CLEAN |
| cost-optimal path | 0 | CLEAN |
| 296 | 0 | CLEAN (replaced by 277, which itself fails reproduction — see T1/§1) |
| 40–80 / 40-80 | 0 | CLEAN |
| K = the binding budget | 0 | CLEAN |
| reinterpretng | 0 | CLEAN |
| PAPER-OUTLINE-OK | 0 | CLEAN |
| CITATIONS-RESOLVED-OK | 0 | CLEAN |
| paging | 2 | LEGITIMATE: L99 MemGPT memory-hierarchy description; L386 "no paging" (the C3 fix itself — correct, not a regression) |
| ≈5.9 / 5.9× / 5.9-7.1 | 0 | CLEAN |
| ≈5.9 at α≈0.17 | 0 | CLEAN |

`cost-optimal` survives only as the correctly-scoped "cost-optimal *argument for delegation*" (IV.4 L270) and the "cost-rationalized, not yet derived as optimal" escalation-policy phrasing (IV.5 L284) — both already demoted in v1.4. **No regression found. Genuinely clean on this axis.**

---

## T5 — FABRICATION HUNT (3 quantitative claims in §IV/§V, traced to instrument)

1. **§IV.4: "A 7/7 hit rate in the wave-1 calibration run (all seven briefs accepted; the cumulative frozen rate is 14/14 — §III.6)."** Trace: TSV rows 1–7 (pre-freeze) all carry verdict OK ⇒ 7/7 ✓; first 14 rows all OK ⇒ 14/14 ✓. **Provenanced.** (Carried micro-nit: row 7 is hf_probe2.txt, a connectivity probe — "all seven *briefs*" is loose for 6 briefs + 1 probe; the arithmetic itself holds.)
2. **§IV.4: "The instrument's actual record: 16 serial dispatches, 16/16 first-try needle accepts, zero retries."** Trace: the TSV has **19 data rows now** (16 pre-freeze-ish + 3 round-3 review dispatches, all OK, zero retry rows). The printed "16/16" is the v1.3-era frozen record and is **not value-stamped in-body** as a frozen quantity — at this revision the live count is 19/19. This is staleness, not fabrication: every row that exists is OK. **Arithmetic provenanced; label the "16" as frozen-in-v1.3 (it now trails the live instrument).**
3. **§IV.4: "The 13/13 needle-hit rate … (14/14 including the connectivity probe)."** Trace: first 13 true brief rows (excluding hf_probe2.txt at TSV row 7) all OK = 13/13; including the probe row = 14/14 all OK. **Provenanced.**
4. **§III.3 / abstract (the killer): "the hub logged 277 further assistant turns after its first accepted artifact … reproducible query … -> 277."** **FLAG — the verbatim published query returns 266, not 277**, and the 10-07 message window in that session ends at 10:00:56 (before the 13:18 artifact), so the count is 10-08-only. The frozen figure and its monotonicity claim do not survive the paper's own published query. **Unreproduced** — same class as INC-003/INC-005, now its third figure.

No wholly new unexplained fabrication appears in §IV/§V beyond the persistent, self-admitted-but-unreproduced T-measurement (item 4), which is the numbered finding below. INC-004's "147 briefs" fiction stays correctly quarantined to the withdrawal note.

---

## VERDICT

**Score: 7 / 10.** Rounds: 4 → 5 → 6 → 7.

| Dimension | R3 | R4 | Note |
|---|---|---|---|
| Novelty of synthesis | 7 | 7 | unchanged |
| Formal model | 7 | 8 | breakeven surface + T=40 alive-set now fully correct; IV.5 κ/optimality honestly scoped |
| Empirical support | 5 | 6 | breakeven/CP/median/F1-provenance all reproduce; T STILL unreproduced (266≠277) |
| Internal consistency | 6 | 8 | banner still verbatim-false (only real inconsistency left); F2/185×/results-revision now coherent |
| Instrument quality | 5 | 6 | SQL published + frozen discipline improved; but the published query contradicts the frozen value |
| Reflexive method | 8 | 8 | INC-004/005 governance remains the strongest datum |
| Scholarship | 7 | 7 | unchanged |
| Clarity | 7 | 8 | provenance moved next to data; appendix needles stripped |
| **Overall** | **6** | **7** | |

**Remaining issues (≤3, severity-tagged):**

1. **MAJOR — the T-measurement is still not reproduced; its banner is unchanged; its monotonicity claim is false.** The published query returns **266, not 277**; the 10-07 assistant-message window ends at 10:00:56 (before the 13:18 artifact), so the count is 10-08-only; and "monotone in hub lifetime" is contradicted by the live count sitting *below* the freeze. The banner "Three regimes, all measured or bounded" (L174) — the sentence I have flagged three rounds running — is verbatim. The substantive conclusion (T=266-ish still clears every threshold, max 120) is robust, which is the only thing keeping this at MAJOR rather than BLOCKER — but a reviewer-measurable number must match the manuscript's frozen value. **One-line fix (deliverable this round): freeze the actual query output (266) in the manuscript and NUMBER_SNAPSHOT, strike or fix the false "monotone" clause, and demote the banner to "measured, bounded, or asserted (T)".**
2. **MINOR — §IV.4's "16 serial dispatches, 16/16" is stale and unlabeled.** The live instrument is 19 rows (16 + 3 round-3 reviews), all OK. Stamp the "16" as frozen-at-v1.3 in-body (RESULTS Table-1 discipline already does this; IV.4 does not) so a reader knows the live count is 19/19, not 16/16.
3. **MINOR — "all seven briefs" (IV.4) still counts a connectivity probe as a brief.** Row 7 of the TSV is hf_probe2.txt — "7/7" is 6 briefs + 1 probe. Arithmetic unaffected; wording carried from r3. One-word fix ("all seven dispatches").

**On the hub's claim that v1.4.1 closes every round-3 finding:** TRUE for the minor/mechanical set — I confirm all of them from raw files (T=40 alive-set, α-provenance, 185×/part3/F2, RESULTS revision-control, appendix needle signatures) and confirm the full regression hunt is clean. **FALSE for the finding with real methodological weight:** the r3 MAJOR is not closed — the number changed (296→277) but still does not reproduce (266), under the same unsupported banner. Because the direction is genuinely toward reproducibility (a query now exists) and every minor finding is dead, this is MINOR REVISE at 7, not ACCEPT — but it is one frozen-value-and-banner fix from being there.

*All re-derivations reproducible this session from `hf_stats.tsv` (19 rows, n=14 frozen), the verbatim §III.3 SQL against `~/.hermes/state.db`, `part3_math.md`, `stats_live.md`, and `NUMBER_SNAPSHOT.json`, as of 2026-10-08. — REVIEWER A, round 4.*

REVIEW4-A-OK
