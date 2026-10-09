# Re-Review Round 5 — Reviewer B (Delegation Economics / Cost Curves / Incentive Gradients)

**Paper:** *Agentic Institutions* (DRAFT.md v1.4.5, HEAD 4c2a622)
**Round-4 review:** reviews/reviewer_B_econ_r4.md (score 7/10, MINOR-REVISE; pre-commitment flip honored)
**Standing pre-commitment (r4, verbatim):** "When the T number is made true and reproducible, this is an ACCEPT." — This round's PRIMARY question is whether that stated ACCEPT condition is now satisfied. Application in reverse: only a **NEWLY VERIFIED BLOCKER/MAJOR (or a T-kit failure)** justifies staying below ACCEPT. Findings are verified, not assumed.
**Verification basis this round:** exact re-inversion of (★) for every breakeven cell; CP bound recomputed; alpha recomputed; T=40 alive-set recomputed; the T-kit run and **tamper-tested** on a /tmp copy; the archive's 343 ids verified against `~/.hermes/state.db` (SELECT-only) for predicate-membership; every regression token and sibling swept by raw grep; three §IV receipts re-traced to hf_stats.tsv / INCIDENT_LOG.md / the in-repo archive; git diff checked to confirm the paper tree is untouched by this review (only my own review file is new).

---

## 0. Headline

**My round-4 ACCEPT condition is satisfied.** The flagship paid-worker T measurement is now **true** and **reproducible** as I demanded: the T magnitude is no longer a remembered number — it is an in-repo, git-attested archive of the 343 qualifying assistant-message ids frozen at 2026-10-09 04:16, and I independently verified all 343 archived ids are genuine `messages` rows satisfying the exact §III.3 predicate (session `20260725_131848_6f3bc9c8`, role='assistant', timestamp ≥ 2026-10-07 13:18). The "monotone in hub lifetime" parenthetical I called false is struck and inverted to the truth ("NOT monotone … a FLOOR"); the compaction/DB-dependence receipt I required is present; and 277 now survives only as correctly-framed history. No new BLOCKER or MAJOR survives my verification; the only defects I can substantiate are three MINORs (one of which is a genuine robustness gap in the T-kit's verifier). Per my pre-commitment discipline, that returns me to my round-3 floor: **ACCEPT-WITH-MINORS, 8/10.**

I deliberately do **not** give 9: the T-kit's `verify_t.sh` is a *count-only* verifier — fine for detecting row deletion, but a same-count content alteration passes exit-0, and byte-stability is guaranteed by git rather than by the verifier itself. That is a reproducibility-kit robustness defect, not a truth/reproducibility failure (the archive remains true and git-attested), so it caps me at 8 rather than dropping me off ACCEPT.

---

## 1. T1 — Disposition of every round-4 finding

For each finding named in my r4 review (§6.1–6.3 and the carried residuals), verdict + one verbatim v1.4.5 quote as evidence.

| r4 finding | r5 verdict | v1.4.5 evidence (verbatim) |
|---|---|---|
| **1. [MAJOR] flagship T does not reproduce (277≠266); "monotone in hub lifetime" false; no DB-dependence receipt** | **FIXED** | DRAFT §III.3: "the hub logged 343 further assistant turns after its first accepted artifact (frozen 2026-10-09 04:16; qualifying id-set archived in-repo, recounted by scripts/verify_t.sh)"; "NOT monotone: the store -> 343 at the 2026-10-09 04:16 re-freeze (measured live by running the printed query verbatim…)"; "This count is a FLOOR, not a monotone quantity: the hub's SQLite store compacts (evicts superseded turns), so the qualifying set from 2026-10-07 has been partially evicted and the count can DECREASE between reads… the frozen 277 is not reconstructible." Intro l.72: "our hub logged 343 further assistant turns at the 2026-10-09 04:16 re-freeze (id-set archived in-repo; receipt in III.3; see INC-006)". Every r4 fix component is present: true count (343), monotone corrected, compaction receipt added. Verified at content level (343/343 ids match the predicate). |
| **2. [MINOR] part3_math.md still carries "optimal control law / cost-optimal policy"** | **FIXED** | part3_math.md l.83 "the cost-rationalized control law that falls out of (★)" and l.92 "re-derived here as the cost-rationalized policy for delegated cognition" — both demoted from "optimal"/"cost-optimal"; raw grep `cost-optimal` in part3 = 0. |
| **3. [MINOR] §IV.2 "Running Example" unlabeled as hypothetical** | **FIXED** | §IV.2: "The mandate reads (illustrative, not instrument data):" — the label my r4 fix asked for. |

**Carried residuals (accepted-as-scope, not regressions, unchanged from r4):** p endogeneity (r4 §table, "NOT FIXED (declared out of scope)"), free-tier w=0 quota shadow-price (§IX "Marginal worker cost: $0 (rationed free tiers)"), and the absence of a formal numbered reference list (§VII "References are inline throughout"). All three were explicitly accepted-as-scope in r3/r4 and remain declared, not hidden. No previously-clean number or sentence regressed.

**T1 net: every r4 finding I carried is FIXED, and the previously-accepted scope limitations are unchanged (not regressions). No r4 finding regressed.**

---

## 2. T2 — Sibling sweep (helps / 277 / monotone in hub lifetime / 331)

Swept all tracked files (DRAFT, part3_math, RESULTS, NUMBER_SNAPSHOT, INCIDENT_LOG, REVISION_LOG, sections, novelty_strike) by raw grep.

- `helps`: in the manuscript only as the legitimate paper title "**When Agent Governance Helps** 2609.05531" (DRAFT §VIII C5, and novelty_strike l.28 as "When Agent Governance Helps"). The III.5 "early session death *helps* delegation" clause is **gone** from both DRAFT §III.5 and part3_math — both now read "sessions die early, which **hurts** the paid-lane case". `helps delegation` in DRAFT = 0.
- `277`: **zero live claims.** Only correctly-framed history: DRAFT l.189 keeps "277 at the v1.4 freeze" / "the v1.4 freeze printed 277 earlier" as the superseded value inside the receipt that explains 277→343; l.591 is the version recap "query published, 277 @ freeze"; NUMBER_SNAPSHOT `t_measurement_count_at_v14: 277`; INCIDENT_LOG/REVISION_LOG incident records. No current claim uses 277 as the T magnitude.
- `monotone in hub lifetime`: **zero in DRAFT/part3**; the phrase appears only in INCIDENT_LOG l.84, REVISION_LOG l.116, and the r4/r5 reviews' documentation of the fix. Struck from the manuscript, replaced by "NOT monotone… a FLOOR".
- `331`: **zero in DRAFT/part3**; appears only in REVISION_LOG l.116 as the historical v1.4.2 intermediate re-freeze (331@22:01) that the 343@04:16 T-kit superseded.

**T2 net: CLEAN — no stale sibling of any of the four terms survives in the manuscript or the derivation file.**

---

## 3. T3 — T-Kit Audit (the centerpiece)

**(a) count** — `wc -l data/t_freeze_2026-10-09T0416.csv` = 344 lines; minus 1 header = **343** data rows. Independently: `awk 'NR>1' | wc -l` = 343. ✓ matches frozen T=343.

**(b) verifier** — `bash scripts/verify_t.sh` output:
```
archive recount : 343
PASS: archive == frozen 343 (byte-stable; git-attested)
live store      : 392 (walks by design: compaction evicts + turns accrue; see the III.3 receipt and INC-006)
EXIT=0
```
The verifier recounts the archive, confirms 343, and cross-reports the live store (392, greater than the freeze — drift documented as expected). Interesting and honest: the live count is now *above* 343 (392), confirming turns accrue, while the freeze floor is preserved in the archive.

**(c) TAMPER TEST** (on a `/tmp` copy, to leave the paper tree untouched):
- **Delete one CSV row** (343→298): `verify_t.sh` → "archive recount : 299" / "FAIL: archive != frozen 343", **exit 1**. FAILS LOUDLY. ✓
- **Alter one csv id while keeping the count at 343**: `verify_t.sh` → "archive recount : 343" / "PASS … byte-stable; git-attested", **exit 0**. **The verifier does NOT detect a same-count content tamper** on its own. However, `git status` immediately flags it: ` M data/t_freeze_2026-10-09T0416.csv`. So byte-stability is enforced by **git** (the archive is committed under HEAD 4c2a622 / freeze commit cd46a7e), not by the verifier — precisely what the PASS line's "git-attested" claim means, and it holds. A reviewer on a clean clone cannot be fooled by a working-copy tamper.

**(d) reconcile III.3 receipt + snapshot + archive** — all three cite **343 @ 2026-10-09 04:16**:
- DRAFT §III.3 & intro: "343 … frozen 2026-10-09 04:16" / "the 2026-10-09 04:16 re-freeze" ✓
- part3_math l.57: "the hub logged 343 further assistant turns after its first accepted artifact (query published in DRAFT §III.3)" — 343 consistent (no timestamp, harmless) ✓
- NUMBER_SNAPSHOT `supplement_v1_4`: `t_measurement_refreeze_value: 343`, `t_measurement_refreeze_at: "2026-10-09 04:16"`, `t_measurement_archive: "data/t_freeze_2026-10-09T0416.csv"` ✓
- Archive filename `T0416.csv` = 04:16, 343 rows ✓
One consistency nit (MINOR, §6.2): the snapshot's top-level `"frozen": "2026-10-08"` is now stale relative to the T re-freeze basis, and `supplement_v1_4.t_measurement_count_at_v14: 277` sits unmarked beside the refreeze fields.

**(e) does the kit satisfy "true and reproducible" as I defined it in r4?** I defined it operationally: re-run the query at freeze, publish the *actual* stable count, strike/correct the false "monotone" parenthetical, and add a one-line DB-dependence receipt. The kit goes further and better: it freezes the **raw id-set** (post-query output, not a number), archives it in-repo git-attested, recounts it by script, and — the decisive check — **I verified all 343 archived ids are genuine `messages` rows matching the §III.3 predicate** (343/343 present, unique, role='assistant', timestamp ≥ 2026-10-07 13:18). The 277/343 history is explained in the manuscript's own receipt. **Yes — the kit satisfies "true and reproducible."** The one substantive limitation (verifier is count-only, (§6.1)) is a robustness gap in the *tool*, not a failure of the archive to be true or reproducible; the truth and reproducibility of T rest on the committed archive and my predicate check, both of which hold.

---

## 4. T4 — Regression hunt (~22 dead tokens, raw grep over DRAFT.md + part3_math.md)

| token | result |
|---|---|
| `75×` / bare `75` (checked for 75× context) | NONE — the 3 raw `75` hits are arXiv-ID false positives (`2610.01756`, `2501.07913`) |
| `T ≈ 61` / `T≈61` / `57/15` | NONE |
| `failure probability` | NONE |
| `147 briefs` / `four concurrent` / `30-second` | NONE (INC-004 withdrawal intact) |
| `INTRO-OK` / `RELATED-WORK-OK` / `PAPER-OUTLINE-OK` / `CITATIONS-RESOLVED-OK` | NONE (all four) |
| `v1.1 COMPLETE` | NONE |
| `cost-optimal control` / `cost-optimal path` / `optimal control` | NONE in DRAFT **and** part3 (part3 now "cost-rationalized") |
| `296` | NONE (INC-005 superseded; not even as history) |
| `40–80` / `40-80` | NONE in DRAFT and part3 |
| `K = the binding budget` / `the binding budget` | NONE |
| `reinterpretng` | NONE |
| `≈5.9` | NONE in DRAFT and part3 |
| `monotone in hub lifetime` | NONE in DRAFT (incident-log history only, see T2) |
| `*helps* delegation` / `helps delegation` | NONE in DRAFT/part3 (III.5 now "hurts") |
| `paging` | 2 hits, both legitimate: l.99 MemGPT memory-paging description; l.386 "no paging" (de-paged 2603.22367) |

**T4 net: CLEAN for every gated regression token, including the companion file part3_math.md.**

---

## 5. T5 — Re-derivation from raw files (never from the paper's claims)

- **α = 3853/22824 = 0.1688** → manuscript "α ≈ 0.17"; hub audit 0.1688. ✓
- **Breakeven cells** `T* = (w/h)/(p(1−α)) − 1` at α=0.17: p=.3 w/h=15→59.24, 20→79.32, 30→119.48; p=.5 15→35.14; p=.7 15→24.82, 20→33.42, 30→50.64. **All seven match the paper's T>59.2/79.3/119.5, T>35.1, T>24.8/33.4/50.6 to the decimal.**
- **T=40 alive-set**: alive {p=.5@15 (35.1), p=.7@15 (24.8), p=.7@20 (33.4)}; dead {p=.7@30 (50.6), all p=0.3 (59.2/79.3/119.5)}. Matches §III.3. ✓
- **CP bound**: 0.025^(1/14) = 0.7684 → [0.77, 1.00]. ✓
- **1/α endpoints**: 1/0.19 = 5.26, 1/0.09 = 11.11 (exact min α=0.087 → 11.5, disclosed) → [5.3, 11.1], ≈6× central. ✓
- **17% check**: 3853/22824 = 16.9% ≈ 17% (wave-1). ✓

**III.5 sign logic:** (★) `(w/h) < p(1+T)(1−α)`; the paid-lane case is that delegation wins, i.e. RHS > w/h. d(RHS)/dT = p(1−α) > 0, so raising T makes delegation *more* likely to win and early session death (small T) shrinks the paid-lane advantage. The manuscript's corrected clause — "sessions die early, which **hurts** the paid-lane case since the inline alternative then looks cheaper" (DRAFT §III.5 and part3_math l.100) — has the **correct sign**, consistent with the hub's own arithmec audit (d(dominance)/dT = p(1−α) > 0) and with my re-derivation. The r4 "helps"-error is genuinely fixed, and the fix is monotone-consistent (this clause does NOT reintroduce any "monotone in hub lifetime" claim — it is about the analytic sign of the dominance inequality in T, which is directionally true).

---

## 6. T6 — Fabrication hunt in §IV/§V (3 quantitative claims traced to the instrument)

1. **§IV.4 "A 7/7 hit rate in the wave-1 calibration run (all seven dispatches accepted (6 briefs + 1 connectivity probe); the cumulative frozen rate is 14/14 — §III.6)".** Trace: hf_stats.tsv rows 1–7 (hf_paper_outline, hf_paper_related, intro, cites, priorart, strike, and `hf_probe2.txt`) all verdict `OK` → **7/7**, of which 6 briefs + 1 connectivity probe ✓; rows 1–14 all `OK` → 14/14 ✓; CP [0.77,1.00] re-derived ✓. **Grounded.**
2. **§IV.5 INC-001 worked example: "Detection took one integrity pass; containment one hub action (quarantine + restore, zero loss)."** Trace: INCIDENT_LOG INC-001 ("Detection: post-wave integrity check (mtime + signature scan)…"; "Containment: block extracted to sections/sec_s4_worker_inserted.md; DRAFT.md restored to canonical… No data loss; insertion-only") ✓; TSV sec_s4 row (163s, 20 msgs) ✓. **Grounded.**
3. **§III.3 / intro T = 343.** Trace: not to a remembered number but to the in-repo archive `data/t_freeze_2026-10-09T0416.csv`; I verified **343/343 archived ids are genuine `messages` rows in session 20260725_131848_6f3bc9c8 satisfying the §III.3 predicate** (unique, role='assistant', timestamp ≥ 2026-10-07 13:18). **Grounded at the content level.**

Also confirmed free of unprovenanced instrument pretensions: §III.6 "median 31.5 s (frozen at n=14)" re-derived from TSV rows 1–14 (durations sort to (26+37)/2 = 31.5) ✓; §IV.2 Running Example is labeled "(illustrative, not instrument data)" ✓; §IV.3's illustrative acceptance thresholds (q≥0.87, t≤45s) are clearly sketch values, not instrument claims. **No unprovenanced quantity with instrument pretensions found.** INC-004 discipline holds; no INC-004-sibling.

---

## 7. T7 — Verdict

### Remaining issues (3, severity-tagged)

1. **[MINOR] verify_t.sh is a count-only verifier — a same-count content tamper passes exit 0.** Verified in a /tmp copy: deleting a row FAILS loudly (exit 1), but rewriting one id while keeping 343 rows prints "PASS" (exit 0). Byte-stability is enforced by **git** (the archive is committed under HEAD 4c2a622; `git status` shows ` M` on tamper), which the PASS line's "git-attested" correctly points to — so a clean-clone reviewer is still protected. But the verifier itself does not self-check the archive's content or committed hash, so the kit's integrity guarantee lives in git hygiene, not in the script. **Fix (one line):** have `verify_t.sh` also assert `git diff --quiet -- data/t_freeze_2026-10-09T0416.csv` (or re-check each id against the §III.3 predicate / a committed sha256), so a same-count tamper fails in-script. Robustness gap only — the archive remains true and reproducible, so this does not defeat my ACCEPT condition.
2. **[MINOR] NUMBER_SNAPSHOT.json top-level `"frozen": "2026-10-08"` is stale** relative to the T re-freeze basis (2026-10-09 04:16), and `supplement_v1_4.t_measurement_count_at_v14: 277` sits unmarked beside the refreeze fields, so a reader scanning primary/supplement fields could take 277 as current. **Fix:** bump the frozen date and mark 277 as superseded-by-343.
3. **[MINOR, typographic] §III.3 receipt has a double-period artefact**: "compares the live store (drift expected).. So a worker can cost" — stray ".." after the parenthetical (v1.4.5 edit artefact). 

*(The three carried-accepted scope limitations — p endogeneity, free-tier shadow price, no formal numbered reference list — are declared limitations, not defects, and are reported as such in the manuscript already.)*

### Score and verdict

**Score: 8/10** (up from 7). My round-4 ACCEPT condition — "the T number made true and reproducible" — is **satisfied and independently verified**: T=343 is the actual frozen count reconstructed from the DB at the content level (343/343 archived ids match the published query predicate), archived in-repo and git-attested, recounted by script, with the false "monotone in hub lifetime" parenthetical struck and replaced by the true "NOT monotone … a FLOOR," and the compaction/DB-dependence receipt present. The entire quantitative core re-derives to the third decimal (α=0.1688, all 7 breakeven cells, CP 0.7684, T=40 alive-set, 1/α endpoints, 16.9%≈17%); the regression and sibling sweeps are clean across both the manuscript and the companion file including the III.5 sign (*hurts* is correct); the fabrication hunt finds every sampled §IV/§V claim grounded in the instrument. No new BLOCKER or MAJOR survives verification. What keeps me at 8 rather than 9 is the count-only verifier gap (issue 1) — a real reproducibility-tool robustness defect, but not a truth/reproducibility failure of the number.

**Verdict: ACCEPT-WITH-MINORS.** Three one-line minors sweep it to a clean 9. The science — the dominance law, the breakeven surface, the free-lane degeneracy, the 1/α lifespan law, the Jevons/verification-binding claim — is verified and robust; the flagship T measurement that carried my MAJOR for a round is now true, reproducible, and honestly receipted.

---

*Reviewer B — 2026-10-09. (★) re-inverted for all 7 cells at α=0.17; CP/α/1-α endpoints/alive-set recomputed; III.5 sign re-derived (d(RHS)/dT = p(1−α) > 0 ⇒ early death hurts — matches "hurts"); T-kit run and tamper-tested on a /tmp copy (row-delete fails loudly, same-count content tamper passes exit 0 and is caught only by git — flagged MINOR); all 343 archived ids verified against state.db (SELECT-only) to satisfy the published predicate; every ~22 regression token and the 4 T2 siblings swept by raw grep; three §IV receipts re-traced to the instrument; paper tree confirmed untouched (git HEAD 4c2a622, only my review file added).*

REVIEW5-B-OK
