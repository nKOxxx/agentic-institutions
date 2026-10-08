# REVIEW ROUND 2 — REVIEWER A (Empirical Methods)

**Manuscript:** *Agentic Institutions* (DRAFT.md v1.2, 2026-10-08) + REVISION_LOG.md, NUMBER_SNAPSHOT.json, RESULTS.md, INCIDENT_LOG.md, part3_math.md, `~/.hermes/scripts/hf_stats.tsv` (16 rows, schema v2), `hf_dispatch.sh`, stats_live.md.
**Reviewer role:** unchanged — senior empirical-methods reviewer; measurement and evaluation of ML systems.
**Bar applied:** unchanged — arXiv cs.MA/cs.AI position/methods paper.
**Confidence:** 5/5 — every check below was re-derived from the raw TSV, `part3_math.md`, and the instrument source in this session. Nothing is taken from REVISION_LOG.md on faith. (That policy paid: see §2, R2-1.)

**Recommendation: MINOR REVISE — v1.2 clears most round-1 blockers; it fails its own final gate on a small, enumerable, mechanical defect set.**
**Score: 5 / 10** (subscores in §6)

---

## 0. Summary verdict on the revision

This revision is real work, not cosmetic. I re-derived every headline number and most of the round-1 blockers genuinely hold in v1.2: the retracted 75× is gone from the manuscript; the abstract now carries the Clopper–Pearson interval and self-describes α and p as "bounded first-pass estimates"; there is exactly one dominance inequality of record; the most-dangerous prior art (2610.06069) is foregrounded; the INC-001 attribution is corrected; the transcript chrome is stripped with elision notes left in place; the instrument schema now has artifact/admitted columns and the dispatcher — which round 1 could not even find — is inspectable and does what §IX says it does.

But v1.2 was shipped failing the exact gate that INC-003 claims to have installed. **The corrected breakeven table landed in `part3_math.md` and never propagated into DRAFT.md §III.3** — the manuscript still prints the round-1 numbers I proved unreproducible — and **§IX.b asserts "All BLOCKER findings are resolved in this revision" over a revision that left a blocker-grade table stale.** A paper whose thesis is "gates must assert the negative" revision-controlled itself with presence-only checks a third consecutive time. The residual defect list is short and mechanical, which is why this is MINOR REVISE and not MAJOR — but the pattern earns the paper no benefit of the doubt, and §7's required list is to be treated as a gate, not suggestions.

---

## 1. Disposition of my round-1 findings

Severity tags are my round-1 tags. Verdicts: FIXED / PARTIAL / NOT FIXED, with quoted v1.2 evidence.

### B1 — "Retracted 75× still in abstract" — **FIXED**

`grep -F '75×' DRAFT.md` → 0 hits; `'75x'` → 0 hits. Abstract now reads: *"a 2× hub:worker traffic asymmetry (185× against deliverable artifacts) in the institution's own logs."* The dual denominator is disclosed rather than hidden, which is the honest form of this number (see B/M3-residual in §3). INC-003 in INCIDENT_LOG.md correctly converts the catch into a lesson ("a gate that cannot fail is not a gate") — a lesson the revision then failed to apply to itself (§2, R2-3).

### B2 — "Three irreconciled dominance formulas" — **FIXED (one residual defect, downgraded)**

- The abstract, intro (line 68), and Part III now all state `(w/h) < p(1+T)(1−α)`. The intro's `(2−p)[v+(w/h)(S/T̄)]` is gone: `grep '(2-p)'` and `'2−p'` → 0 hits; `T̄` → 0 hits. The stale formula was deleted, not reconciled — acceptable and cleaner.
- **Residual (R2-4, MAJOR→MINOR but must be fixed): IV.5's escalation term is still not the model of record's term.** IV.5 now writes `(w/h) < p·(1+T)·(1−α) − (ε/h)·κ(η)`. Starting from III.2's own cost laws, `C_del < C_in` with ε retained gives, exactly:

  `(w/h) < p(1+T)(1−α) − ε(1−p)/S`

  III.3 drops ε under a *stated magnitude condition* ("ε·(1/p−1)/S « 1−α in all our runs") — that is a legal, disclosed approximation. IV.5 instead reintroduces ε with a different functional form: ε/h has units of *worker-char-equivalents*, not turns, and is dimensionally incommensurate with the LHS unless κ(η) silently absorbs an unstated (1−p)/S(1+T)-type factor. REVISION_LOG's "IV.5 term unit-normalized" is asserted, not derived; no normalization algebra appears anywhere. One substitution from your own cost laws, three lines, would close this. As shipped, the paper again contains two forms of the headline inequality — fewer and closer than round 1, but the exact class of defect B2 flagged.

### B3 — "Breakeven table fails reproduction" — **PARTIAL: recomputed correctly in the aux file; the DRAFT still ships the stale table. REGRESSION-GRADE. (R2-1, top finding)**

I recomputed every entry from (★) with α = 0.17, T* = (w/h)/(p(1−α)) − 1:

| p | w/h | part3_math.md (v1.2) | my recompute | DRAFT.md §III.3 (lines 184–186) | verdict |
|---|---|---|---|---|---|
| 0.3 | 15 | T ≥ 59 | 59.2 ✅ | "T ≥ 57/15/…" (garbled; 57 wrong) | ❌ stale |
| 0.3 | 20 | T ≥ 79 | 79.3 ✅ | *absent* | ❌ |
| 0.3 | 30 | T ≥ 119 | 119.5 ✅ | *absent* | ❌ |
| 0.5 | 15 | (not listed) | 35.1 | "T ≈ 35" | ✅ this one matches |
| 0.7 | 30 | T ≥ 51 | 50.6 ✅ | "T ≈ 61" | ❌ stale — the exact number I rejected in round 1 |

The v1.2 recompute (p=.3,w/h=20 → 79; p=.7,w/h=30 → 51) is **correct** — I confirm it to within rounding. REVISION_LOG B3 says "recomputed from (star) in part3_math.md." What shipped in the manuscript is the old table, byte-for-byte where it counts: the p=.7/w/h=30 entry is the same "T ≈ 61" I proved impossible in round 1 (true value 50.6, a 20% error), plus a new garbled line ("T ≥ 57/15/…" — an ellipsis inside a claimed measurement, apparently a half-applied edit). part3_math.md itself documents the crime scene: lines 51–58 contain the new table immediately followed by the three stale lines, both left in the file. The correction pass verified the new numbers existed and never asserted the old ones were absent — INC-003's root cause, recurred, in the same revision that logs INC-003 as fixed. §IX.b's summary of the external review even lists "two of four breakeven-table entries failing reproduction against (★)" among "all resolved in v1.2." They are not resolved *in the manuscript*.

### B4 — "α not recomputable from instrument" — **PARTIAL (honest, and the path is real)**

Verified in source:
1. `hf_dispatch.sh` v1.2 (lines 23–26, 30–54) appends `artifact_s` (chars after the last needle occurrence, chrome-stripped by an awk filter) and `admitted_s` (from `HF_ADMITTED`, "filled post-adjudication"). The TSV now has 10 columns; the two 2026-10-08 probe rows carry `artifact_s` ∈ {0, 185}, `admitted_s` empty. **The mechanism exists and demonstrably fires.** The historical 14 rows are output-chars-only — declared in §IX ("admitted-chars auto-logging begins 2026-10-08 (prior rows carry hub-audited wave-level α only)") and in the common re-review brief as a known limitation, not a hidden flaw. I accept the declaration.
2. The wave-level α values themselves remain hub-audited, i.e., hand-derived from quantities outside the instrument: RESULTS Table 1's S = 22,824 vs the TSV's final-message chars for the two drafting dispatches = 2,835 — the round-1 8.1× denominator gap persists, now *labeled* rather than *closed*. The abstract's downgrade — "α and p are bounded first-pass estimates with an accumulating instrument, not measured constants" — is the correct epistemic posture and I credit it.
3. **What is still missing:** a negative control (a brief engineered to fail — after 16 dispatches the instrument's verdict column remains uniformly OK; a measurement procedure that has never emitted its failure value still has a degenerate outcome distribution), a snapshot hash for the frozen TSV (NUMBER_SNAPSHOT.json freezes *values*, not bytes), and zero adjudicated α rows. The v2 scope in REVISION_LOG covers these. PARTIAL, honestly declared.

### B5 — "§VIII omitted own most-dangerous prior art (2610.06069)" — **FIXED**

II.3 (new): *"Foremost: **Attention Tax / Handoff Tax (arXiv:2610.06069)** — the formalization of the same inline-vs-delegate tradeoff, with human-subject validation; our (★) is the machine-institution analogue and the two should be read together."* VIII table row C4a: *"our own strike's MOST-DANGEROUS paper … complementary, cite-first."* Verified the ID is genuinely in `novelty_strike.md` (lines 10, 15, 19, 39) with the hostile description ("formalizes EXACTLY the tradeoff you attack … empirically validates it"). The claim-to-delta mapping (per-attention pricing vs session-amortized dominance) is fair. This is how to absorb a killer citation.

### M1 — "p̂ self-certified, no CI; probe row in n" — **FIXED (residual declared)**

Abstract: *"First-try acceptance carries a Clopper–Pearson 95% CI of [0.77, 1.00] at n=14."* I recomputed: 0.025^(1/14) = 0.7684 → [0.768, 1.000] ✅. §III.6: *"n includes one connectivity probe — excluding it, 13/13"* (13/13 lower bound = 0.753; correctly not headline). The connectivity-probe disclosure is exactly what I asked for. Residual, declared: the verdict column is still hub-authored in the same log it measures, no second rater, no stored predicate per row. §IX(4) now says the right thing — "needle-pass is necessary but not sufficient — post-wave integrity scans compare the artifact against the mandate (INC-001 exists precisely because a worker passed (3) while failing (4))" — which is the honest measurand statement. Accepted at this bar with the accumulation plan.

### M2 — "1/α sold as ~6× constant" — **FIXED**

Abstract: *"context management becomes a session-lifespan multiplier 1/α"* (no number); §III.3(3): *"N_del/N_in = 1/α ∈ [5.3, 11.1] across measured waves (≈6× at the central α ≈ 0.17) — a multiplier range, not a constant; α behaves as a hub policy parameter."* Recompute check: exact 1/α per wave = {5.92, 5.27, 7.22, 11.56}; from the 2-decimal rounded table values {5.9, 5.3, 7.1, 11.1}. The stated [5.3, 11.1] is the rounded-values range — fine, but the exact-data upper end is 11.6, and RESULTS F1 says "1/α spans 5.3–11.1×." State which convention the endpoints use; trivial. RESULTS F1 now retires "structural constant" in its own text ("'structural constant' retired after external review — four waves, 2.1× range"). The α-as-policy reframing is correct — my round-1 argument, adopted — and materially improves the paper.

### M3 — "Abstract misattributed INC-001 catch to escalation ladder" — **FIXED**

Abstract: *"caught not by the escalation ladder it describes but by post-wave integrity scanning, an honest datum the paper reports as such (INC-001)."* Matches INCIDENT_LOG ("Detection: post-wave integrity check … 5 min after write"). New §IV.6: *"in the runs reported here, the escalation ladder never fired … Escalation as designed remains untested under load — a limitation the institution shares about itself."* This is the sentence I said would be *more* supportive of the thesis; they wrote it. II.3 also wires INC-001 to the bracketed moral-hazard channel. FIXED, and §IV.6 is the single best paragraph added in v1.2.

### M4 — "Transcript chrome, needle tokens, debris in §IV" — **PARTIAL (95% clean; two debris classes survive elsewhere)**

- §IV.1–IV.5: all five worker sections end with *"*(needle elided in v1.2)*"* — needle tokens stripped with elision notes, as promised. `grep 'hermes --resume'` → 0. `[truncated]` → 0. I read the raw file tails to confirm the elision markers rather than trusting a truncating reader: clean.
- **Surviving debris (R2-5):**
  (a) `INTRO-OK` (line 76) and `RELATED-WORK-OK` (line 113) — two live acceptance-needle signatures in the shipped manuscript body, in the exact format IV.4 says constitutes a calibration event. The pipeline that stripped six needles in Part IV missed the two in Parts I–II. For this paper, shipping un-stripped needles is self-refuting stagecraft, still.
  (b) The intro's own line 48: *"Anthropic's A2A protocol [A2A (same as 3; authorship correction: by Google…"* — a resolver-log fragment embedded mid-sentence, and it is wrong in-line (the sentence calls A2A Anthropic's, then the bracket fragment corrects it). The corrected entry exists in §VII.a line 544; the intro was never fixed. One-line deletion.
  (c) §II Related Work still contains "(plain text draft, ~900 words)" (line 84) — worker-brief scaffolding.

### M5 — "Related Work missing 6 econ neighbors" — **FIXED**

§II.3 added with the six neighbors, led by 2610.06069, including Jensen & Meckling as the classical anchor with the moral-hazard channel explicitly bracketed. One scholarship nit: "Contracting for LLM Delegation" is named with **no identifier** — in a paper whose §VII.a brags 38 live-verified citation checks, an uncited named work in the new related-work section is an unforced error. Give it its arXiv ID or cut it.

### M6 — "Number drift across documents" — **PARTIAL**

NUMBER_SNAPSHOT.json exists, is quoted into the abstract/III.6, and its values all reproduce from the raw TSV (n=14; median 31.5 = (26+37)/2 ✅; range 7–525 ✅; CP [0.77, 1.00] ✅). III.6's "median 31.5 s as of 2026-10-08" kills the round-1 43/37/31.5 mess in the manuscript. **But the drift is not dead — it migrated:** snapshot/§III.6 say n=14 @ frozen 2026-10-08; §IX says "n=16 dispatches at revision time"; stats_live.md says 16/16. The snapshot-vs-live distinction is *declared* ("live counts may exceed the frozen snapshot by design"), which is governance, not drift — I'll allow it — but then DRAFT §III.6 should print both numbers with dates, because a careful reader computing 16 ≠ 14 has no in-manuscript reconciliation. Also RESULTS.md remains v1.1-frozen (Table 1's total row says "3 waves" over a four-wave table; F2 still says "7/7"; "admission ratio was 0.16" claim 2; F4 still makes the confounded claim) — RESULTS.md was left untouched by the revision, so every round-1 RESULTS defect (F4 ecological correlation, F5's undefined 554-char mean, the 969s/419s "wall" figures, 0.16-vs-0.137) is still alive one click from the manuscript. If RESULTS.md is an appendix artifact, stamp it v1.1 and point every number at the snapshot; as shipped, the drift persists across documents.

### M7 — "INC-002 absent from body" — **FIXED**

§IV.6: *"the one unbounded edit on record (INC-002) was committed by the hub itself"*; §IX Reflexivity: *"its incidents (INC-001..003) are its governance data."* INC-003 also now in log and referenced.

### M8 — "§VIII directives declared, never implemented" — **PARTIAL**

II.3 bucket ✅; C4a row + cite-first ✅; C5's "do NOT claim the anatomy itself as new" respected in II.3's framing ✅; directive 5 (method section) → §IX ✅. Not done: directive 1 said "foreground the synthesis + threshold inequality in title/abstract" — the abstract does this, but the **title** is still the subtitle-only "Mandates, Capabilities, Constraints, and Escalation for Machine Economic Actors" (the v0 outline's better title "From Tools to Tenants" sits unused in Appendix A). Cosmetic. Directive 2 ("Related Work must cite the strike's full set") is only partially honored — of the strike's neighbors (2608.01507, 2604.26102, 2603.22367, 2605.23071), only 2603.22367 appears, inside the VIII table. Acceptable for a position paper; noting the incompleteness.

---

## 2. NEW issues introduced by v1.2 (regressions and near-regressions)

**R2-1 (BLOCKER-grade, mechanical): the manuscript's §III.3 breakeven table is the rejected v1.1 table.** Full evidence in §1/B3. The single most damaging fact: my round-1 verification table's "❌" row (p=0.7, w/h=30, "T ≈ 61" vs true 50.6) is *still printed in the paper*, while the corrected table exists 30 cm away in part3_math.md. Additionally the new garbled line "T ≥ 57/15/…" contains an ellipsis where two numbers should be. This is INC-003's failure mode recurring inside the fix for INC-003.

**R2-2 (MAJOR, honesty-of-self-report): §IX.b / provenance note overclaim resolution status.** The provenance note says *"All BLOCKER findings are resolved in this revision"* and §IX.b lists the breakeven failure among items *"all resolved in v1.2."* B3 was not resolved in the manuscript. A paper about verification gates whose revision-summary gate passes on unverified self-report is the fourth consecutive instance of the same failure family (worker INC-001 → hub-as-editor INC-002 → hub-as-verifier INC-003 → hub-as-reviser, this review). The fix is one sentence plus one table; the lesson is the paper's own.

**R2-3 (MAJOR, still): T remains unmeasured and §III.3 still says "all measured or bounded."** Line 177: *"Three regimes, all measured or bounded"*; line 188: *"A working session in our logs routinely runs 40–80 further turns after an artifact lands"* — still no query, no log pointer, no distribution; my round-1 question 3 is unanswered anywhere in v1.2. The hub log exists (stats_live.md reports 17.5 MB / 27K+ messages); a turns-after-artifact histogram is a one-liner against it. Until then, regime (2) is illustration wearing measurement's clothes, and at the CP lower bound p = 0.768 the w/h=30 breakeven is T* ≈ 46.1, straddling the asserted window — as in round 1. Also the paid-regime text inherits the stale table, so the regime's only quantitative support is currently wrong *and* unmeasured.

**R2-4 (MINOR-to-MAJOR): IV.5's escalation term still doesn't follow from the model of record** — algebra in §1/B2. `−ε(1−p)/S` is the exact term; `−(ε/h)·κ(η)` is not derived and is not dimensionally commensurate with the LHS as written. Three lines of derivation or delete the formula and keep the prose.

**R2-5 (MINOR): surviving chrome** — `INTRO-OK`, `RELATED-WORK-OK`, the broken A2A fragment at line 48, "(plain text draft, ~900 words)". List provided so none can be missed.

**R2-6 (MINOR): RESULTS.md was not revision-controlled with the paper.** All round-1 RESULTS defects (F4's confounded claim, F5's unrecomputable method, "wall" figures, 0.16, "3 waves" label) persist unflagged. Either update it in lockstep or mark it frozen-v1.1 with a pointer to NUMBER_SNAPSHOT.json.

---

## 3. Re-verifications that PASS (credit, with receipts)

1. **p̂ = 14/14, CP 95% [0.768, 1.000]** — recomputed; abstract states it correctly, probe excluded variant disclosed.
2. **Median duration 31.5 s** (n=14, even-n) — snapshot correct; manuscript correct; instrument's own p50=32 (int-indexing) is within 0.5 s and now irrelevant since the DRAFT cites 31.5.
3. **α wave arithmetic** — 0.169 / 0.190 / 0.138 / 0.087 reproduce from RESULTS Table 1; pooled-all4 0.137, first-3 0.158; the abstract's [0.09, 0.19] and "≈6× at central α≈0.17" are consistent statements of one dataset. One α summary survives in the paper. (Intro's "17%" is wave-1-only, unlabeled — label it or pool it; minor.)
4. **part3_math.md breakeven recompute** — all six entries correct to rounding (59.2/79.3/119.5; 24.8/33.4/50.6). The math is right; the plumbing failed.
5. **hf_dispatch.sh is now in evidence and does what §IX says**: needle grep-gate (line 57–58), TIMEOUT verdict path (line 52), schema-v2 append with artifact_s/admitted_s (lines 49–54), artifact extractor stripping box-drawing chrome (lines 32–47). Round-1's "acceptance gate not in evidence" is cured. Verified live: two post-patch probe rows logged with artifact_s ∈ {0, 185}.
6. **Free-lane corollary** — still correct, still the paper's most robust result; §III.5's threats section unchanged and still honest.
7. **Existence proof** — the TSV now accumulates across paper *and* operational dispatches (per §III.6), the incident log grew a third entry whose lesson is the correct one, and the revision log maps every finding to a disposition. The bookkeeping culture I praised in round 1 is intact.
8. **F4 re-check (adverse to the paper, so stated):** pooled Pearson from the TSV is now r(dur,msgs)=0.851 vs r(dur,chars)=0.896 — **duration tracks chars better than msgs even pooled**, and within deepseek (the only worker with message variance) chars still wins (0.884 vs 0.767). RESULTS F4's "message count is the attempt-level predictor" is contradicted by the instrument under both the pooled and within-worker tests. The DRAFT's §III.6 only says "msgs is our attempt-level signal." Weaken F4 or drop it in v2.2; as written it is an unsupported claim surviving from v1.1.

---

## 4. Reflexivity audit, round 2

Round 1: "rigorous in the lab notebooks, gimmick-adjacent in the manuscript." v1.2 moves the manuscript most of the way to the notebooks' standard: INC-001's attribution is now accurate, IV.6 is a model of institutional self-report, IX.b publishes the review scores and the worst findings against itself, and the incident log's escalation chain (worker → hub-as-editor → hub-as-verifier) is genuinely novel governance data. Two deductions keep this from full credit:

1. The revision itself was shipped without the negative-assertion gates that INC-003 declares as the fix (R2-1/R2-2). The reflexive method currently has an excellent *reporting* loop and an unreliable *enforcement* loop. Wire `v12_*.py`-style pre/post-state assertions into the assembly pipeline and make the pipeline runnable from the paper directory; until then "method" is at self-report strength.
2. C6 remains externally unvalidated — §IX.b's reviewer panel is LLM agents, i.e., the same species as the workers (the paper says so itself, which is to its credit). One human pass over the novelty audit remains the cheap, missing check.

---

## 5. Answers to my round-1 questions (for the record)

1. *Reproduce α from the TSV alone* — cannot, still; now declared, logging live since 2026-10-08, zero adjudicated rows yet. Accepted as v2 scope.
2. *Exact predicate per verdict* — now answerable: grep on needle + rc==0 (hf_dispatch.sh lines 52, 57–60), with §IX(4) declaring needle-pass necessary-not-sufficient. Variant-needle discrimination (INC-001 class) remains *undetectable by the instrument* — it is caught by out-of-band audit; this should be stated in §III.6, not just §IX.
3. *Where does 40–80 turns come from* — unanswered. Still required (R2-3).
4. *Which inequality is the model of record* — (★), everywhere except IV.5's residual term (R2-4).
5. *1/α law under compaction* — not addressed in v1.2. The hub's own 75-day, multi-compaction session still contradicts regime (3)'s no-compaction premise, K is still unmeasured, and "compaction" appears zero times in DRAFT.md. Downgrade (3) to "budget regime in the absence of compaction; compaction-era law deferred to v2" or derive the modified law. Carried to the required list.

---

## 6. Scores

| Dimension | R1 | R2 | Note |
|---|---|---|---|
| Novelty of synthesis | 7 | 7 | Unchanged; 2610.06069 now properly absorbed, delta statement fair |
| Formal model | 5 | 6 | One inequality of record; IV.5 term still underived; regime-3/K and compaction still unhandled |
| Empirical support | 2 | 4 | CI + downgrade + instrument patch are real; breakeven table stale in DRAFT; T unmeasured; F4 contradicted by own TSV |
| Internal consistency | 2 | 4 | 75×/median/α-spread fixed; stale table, "all BLOCKERs resolved" overclaim, RESULTS.md left behind, surviving chrome |
| Instrument quality | 3 | 5 | Schema v2 live, dispatcher in evidence, snapshot frozen; no negative control, no hash, zero adjudicated α rows |
| Reflexive method | 6 | 7 | IV.6 + IX.b are genuinely good; enforcement loop failed its own gate this round |
| Scholarship | 6 | 7 | II.3 solid; one uncited named work; directive-2 citation set incomplete |
| Clarity | 6 | 6 | Better abstract; garbled breakeven line and resolver fragment in intro |
| **Overall** | **4** | **5** | |

## 7. Recommendation: **MINOR REVISE** — with a hard checklist

Round-1 blockers B1, B2, B5: cleared. B3: the math is fixed in the aux file and must be propagated — that plus the two sentences below is the whole gap to a defensible post. B4: honestly partial, v2 scope, accepted at this bar. To be explicit per the re-review instructions: **v1.2 clears my round-1 blockers except B3-in-the-manuscript and B4's declared remainder; none of the remaining work requires new experiments.**

**Required before posting (days, not weeks — all mechanical):**
1. Replace DRAFT §III.3 lines 184–186 with the part3_math.md table (59/79/119; 25/33/51; keep the p=.5 row at 35) and delete the garbled "57/15/…" line. Assert absence of "T ≈ 61" and "57/15" post-edit — run the INC-003 discipline on this edit specifically.
2. Correct the two overclaim sentences: provenance note "All BLOCKER findings are resolved" → "resolved except the breakeven table (fixed in this pass)" or equivalent post-fix truth; §IX.b likewise.
3. Strip `INTRO-OK`, `RELATED-WORK-OK`, the line-48 A2A resolver fragment (fix the sentence to attribute A2A to Google), and "(plain text draft, ~900 words)".
4. Fix IV.5's term: either derive `−ε(1−p)/S` from III.2 in three lines or state IV.5's κ-form as a heuristic overlay, not an inequality.
5. "All measured or bounded" → "measured, bounded, or asserted (T)" until T is measured; add the turns-after-artifact query against the hub log — it is a one-liner and would upgrade regime (2) from illustration to measurement.
6. Weaken or withdraw RESULTS F4 (your own TSV refutes it pooled and within-worker); stamp RESULTS.md as v1.1-frozen or sync it; label the intro's "17%" as wave-1; state the 1/α endpoint convention (5.3–11.1 rounded vs 5.3–11.6 exact).
7. Add one negative-control brief to the instrument queue (a brief engineered to fail) so p's outcome distribution stops being degenerate; include a TSV hash in NUMBER_SNAPSHOT.json.
8. Add one sentence to §III.6 or §IX: the instrument cannot detect INC-001-class variant-needle events; those are caught by out-of-band audit only.
9. One human pass over the §VIII novelty verdict, or an explicit "no human has checked this" caveat next to "0 claims DEAD."

Items 1–4 are preconditions for posting; 5–9 are strongly recommended and can land with the v2 instrument work.

---

## Top findings this round

1. **BLOCKER (mechanical) — R2-1:** the manuscript's breakeven table is the stale v1.1 table my round-1 review rejected; the corrected table exists in part3_math.md and was never propagated; a garbled half-edited line ("T ≥ 57/15/…") ships in §III.3. INC-003's failure mode, recurred inside its own fix.
2. **MAJOR — R2-2:** §IX.b and the provenance note assert "All BLOCKER findings are resolved in this revision" — false for B3 as shipped. The paper's self-verification claims must be held to its own negative-assertion standard.
3. **MAJOR — R2-3/R2-4:** T remains unmeasured under an unchanged "all measured or bounded" banner, and IV.5's escalation term still doesn't follow from the model of record. Both are the residue of round-1 findings 2 and the formal-core defect, now reduced but not zero.

*All recomputations reproducible from `~/.hermes/scripts/hf_stats.tsv` (16 rows, schema v2), `part3_math.md`, and `hf_dispatch.sh` as of 2026-10-08. — REVIEWER A, round 2.*
