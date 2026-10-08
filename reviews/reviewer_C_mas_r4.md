# HOSTILE RE-REVIEW ROUND 4 — REVIEWER C (Multi-Agent Systems / Agent-Governance) — impact-assessment round

**Paper:** *Agentic Institutions* (Draft v1.4.1, 2026-10-08)
**Reviewer role:** unchanged from rounds 1-3 — MAS / multi-agent-systems researcher
(mandates, escalation, institutional design). This round's PRIMARY question: impact of
the v1.4/v1.4.1 fixes — which of my round-3 findings genuinely died, at what severity,
and did anything regress? I verify from raw files only; I never trust the paper's
claims about itself.
**Materials reviewed (full):** DRAFT.md v1.4.1 (607 lines, 79.6K), my own
reviews/reviewer_C_mas_r3.md, REVISION_LOG.md (round 3 + round-4 residual sweep),
INCIDENT_LOG.md (INC-001..INC-005), NUMBER_SNAPSHOT.json, part3_math.md, RESULTS.md,
`~/.hermes/scripts/hf_stats.tsv` (live, 22 data rows), and `~/.hermes/state.db`
(READ-ONLY, SELECT only) via the exact SQL that §III.3 publishes.
**Verification method:** every r3 finding (issues #1-#3 AND the residuals I named
inside my r3 tables) re-checked against v1.4.1 bytes with grep-confirmed line evidence;
T3 re-derivations run against raw TSV + state.db + arithmetic; regression + fabrication
hunts run against the manuscript and instrument. I ran the published T-measurement
query myself. The paper dir is under git as claimed (commits 4f7b8e8 v1.4 baseline,
420beaa / 06e9193 v1.4.1 sweep — all present; `reviewer_{A,B}_mas_r4.md` currently
untracked, i.e. my sibling reviews in flight).

---
## T1 — Dispositions of my round-3 findings (each with verbatim v1.4.1 evidence)

Round-3 scorecard (issues #1-#3 + the residuals I named inside r3 §1 and §4 tables):

| Finding (r3) | Verdict in v1.4.1 | Verbatim evidence |
|---|---|---|
| **r3 Issue #1** (MAJOR) IV.5 "cost-optimal path" overclaim on the escalation ladder | **FIXED** | DRAFT L284: "This ladder — retry → partial read → brief rewrite → human — is not a suggestion; it is the institution's escalation policy (cost-rationalized, not yet derived as optimal), and it remains untested under load (§IV.6)." grep `cost-optimal path` = 0 document-wide. |
| **r3 Issue #2** (MAJOR) RESULTS F1 α-table provenance gap; `[M]` tag overstates instrument reproducibility | **FIXED** | RESULTS L21-23: "PROVENANCE (v1.4, per INC-004 doctrine): of the per-wave produced-char sums, only wave 3's matches hf_stats.tsv exactly (50,567); waves 1/2/4 diverge (22,824 vs 2,835; 23,440 vs 20,692; 40,447 vs 40,441) because TSV `chars` logs first-pass dispatch output …" — I re-computed all four sums from the TSV; every divergence it quotes is exactly right. The `[M]` overstatement is now disclaimed in the same block. |
| **r3 Issue #3(i)** (MINOR) §III.6 median staleness (31.5 s no longer current) | **FIXED** | DRAFT L241: "duration 7–525 s (median 31.5 s (frozen at the v1.2 snapshot, n=14; the live-TSV median drifts as rows accrue))". Frozen-n=14 qualifier added. |
| **r3 Issue #3(ii)** (MINOR) §VII empty stub; refs after Appendix B | **FIXED** | DRAFT L332-337: "## VII. REFERENCES (registry-verified 2026-10-07)" now carries substantive prose ("References are inline throughout (author-year + arXiv ID at first use). The full resolution log — 26/26 placeholders resolved … is §VII.a below"), and §VII.a sits beneath the §VII header rather than after Appendix B. |
| **r3 Issue #3(iii)** (MINOR) uncited "Mandate marketplaces exist in prototype" | **FIXED** | DRAFT L306: "Mandate marketplaces exist in prototype (agent dispatch systems with brief auctions; cf. the agent-commerce systems surveyed in §II)". Survey anchor added (internal cross-ref rather than a formal citation — acceptable for an existence claim with a §II pointer). |
| **r3 §1 N6 residual** 185× in abstract without denominator caveat | **FIXED** | Abstract L21-22: "(185× against deliverable artifacts; denominators' window caveat in §III.6)" — §III.6 L244-247 now states the dual denominator windows explicitly. |
| **r3 T4 residual** part3_math side-file "1/α ≈ 5.9" echo | **FIXED** | part3_math.md L68 now reads "N_del/N_in = 1/α ∈ [5.3, 11.1]"; grep `1/α ≈ 5.9` / `≈ 5.9` in part3_math = 0. (Only surviving "T≈61"/"T≥15" tokens are in part3_math L52, inside the correction-note explaining which OLD entries were replaced — historical, not live.) DRAFT L596 changelog: "part3 5.9 residue killed." |
| **r3 §1 F3 residual 2** no as-implemented-vs-as-specified table | **PARTIAL (unchanged, still declared v2)** | DRAFT L603 lists "v2 = negative-control briefs, measured p/T distributions, T instrumentation, as-implemented table." Declared honestly, still not delivered — status quo, not a regression. |
| **r3 §4 Claim A residual** "wave-1 calibration run" = 7/7 collides with RESULTS wave-1 = 2 dispatches | **NOT FIXED (MINOR)** | DRAFT L270: "A 7/7 hit rate in the wave-1 calibration run (all seven briefs accepted; the cumulative frozen rate is 14/14 — §III.6)". Still uses "wave-1" for a 7-dispatch grouping that does not correspond to RESULTS.md Table 1's "Drafting (outline+related) | 2". TSV-consistent (first 7 dispatches all verdict=OK) but the taxonomy collision I flagged in r3 is unchanged — see Issue #2 below. |

**Net:** 8 FIXED / 1 PARTIAL (unchanged, honest) / 1 NOT-FIXED (MINOR) — versus r3's
14 FIXED / 2 PARTIAL / 2 MINOR / 1 residual. Every substantive r3 issue died.

---
## T2 — Impact score and regressions

**Findings killed, by severity:** My two r3 MAJORs (Issue #1 IV.5 overclaim; Issue #2
F1 provenance) are both FIXED with verbatim evidence above — dead. My three bundled
MINORs (median, §VII stub, uncited mandate marketplaces) all FIXED. The r3-noted N6
(185× caveat) and part3 "1/α ≈ 5.9" side-file echo also FIXED. Only my MINOR
"wave-1" label collision survives, plus the (unchanged, honestly declared) as-implemented
table remains v2 scope.

**Regressions:** NONE. T4 hunt is clean across every historical-failure string (see T4).
No previously-clean manuscript text that v1.4/v1.4.1 touched was broken; the two new
commits (420beaa, 06e9193) are additive residual sweeps that I verified landed
(REVISION_LOG round-4 rows all match present v1.4.1 bytes).

**Does the score move?** Yes, directionally up — then flat against a new finding.
All three of my r3 issues and every residual I named are fixed, and the revision is a
genuine byte-level sweep (not silencing). But T3(b) surfaces a fresh MAJOR
reproducibility defect on the headline empirical constant T=277 (the r3-A#1 fix), which
keeps the total at 8/10 rather than 9. Impact of the *fixes* is strongly positive; the
headline number the fixes introduced is itself not reproducible as published.

---
## T3 — Re-derivations from raw files (trust nothing)

**(a) Breakeven T at α=0.17, T=(w/h)/(p·(1−α))−1.** p(1−α)=0.83·p:
- p=0.3: 15/0.249−1 = 59.2 | 20/0.249−1 = 79.3 | 30/0.249−1 = 119.5 → mins 60/80/120 ✓
- p=0.5: 15/0.415−1 = 35.1 → min 36 ✓
- p=0.7: 15/0.581−1 = 24.8 | 20/0.581−1 = 33.4 | 30/0.581−1 = 50.6 → mins 25/34/51 ✓

All §III.3 cells (DRAFT L181-184) re-derive exactly, including the strict ceiling. The
T=40 alive-set claim (L184: alive {p=0.5@15 35.1, p=0.7@15 24.8, p=0.7@20 33.4}; dead
{p=0.7@30 50.6 + all p=0.3}) is arithmetically correct: exactly those breakeven cells
fall strictly below T=40. ✓

**(b) T-measurement — I ran the published query verbatim against ~/.hermes/state.db:**
`SELECT COUNT(*) FROM messages WHERE session_id='20260725_131848_6f3bc9c8' AND role='assistant' AND timestamp >= strftime('%s','2026-10-07 13:18:00');`
Three runs a few minutes apart returned **274, 276, 308** — a moving target within a
live session (session holds 28,531 messages; 13,772 assistant-role). The published
value and the snapshot are **277** (NUMBER_SNAPSHOT.json `supplement_v1_4.t_measurement_count_at_v14: 277`).
**The frozen 277 is not recoverable from the current database by the published query.**
The paper's tagline "Reproducible query (v1.4) … -> 277 at v1.4 freeze (monotone in hub
lifetime)" (L189) is not reproducible as stated: the count has since grown past 277
(→308) and, under concurrent write load, transiently read *below* it (274/276). Because
this is exactly the INC-005 failure family ("a measurement is a query + its provenance,
never a remembered number"), the fix for the unreproducible-296 shipped a fresh number
that the same doctrine cannot verify. **Consequence note:** this does NOT overturn the
economic conclusion — even the lowest live read (274) exceeds the largest breakeven
threshold (T>119.5 at p=0.3,w/h=30), so "T clears every cell" survives — but the
reproducibility warrant fails on the paper's own rule. See Issue #1. (It is also worth
recording that the fix's own provenance is the hub's working memory at a freeze point,
not an immutable DB snapshot the query re-evaluates to.)

**(c) CP bound.** 0.025^(1/14) = **0.7684**. Abstract L25 "[0.77, 1.00] at n=14" and
NUMBER_SNAPSHOT `phat_cp95: [0.77, 1.00]` round correctly. ✓ (0.025^(1/13) = 0.753 for
the n=13 no-probe variant; the paper uses n=14, consistent with §III.6 "n includes one
connectivity probe".)

**(d) Median duration from hf_stats.tsv — n used: 14** (the 2026-10-07 frozen session,
rows 2-15 of the TSV: 37,43,24,109,479,525,7,24,25,25,25,26,163,234). Sorted:
7,24,24,25,25,25,**26,37**,43,109,163,234,479,525 → (26+37)/2 = **31.5** ✓, matching
DRAFT §III.6 with the frozen-n=14 qualifier now attached. For completeness, the live TSV
now holds **22 data rows** (14 frozen + 2 probes + 3 r3 reviews + 3 r4 reviews), of which
the newest (review4_C, this review) is verdict=TIMEOUT, budget 900 s, admitted 10497 —
i.e. the instrument's all-OK run already contains a non-OK row and the frozen
"14/14"/"16/16" claims are increasingly stale (declared drift, §III.6/§IX).

---
## T4 — Regression hunt (DRAFT.md, dash/unicode variants included)

| String | grep result |
|---|---|
| `75×` / `75x` | 0 |
| `T ≈ 61` (spaced) | 0 (only `T≈61` in part3_math L52, inside the correction note for *removed* entries) |
| `57/15` | 0 |
| `failure probability` | 0 |
| `147 brief` | 0 |
| `four concurrent` | 0 |
| `30-second windows` | 0 |
| `INTRO-OK` | 0 |
| `RELATED-WORK-OK` | 0 |
| `v1.1 COMPLETE` | 0 |
| `cost-optimal control law` | 0 |
| `cost-optimal path` | 0 |
| `296` | 0 |
| `40–80` (en-dash), `40-80` (hyphen), `40‑80` | all 0 |
| `K = the binding budget` | 0 |
| `reinterpretng` | 0 |
| `PAPER-OUTLINE-OK` | 0 |
| `CITATIONS-RESOLVED-OK` | 0 |
| `(paging` | 0 (C3 "2603.22367" now stated as "static-context executor architectures (O(1) window, no paging)" — L386, de-paged as REVISION_LOG round-4 claims) |
| `≈ 5.9`/`1/α ≈ 5.9` | 0 (six `5.9` hits are all false positives from ERC-**519**2 substrings — no residue) |

**Regression hunt: CLEAN.** No previously-fixed text regressed; the INC-004 fabricated
strings remain absent from the manuscript (correctly present only in INCIDENT_LOG.md as
the incident record).

---
## T5 — Fabrication hunt (3 quantitative claims in §IV traced to instrument)

**Claim A — §IV.4 L270: "A 7/7 hit rate in the wave-1 calibration run (all seven briefs
accepted; the cumulative frozen rate is 14/14)".** Trace: hf_stats.tsv first 7 data rows
(rows 2-8: outline 37 s, related 43 s, intro 24 s, cites 109 s, priorart 479 s, strike
525 s, probe 7 s) all verdict=OK → **7/7 consistent**. Not fabricated. The residual
defect is the label collision with RESULTS wave-1 (2 dispatches) — Issue #2.

**Claim B — §IV.4 L274-275: "16 serial dispatches, 16/16 first-try needle accepts, zero
retries, zero escalation events — and no acceptance windows or deadline alarms
implemented at all".** Trace: at §IV.4 authoring time the TSV held 16 data rows (14
frozen + 2 post-freeze probes), all verdict=OK, each brief once → **16/16, zero retries
consistent**; matches INCIDENT_LOG INC-004 exactly. Not fabricated. (The live TSV has
since grown past 16 and now contains a TIMEOUT row — drift, declared, Issue #3.)

**Claim C — §IV.4 L276-280: "That channel cannot detect INC-001-class variant-needle
events; those are caught by out-of-band mandate-compliance audit only (§IV.6)."** Trace:
INCIDENT_LOG INC-001 (unauthorized DRAFT.md insert, variant needle, caught by mtime +
signature scan 5 min after write, described as "post-wave integrity scan", not the
architecture) → **fully grounded**. Not fabricated.

**Sibling scan (INC-004/INC-005 doctrine):** the strongest sibling-shaped defect is NOT a
fabricated number but the **T=277 non-reproducibility** (T3b) — a hub-measurement
provenance failure, the exact INC-005 class, not a fabrication (the manuscript is
transparent that it is frozen and monotone). I found **no invented quantitative claim** in
§IV/§V: every §IV number I tested traces to the TSV or INCIDENT_LOG, and §V contains
essentially no hard numbers to fabricate (its claims are qualitative market-structure
arguments). The one number floating free of instrument provenance in the manuscript is
277, which the manuscript itself cites as "frozen", not as a live instrument read.

---
## T6 — Verdict

**Score: 8/10.** Round trajectory: 4 → 5 → 8 → (this) 8. Impact of the v1.4/v1.4.1
fixes is strongly positive and byte-verified: both my r3 MAJORs and all three bundled
MINORs are fixed with verbatim evidence, every residual I named inside r3 tables is
dispositioned (185× caveat, part3 echo, §VII, mandate-marketplace anchor), and the
regression hunt is clean. The revision is a genuine sweep, not a silencing. It stays at
8 rather than moving to 9 because the r3-A#1 fix — replacing the unreproducible "296"
with a published-query "277" — shipped a headline constant that, run verbatim against
the current state.db, returns a moving ~274-308 and not 277; the reproducibility warrant
the fix was meant to supply is not satisfied under the institution's own INC-005 rule.
Consequence-neutral for the economic conclusion, but a warrant gap on the paper's most
advertised empirical number.

**Recommendation: MINOR-REVISE.**

**Remaining issues (≤3):**

1. **MAJOR — the published T-measurement query does not reproduce the frozen 277.**
   DRAFT L189 "Reproducible query (v1.4): sqlite3 … -> 277 at v1.4 freeze (monotone in
   hub lifetime)" and NUMBER_SNAPSHOT `supplement_v1_4.t_measurement_count_at_v14: 277`
   — but running that exact query against ~/.hermes/state.db now yields 274/276/308
   (live, moving), never 277, and it even transiently reads *below* the frozen value.
   This is the INC-005 family: a frozen remembered number with a query that no longer
   evaluates to it. One-line fix per the paper's own doctrine: freeze the measurement to
   an immutable artifact (a DB snapshot hash or a freeze-commit's recorded result) so the
   "reproducible query" actually returns the frozen value, or relabel it as a live range
   (≈274-308) and drop "-> 277". Note in the text that the conclusion is robust to this
   (all readings ≥ 274 > max threshold 120).

2. **MINOR — "wave-1" is used for two incompatible groupings.** §IV.4 L270 "wave-1
   calibration run" = 7 dispatches vs RESULTS.md Table 1 "Wave … Drafting (outline+
   related)" = 2 dispatches. REVISION_LOG round-4 asserts the wave label resolved the
   bare-7/7, but the label as used still collides with RESULTS' wave taxonomy. Rename
   the §IV.4 calibration grouping (e.g. "first-day calibration set") or reconcile it with
   RESULTS' wave labels.

3. **MINOR — the frozen acceptance headline is drifting against a live, now-non-OK
   instrument.** §IV.4 "16 serial dispatches, 16/16 … zero retries" and §III.6 "p̂=14/14"
   are frozen statements, yet the live hf_stats.tsv already holds 22 data rows and its
   newest row (review4_C, 2026-10-08 21:34, 900 s) is verdict=TIMEOUT with 10,497 admitted
   chars — the first non-OK row in the instrument. The drift is declared (§III.6, §IX),
   so this is a bookkeeping note, not a defect; but a reader opening the current TSV and
   the frozen "16/16, zero retries" will see a contradiction. Add a one-line "frozen at
   n=16; instrument now n=22 and has observed its first timeout" qualifier beside the
   claims.

None of these is a BLOCKER. The manuscript's two load-bearing claims — that §III.3's
breakeven arithmetic is machine-correct (re-derived exactly, T4-clean) and that its
reflexive honesty is real rather than performative — survive hostile re-derivation this
round, with the T=277 provenance gap the single substantive residue between "revised"
and "a paper that fully executes its own provenance doctrine."

---
REVIEW4-C-OK
