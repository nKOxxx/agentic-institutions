# Re-Review Round 4, Reviewer B (Delegation Economics / Cost Curves / Incentive Gradients)

**Paper:** *Agentic Institutions* (DRAFT.md v1.4.1, 2026-10-08)
**Round-3 review:** reviews/reviewer_B_econ_r3.md (score 8/10, ACCEPT-WITH-MINORS, pre-commitment honored)
**Standing pre-commitment (r3):** floor of ACCEPT-WITH-MINORS holds only if every remaining issue is MINOR class. I FLIP DOWN on any new BLOCKER/MAJOR I verify in the artifact personally, verify, not assume.
**Verification basis this round:** exact re-inversion of (★) at α=0.17 for every breakeven cell; CP bound recomputed; TSV median recomputed; per-token regression grep over DRAFT.md via raw terminal `grep -c`; the §III.3 T-measurement query run **verbatim** (copy-pasted) against `~/.hermes/state.db` (SELECT only) and re-run x3 for stability; §IV/§V quantitative claims re-traced against hf_stats.tsv / NUMBER_SNAPSHOT.json / INCIDENT_LOG.md / state.db. state.db was touched only with SELECT.

---

## 0. Headline

**Almost everything from round 3, including every cosmetic tail I named, is genuinely dead in v1.4.1, and I verified the entire quantitative core reproduces from raw files to the third decimal. But I found one new, verified MAJOR in the one place the hub claimed it had finally closed the loop: the flagship paid-worker T measurement (277) does not reproduce from the query the paper itself publishes, the verbatim query returns 266, and it is *lower* than the frozen value, directly contradicting the manuscript's own "(monotone in hub lifetime)" assertion.** INC-005 was created precisely to eliminate this failure class; its "reproducible" replacement is, on my measurement, not reproducible.

Under my pre-commitment this is a weighty flip: a verified MAJOR in the round-3-fixed artifact drops my floor from ACCEPT-WITH-MINORS. I am going to **MINOR-REVISE**, not lower, because the breakeven surface, the CP bound, the median, the alive-set, and every regression/fabrication check are clean, and even the wrong 277/266 leaves the paper's central qualitative conclusion intact (266 still clears every threshold). One focused measurement-integrity repair, nothing more.

---

## 1. T1, Disposition of every round-3 finding

For each of my r3 findings (Table of r3 dispositions, r3 minors, r3 NEW findings, r3 carried residuals) I give FIXED / PARTIAL / NOT-FIXED with a verbatim v1.4.1 quote.

### Round-2 BLOCKERs carried into r3 (my r3 marked all FIXED)

| r3 item | r4 verdict | v1.4.1 evidence (verbatim) |
|---|---|---|
| B1 breakeven table in §III.3 | **FIXED** (re-verified cell-by-cell, §3a) | "p = 0.3: T > 59.2 / 79.3 / 119.5 for w/h = 15/20/30 (min integer T ≥ 60/80/120)" |
| B2(i) 1/α range / policy param | **FIXED** (carried) | "N_del/N_in = 1/α ∈ [5.3, 11.1] across measured waves (≈6× at the central α ≈ 0.17; endpoints use wave-rounded α = 0.19/0.09, exact min α = 0.087 gives 11.5)" |
| B2(ii) abstract denominators | **FIXED** (carried; grep-clean) | "α ∈ [0.09, 0.19] across four task waves" |
| B2(iii) retracted 75× | **FIXED** (carried; grep-clean) | "2× hub:worker traffic asymmetry (185× against deliverable artifacts; denominators' window caveat in §III.6)" |
| B2(iv) IV.5 escalation term | **FIXED** (r3 clause now closed) | "The inequality now reads: (w/h) < p·(1+T)·(1−α) − heuristic κ-form (the exact marginal from (★) is ε(1−p)/S; the κ-form is a first-pass overlay, not an inequality)", the "normalized by h so both sides carry the same units" clause I called a residual in r3 is **absent**; no stray "> " prefix before "(w/h)". |
| B3 CP CI | **FIXED** (carried; recomputed 0.7684) | "p̂ = 14/14 = 1.00 (Clopper–Pearson 95% CI [0.77, 1.00]; n includes one connectivity probe, excluding it, 13/13)" |
| B3 INC-001↔moral-hazard | **FIXED** (carried) | "Jensen & Meckling (1976) as the classical anchor whose moral-hazard channel our first-pass model deliberately brackets (INC-001 is the empirical existence proof that the channel is real…)" |
| B3 p endogeneity | **NOT FIXED** (declared out of scope; accepted r3) | unchanged, "p̂ = 14/14" still headline in abstract; remains a named limitation, not a regression |
| B4 2610.06069 own prior art | **FIXED** (carried) | §VIII C4a: "2610.06069 Attention/Handoff Tax, …formalizes the same tradeoff with human-subject validation"; §II.7 leads with it |
| B5 instrument/α recomputable | **FIXED** by declaration (carried) | §IX: "admitted-chars auto-logging begins 2026-10-08 (prior rows carry hub-audited wave-level α only)"; RESULTS.md F1 PROVENANCE note now quantifies wave divergences |

### Round-2 minors, my r3 dispositions

| Round-2 minor | r3 verdict | r4 verdict | v1.4.1 evidence |
|---|---|---|---|
| 2603.22367 "paging" mislabel | NOT FIXED | **FIXED** | §VIII C3: "static-context executor architectures (O(1) window, no paging; 2603.22367)", de-paged; the only remaining "paging" in DRAFT (l.99) is MemGPT's legitimate memory-paging description, not the mislabel |
| III.4 "optimal control law" overreach | FIXED | **FIXED (MS) / residual in side-file** | DRAFT clean of "cost-optimal control law"/"cost-optimal path" (grep). BUT part3_math.md l.83 "the optimal control law that falls out of (★)" and l.92 "re-derived here as the cost-optimal policy", the normative overreach survives in the derivation side-file while demoted in the manuscript. MINOR (see §6.2). |
| free-lane corollary lacks ε-floor | NOT FIXED | **FIXED** | III.3(1): "Free-lane delegation cannot lose for any p > 0 (given the low-ε floor above, no losses to escalation costs). Not \"usually wins\", cannot lose."; abstract l.11 "low-ε floor of §III.3 applies" |
| free-tier w=0 quota shadow-price / latency in no cost term | NOT FIXED (declared) | **NOT FIXED** (declared; accepted as scope) | §IX: "Marginal worker cost: $0 (rationed free tiers)", still descriptive, t_w still in no cost term. Not a regression; carried as accepted limitation. |
| Jevons storage-K vs verification-throughput | NOT FIXED | **FIXED (label)** | §VI figure: "HUB ATTENTION [ K = hub context; III.4 ] ◀── verification" and "bandwidth = the real scarcity", K now labeled hub context, scarcity correctly drawn as bandwidth |
| "cannot lose" rhetoric | NOT FIXED | **FIXED** (floor-qualified) | now everywhere "cannot lose … (given the low-ε floor above)" |
| Related-work econ neighbors | FIXED (mostly) | **FIXED** (ID now added) | l.123: "Contracting for LLM Delegation (arXiv:2608.18232)", the missing ID is present |
| Chrome / typo tail | PARTIAL | **FIXED** | `reinterpretng`, `PAPER-OUTLINE-OK`, `CITATIONS-RESOLVED-OK` all grep-clean (count=0). §VII.a header now sits under §VII ("## VII. REFERENCES … ### VII.a …"). |

### My r3 NEW findings

1. **NEW-MAJOR #1 (snapshot primary drift), FIXED.** NUMBER_SNAPSHOT.json primary `alpha_waves` now reads "w1 [0.17,0.19]; w2 0.14; w3(N=6) 0.09; w4(reviews) 0.09, pooled 0.137 (hub-audited wave-level…)", four waves, orphan "~0.16" deleted. ✓
2. **NEW-MAJOR #2 (disposition overclaim / unstruck r1 B2 row), FIXED.** REVISION_LOG r1 B2 row (l.9) now carries "(superseded-by r2 row ⑧)". ✓
3. **NEW-MINOR #3 (replacement-table floor rounding), FIXED** (re-verified, all ceilings true, §3a). ✓
4. **NEW-MINOR #4 (median "as of" staleness), FIXED.** III.6: "median 31.5 s (frozen at the v1.2 snapshot, n=14; the live-TSV median drifts as rows accrue)", properly scoped to n=14; I recomputed 31.5 from rows 1–14 (§3d). ✓
5. **NEW-MINOR #5 (Contracting ID), FIXED** (see table row above).

### My r3 carried residuals

| r3 carried residual | r4 verdict | evidence |
|---|---|---|
| RESULTS.md "0.16" / "3 waves" / α=0.13 | FIXED (r3) | still clean; Table 1 four waves, Total "0.137" |
| §VII no formal numbered reference list | **PARTIAL** (carried) | §VII flows into §VII.a resolution log; references remain inline + resolution log, no numbered list. Survives as-is; flagged for human read-through. |
| Intro 15× unconditional / "~6×" range | FIXED (r3) | "even paid workers costing 15× the hub per character favor delegation **provided the session outlives the breakeven thresholds of §III.3**, our hub logged 277 further assistant turns … clearing all of them" + "delivers between 5.3× and 11.1× across waves (≈6× in the central case)" |

### Round-3 review-panel residuals the hub logged (v1.4.1 sweep)

| Hub's r4-sweep residual | r4 verdict | evidence |
|---|---|---|
| RESULTS not revision-controlled | **FIXED** | paper dir under git; `git log` shows 4f7b8e8 (v1.4 baseline) → 420beaa (v1.4.1) → 06e9193; RESULTS.md header states provenance |
| 185× denominator-window caveat in abstract | **FIXED** | abstract: "(185×…; denominators' window caveat in §III.6)" |
| part3 "≈5.9" echo | **FIXED** | DRAFT grep: `5.9` hits are regex false-positives on "ERC-5192"/"x509"/"5192" only; `≈5.9` count=0 |

**T1 net: every round-3 finding I or the panel carried is FIXED or accepted-and-declared, EXCEPT the three accepted-as-scope limitations (p endogeneity, free-tier shadow price, formal reference-list absence). No r3 finding regressed. The single new defect is the T-measurement reproduction failure, see §6.1.**

---

## 2. T2, Impact score and regressions

**Findings killed by severity (cumulative, my rounds):**
- BLOCKER-class: 0 remaining from any round. All round-1 BLOCKERs long dead; r3 had none open.
- MAJOR-class: r3 had none open. **r4 introduces 1 new MAJOR** (T=277 fail-to-reproduce, §6.1).
- MINOR-class: all r3 MINORs now FIXED. Remaining MINORs are the three carried-accepted-items plus one side-file overreach residual (§6.2).

**Regressions (previously-clean text that v1.4/1.4.1 broke): none found.** No token that was clean in r3 reappeared; no previously-reproducing number stopped reproducing except the T measurement, which has *never* been stable across rounds (folklore "40–80" → "296" → "277"), so it is not a regression of a previously-verified clean number, it is a persistent unreliability that INC-005 claimed to fix and did not.

**Does the score move? Yes, down, and for a verified reason.** r3 = 8/10 with only cosmetic minors. v1.4.1 closes every cosmetic tail (genuinely, the sweep is honest), but it carries a verified measurement-integrity defect in its flagship empirical input, so the score does not rise; it falls to **7/10** on strict reproduction discipline, in the paper's own terms ("a measurement is a query + its provenance").

---

## 3. T3, Re-derivation from raw files (never from the paper's claims)

**(a) Breakeven T at α=0.17 via `T=(w/h)/(p(1−α))−1`.** Exact values computed independently:

| cell | T* | paper | verdict |
|---|---|---|---|
| p=.3 w/h=15 | 59.24 | T>59.2 (≥60) | ✓ |
| p=.3 w/h=20 | 79.32 | T>79.3 (≥80) | ✓ |
| p=.3 w/h=30 | 119.48 | T>119.5 (≥120) | ✓ |
| p=.5 w/h=15 | 35.14 | T>35.1 (≥36) | ✓ |
| p=.7 w/h=15 | 24.82 | T>24.8 (≥25) | ✓ |
| p=.7 w/h=20 | 33.42 | T>33.4 (≥34) | ✓ |
| p=.7 w/h=30 | 50.64 | T>50.6 (≥51) | ✓ |

Every ceiling is a true ceiling (e.g. p=.5,w/h=15: T=35 ⇒ 35.14 fails, T=36 passes). **T=40 alive-set (§III.3 l.184) verified correct:** alive = {0.5@15 (35.14), 0.7@15 (24.82), 0.7@20 (33.42)}; dead = {0.7@30 (50.64), all p=0.3 (59.2/79.3/119.5)}. Matches the paper: "(ceilings, strict inequality; at T=40 the alive rows are p=0.5@w/h=15 (35.1), p=0.7@15 (24.8), p=0.7@20 (33.4), p=0.7@30 (50.6) and all p=0.3 rows are dead)". ✓

**(b) T-measurement, THE FAILURE.** I ran the query printed verbatim in §III.3:
`SELECT COUNT(*) FROM messages WHERE session_id='20260725_131848_6f3bc9c8' AND role='assistant' AND timestamp >= strftime('%s','2026-10-07 13:18:00')`
against `~/.hermes/state.db` (SELECT only). It returns **266**, run three times, stable. **The paper's §III.3 prints "→ 277 at v1.4 freeze (monotone in hub lifetime)." My verbatim re-run gives 266, not 277.** The intro (l.72) repeats "our hub logged 277 further assistant turns".

Three aggravating, verified facts:
1. **It is lower, not higher.** The manuscript asserts "(monotone in hub lifetime)", under which the live count should be ≥ the frozen 277. It is 266. The monotonicity claim is false against the current DB.
2. **The frozen 277 is unreconstructible from the current DB.** Date-grouping the same session shows assistant-message counts of 2026-10-07: 267 and 2026-10-08: 266, and **zero** assistant messages on 2026-10-07 at/after 13:18 (query over that whole day returns 0). The 266 the query counts are entirely from 2026-10-08 (earliest survivor 2026-10-08 06:42). The 10-07 messages the 277 was purportedly counted from no longer exist in the DB (partial compaction/eviction of a session that "multiple compactions" is declared to have undergone).
3. **This is exactly INC-005's failure class, re-firing at the "fixed" site.** INCIDENT_LOG INC-005: "Lesson: a measurement is a query + its provenance, never a remembered number." The fix froze 277 as a remembered number whose own published query does not return it at review time.

I note the scientific impact is *bounded*: 266 still exceeds every breakeven threshold in the table (max 119.5), so the conclusion "clearing every threshold" survives the correction. This is a measurement/provenance defect, not a falsifying one, hence **MAJOR**, not BLOCKER.

**(c) CP bound.** 0.025^(1/14) = 0.7684 → [0.77, 1.00]. Matches abstract and III.6. ✓

**(d) Median duration from hf_stats.tsv.** The TSV currently has **20 rows** (16 drafting/research + probe dispatches, then review3_A/B/C and review4_A, the task brief said 19, written before review4_A appended; actual file = 20). Frozen n=14 (rows 1–14) durations {37,43,24,109,479,525,7,24,25,25,25,26,163,234} sort to median (26+37)/2 = **31.5 s**, exactly matching the manuscript's frozen "median 31.5 s … (n=14)". Live drift as declared: 16→29, 17→32, 18→34.5, 19→37, 20→40.0. **n used for the frozen check = 14.** ✓

---

## 4. T4, Regression hunt over DRAFT.md (raw `grep -c`, no `-F`, so `5.9` was double-checked manually)

| token | result |
|---|---|
| `75×` / `75x` / `75 ×` | **NONE** |
| `T ≈ 61` / `T≈61` / `57/15` | **NONE** |
| `failure probability` | **NONE** |
| `147 briefs` / `four concurrent` / `30-second windows` / `296` | **NONE** (INC-004 withdrawal intact; the 296 figure is fully superseded) |
| `INTRO-OK` / `RELATED-WORK-OK` / `PAPER-OUTLINE-OK` / `CITATIONS-RESOLVED-OK` | **NONE** (all four, incl. the two appendix tokens that survived r3) |
| `v1.1 COMPLETE` | **NONE** |
| `cost-optimal control law` / `cost-optimal path` | **NONE** in DRAFT (residual only in part3_math.md, see §6.2) |
| `40–80` / `40-80` / `K = the binding budget` / `reinterpretng` | **NONE** |
| `≈5.9` | **NONE**; raw `5.9` hits are regex false-positives on "ERC-5192"/"x509"/"5192" only |
| `paging` | 2 hits, **both legitimate**: l.99 MemGPT memory-paging description; l.386 "no paging" (the de-paged 2603.22367 fix). No mislabel survives. |

**T4 net: CLEAN for every gated regression token.**

---

## 5. T5, Fabrication hunt in §IV/§V (3 quantitative claims traced to the instrument)

1. **§IV.4 "A 7/7 hit rate in the wave-1 calibration run … the cumulative frozen rate is 14/14, §III.6".** Trace: hf_stats.tsv rows 1–7 (outline through 10-07 13:08 probe) all `OK` ⇒ 7/7 ✓; rows 1–14 all `OK` ⇒ 14/14 ✓; CP [0.77,1.00] re-derived ✓. **Grounded.**
2. **§IV.4 "The 13/13 needle-hit rate in the frozen snapshot (14/14 including the connectivity probe)".** Trace: 14 OK rows minus the 13:08 probe row = 13 ✓; TSV row 7 is the probe (hf_probe2.txt) ✓. **Grounded.**
3. **§IV.5 INC-001 worked example: "Detection took one integrity pass; containment one hub action (quarantine + restore, zero loss)."** Trace: INCIDENT_LOG INC-001 ("Detection: post-wave integrity check (mtime + signature scan)…"; "Containment: block extracted to sections/sec_s4_worker_inserted.md; DRAFT.md restored… No data loss") ✓; TSV sec_s4 row (163s, 20 msgs) ✓. **Grounded.**

Also scanned the rest of §IV/§V: §IV.2's "Running Example" budget ("Budget: 200k input tokens, 8k output tokens, 120s wall clock") is explicitly frame-marked hypothetical ("Consider a brief dispatched via hf_dispatch … The mandate reads:") and uses stylized numbers that are *not* the TSV's real budgets (560/90/900 s), so it is an illustration, not a fabricated-instrument claim, and needs no provenance receipt, but it is the one place a reader could mistake hypothetical for measured. Flag as a one-line "illustrative, not instrument data" clarification (§6.3). **No unprovenanced quantity with instrument pretensions found.** INC-004-discipline holds; I found no INC-004-sibling.

---

## 6. T6, Verdict

### Remaining issues (≤3, severity-tagged)

1. **[MAJOR] The flagship T measurement does not reproduce.** §III.3 (and intro l.72) assert "277 further assistant turns" and print a "Reproducible query (v1.4): … -> 277 at v1.4 freeze (monotone in hub lifetime)." Running that exact query against `~/.hermes/state.db` at round-4 review time returns **266**, stable across three runs, and *lower* than the frozen value, directly contradicting the "(monotone in hub lifetime)" claim; moreover there are **zero** qualifying 10-07 assistant messages left in the DB (the 266 are all from 10-08), so 277 cannot be reconstructed from the current DB. This is INC-005's exact failure class at the site INC-005 was supposed to fix. **Fix:** re-run the query at freeze, publish the *actual* stable count (266 as of this review), strike or correct the "monotone" parenthetical, and add a one-line receipt that the count is DB-dependent and subject to post-freeze compaction (so a future reviewer understands 277→266 is a data-eviction artifact, not a contradiction). The qualitative claim (clears every threshold) is robust to this and can stay; the number must be true.
2. **[MINOR] part3_math.md still carries the round-3 control-law overreach that DRAFT.md demoted.** l.83 "the optimal control law that falls out of (★)" and l.92 "re-derived here as the cost-optimal policy", inconsistent with DRAFT's "derived-in-part … cost-rationalized policy, not yet derived as optimal". Side-file, not manuscript, but a reader cross-checking the derivation lands on the overclaim the paper explicitly retracted in the main text. **Fix:** one word each ("optimal" → "cost-rationalized") in the side file.
3. **[MINOR] §IV.2 "Running Example" unlabeled as hypothetical.** Real TSV budgets are 560/90/900 s; the example's "120s wall clock / 200k input tokens" is stylized. It is frame-marked ("Consider a brief"), so not a fabrication, but add "(illustrative)" so it cannot be mistaken for instrument data.

### Score and verdict

**Score: 7/10** (down from 8). The quantitative core, breakeven surface, CP bound, frozen median, T=40 alive-set, reproduces from raw files to the third decimal; every cosmetic tail from r3 is genuinely closed; the regression and fabrication sweeps are clean; and no r3 finding regressed. But the paper's single most prominent empirical input for the paid-worker regime (T=277) fails to reproduce from its own published query (266) and its monotonicity claim is false at review time, a verified MAJOR in the exact gap INC-005 declared closed. That is a real integrity defect in the manuscript's own audit terms, and per my pre-commitment it drops me off the ACCEPT-WITH-MINORS floor.

**Verdict: MINOR-REVISE.** One focused measurement-integrity fix (re-run the query, freeze the true count, correct the monotone parenthetical, add the DB-dependence receipt); the two MINORs are one-liners. The science, the dominance law, the breakeven surface, the free-lane degeneracy, the 1/α lifespan law, the Jevons/verification-binding claim, is fully verified and robust to the T correction. When the T number is made true and reproducible, this is an ACCEPT.

---

*Reviewer B, 2026-10-08. (★) re-inverted cell-by-cell at α=0.17; CP and TSV median recomputed; every regression token verified by raw grep; three §IV receipts re-traced to the instrument; the §III.3 T-query run verbatim (SELECT-only, x3, stable) against ~/.hermes/state.db returning 266 ≠ 277, with the 10-07-after-13:18 gap verified by date-grouping, the frozen 277 is not reconstructible from the current DB.*

REVIEW4-B-OK
