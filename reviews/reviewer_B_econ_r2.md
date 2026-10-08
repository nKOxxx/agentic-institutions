# Re-Review Round 2 — Reviewer B (Economics of AI / Market Design / Principal-Agent Theory)

**Paper:** *Agentic Institutions* (DRAFT.md v1.2, 2026-10-08)
**Round-1 review:** reviews/reviewer_B_econ.md (score 4/10, MAJOR REVISE)
**Verification basis this round:** I re-derived every breakeven cell from (★) by exact
inversion `T > (w/h)/(p(1−α)) − 1` at α = 0.17; recomputed the Clopper–Pearson lower
bound (0.025^(1/14) = 0.768 → 0.77), the 1/α range (1/0.19 = 5.26, 1/0.09 = 11.11),
the n=14 duration median from the raw TSV (26,37 → 31.5 ✓), and RESULTS.md's totals
(137,278 / 18,800 → α = 0.1369); diffed DRAFT.md against REVISION_LOG's disposition
claims with literal string searches; live-checked the one arXiv ID v1.2 adds
(2609.05531 = "When Agent Governance Helps" — exists, fairly characterized).

---

## 1. Headline

The **abstract repair is real and good**. The **body repair is half-fake**: the round-1
BLOCKER breakeven row — the arithmetically impossible `T ≥ 57/15/…` — **still stands in
DRAFT.md III.3(2)**, corrected only in a side file (part3_math.md) that the manuscript
never references; and the IV.5 escalation term, which REVISION_LOG B2 declares
"unit-normalized," **is still dimensionally incoherent** — the new normalization clause
is itself arithmetically false. Two of my five round-1 blockers are genuinely cleared;
two partially; one survives exactly where it did the damage, in the manuscript.

There is also a reflexive finding the authors, of all people, should appreciate:
**the v1.2 revision process repeated INC-003 on its own repair.** INC-003's lesson
(INCIDENT_LOG.md) is "a gate that cannot fail is not a gate — assert the negative."
The revision asserted the *presence* of the new table in part3_math.md and never
asserted the *absence* of the old numbers in DRAFT.md. REVISION_LOG says "All BLOCKER
findings are resolved in this revision" (DRAFT provenance note, line 39). They are not.
A paper whose thesis is institutional verification honesty submitted a revision whose
verification gate passed the same way its INC-003 gate did.

---

## 2. Disposition of my round-1 findings

### Round-1 BLOCKER 1 — "Breakeven surface does not reproduce; one entry arithmetically impossible"

**PARTIALLY FIXED — fixed in the satellite file, not in the paper under review.**

- part3_math.md (lines 51–55) now carries the recomputed surface: "breakeven surface
  recomputed from (★) at α = 0.17 (v1.2; replaces table that failed external
  reproduction — old entries T≥15 @ w/h=20,p=.3 and T≈61 @ p=.7,w/h=30 were
  arithmetically impossible / α-contaminated)". I verified all six cells against exact
  (★) inversion at α=0.17:

| cell | paper v1.2 | exact T* | verdict |
|---|---|---|---|
| p=.3, w/h=15 | T ≥ 59 | 59.24 | **off by one, optimistic** (at T=59: 0.3·60·0.83 = 14.94 < 15 — fails) |
| p=.3, w/h=20 | T ≥ 79 | 79.32 | **off by one, optimistic** (T=79 → 19.92 < 20) |
| p=.3, w/h=30 | T ≥ 119 | 119.48 | **off by one, optimistic** (T=119 → 29.88 < 30) |
| p=.7, w/h=15 | T ≥ 25 | 24.82 | ✓ (T=25 → 15.11 > 15) |
| p=.7, w/h=20 | T ≥ 33 | 33.42 | **off by one, optimistic** (T=33 → 19.77 < 20) |
| p=.7, w/h=30 | T ≥ 51 | 50.64 | ✓ (T=51 → 30.21 > 30) |

  The recomputation is genuine — monotone in w/h at fixed p, correct α, impossible row
  gone. But four of six cells are floor-rounded where the semantics ("T ≥ N") demand
  ceiling: **every truncated cell fails its own stated threshold by one turn.** The
  replacement table is itself sloppy in the flattering direction.

- **DRAFT.md — the artifact a reader actually reads — was never touched.** DRAFT.md
  III.3(2) still prints, verbatim: "`p = 0.3 → need T ≥ 57/15/… turns for w/h = 15/20/30`"
  and "`p = 0.7 → w/h = 30 breaks even at T ≈ 61 remaining turns`". The impossible
  non-monotone row and the α-contaminated row are both still load-bearing in the
  manuscript. The string "breakeven surface recomputed" appears nowhere in DRAFT.md.
  A revision log line ("recomputed from (star) in part3_math.md") that is literally
  true while the manuscript keeps the wrong numbers is the INC-003 failure mode
  again: verified presence of the fix, never absence of the defect.

**Not cleared.**

### Round-1 BLOCKER 2 — "The paper's own measurements contradict its own laws' assumptions"

Sub-findings:

- **(i) 1/α sold as a constant → FIXED.** DRAFT III.3(3): "N_del/N_in = 1/α ∈ [5.3,
  11.1] across measured waves (≈6× at the central α ≈ 0.17) — a multiplier range, not
  a constant; α behaves as a hub policy parameter." Bounds verified: 1/0.19 = 5.26,
  1/0.09 = 11.11. Abstract carries "α ∈ [0.09, 0.19] across four task waves." This is
  exactly the fix I asked for.
- **(ii) Abstract's 46,264/~14% denominators → FIXED.** Zero occurrences of 46,264 or
  "~14%" in v1.2. Abstract now uses the reconciled counts (14 dispatches; wave range).
- **(iii) Retracted 75× in abstract → FIXED.** Zero occurrences of 75× in DRAFT.md.
  Abstract now: "a 2× hub:worker traffic asymmetry (185× against deliverable artifacts)
  in the institution's own logs." RESULTS.md F3 carries both honest denominators;
  NUMBER_SNAPSHOT freezes "2x traffic / 185x artifact." Consistent.
- **(iv) IV.5's `w/h < p(1+T)(1−α) − ε·κ(η)` subtracts a char-denominated term from a
  dimensionless ratio → NOT FIXED, and the claimed fix is false.** v1.2 IV.5 now reads:
  "> (w/h) < p·(1+T)·(1−α) − (ε/h)·κ(η), where ε is expected escalation cost in
  hub-token terms, normalized by h so both sides carry the same units." This does not
  parse. (w/h) is dimensionless (price/char over price/char). ε in hub chars divided by
  h (price/char) has units chars²/price — not dimensionless. Dividing by h alone cannot
  strip the char dimension; the correct dimensionless escalation term from the Part-III
  cost law is `(ε/S)·(1/p−1)/(1+T)·κ(η)` (equivalently ε/(hS(1+T)) if ε is priced) —
  the term (★)'s own derivation produces when you retain it instead of dropping it.
  REVISION_LOG B2 claims "IV.5 term unit-normalized." **It is not.** A disposition that
  misstates its own arithmetic is worse than no disposition: it converts an error into
  a false claim of repair. Also note the run-on "…same units where κ captures…"
  (grammatically broken sentence at the paper's only attempted generalization of (★)).

**Blocker 2: three of four sub-findings genuinely cleared; (iv) not cleared.**

### Round-1 BLOCKER 3 — "Moral hazard modeled away; p endogenous; 14/14 uninterpretable; own incident unconnected"

**PARTIALLY FIXED — the honesty repairs are real; the mechanism-design gap is
declared, not closed.**

- **Clopper–Pearson CI: FIXED and verified.** Abstract: "First-try acceptance carries a
  Clopper–Pearson 95% CI of [0.77, 1.00] at n=14." Recomputed: 0.025^(1/14) = 0.768 ✓.
  III.6 additionally discloses the probe row: "n includes one connectivity probe —
  excluding it, 13/13" — verified against the TSV (row 8, hf_probe2.txt, is the probe;
  14 rows through 2026-10-07, 13 non-probe). This is precisely the repair I demanded.
- **INC-001 ↔ moral hazard connection: FIXED.** New §II.3: "Jensen & Meckling (1976) as
  the classical anchor whose moral-hazard channel our first-pass model deliberately
  brackets (INC-001 is the empirical existence proof that the channel is real…)." New
  §IV.6: "in the runs reported here, the escalation ladder never fired. INC-001 … was
  caught by the hub's post-wave integrity scan, not by the architecture above." The
  abstract now attributes the catch correctly. IV.6 is the single best paragraph added
  in v1.2.
- **p endogeneity / needle informativeness / identification condition: NOT FIXED
  (declared out of scope).** Nothing in v1.2 models needle choice as contract design or
  gives an informativeness condition separating worker quality from needle laxity. II.3
  now *names* the bracket honestly, which for a position paper I am prepared to count
  as partial credit — but the abstract still deploys "p̂ = 14/14" as headline evidence
  (now CI-armored), and the paper still has no answer to "your workers write the
  needles they pass." The opportunity I flagged (needles as contract instruments) remains
  unclaimed real estate.

### Round-1 BLOCKER 4 — "VIII omitted its own strike's MOST-DANGEROUS prior art (2610.06069)"

**FIXED.** New §VIII row C4a: "2610.06069 Attention/Handoff Tax — our own strike's
MOST-DANGEROUS paper; formalizes the same tradeoff with human-subject validation (added
v1.2 after external review caught its omission)" with the delta ("per-attention pricing
vs our session-amortized dominance"). New §II.3 leads with it. The abstract now states
the dual ("a mechanism-level dual of recently observed evaluation-abundance phenomena"),
implementing directive #4. Characterization fair; I verified this paper live in round 1.

### Round-1 BLOCKER 5 — instrument/α not recomputable

**FIXED by declaration (acceptable).** REVISION_LOG B4 + §IX "Instrument limits
(declared)": "admitted-chars auto-logging begins 2026-10-08 (prior rows carry
hub-audited wave-level α only)". Verified in the raw TSV: the two 2026-10-08 rows now
carry artifact_s (0, 185); admitted_s awaits first weave; stats_live.md says so
explicitly ("hub fills admitted_s at weave time"). Claims downgraded to "bounded
first-pass estimates" throughout. Honest and sufficient.

### Round-1 minors, dispositioned

| Round-1 minor | Status | Evidence |
|---|---|---|
| 2603.22367 called "paging" (it is an executor architecture) | **NOT FIXED** | §VIII row C3 unchanged: "context-extension (paging, O(1)-context archs 2603.22367)" |
| III.4 "optimal control law" overreach; violates own directive #3 | **NOT FIXED** | III.4 unchanged: "the optimal control law that falls out of (★) is exactly the institutional anatomy"; "It is re-derived here as the cost-optimal policy." §VIII's own C5 directive says "do NOT claim the anatomy itself as new." The abstract still sells it: "emerge as the cost-optimal control law of delegated cognition." |
| Free-lane corollary lacks the ε-floor condition | **NOT FIXED** | III.3(1) unchanged: "cannot lose. Not 'usually wins' — cannot lose." No floor condition carried from III.2. |
| Free-tier w=0 is rationed quota; marginal w>0 at boundary; latency absent from cost terms | **NOT FIXED** (acknowledged only) | §IX now says "Marginal worker cost: $0 (rationed free tiers)" — the word "rationed" appears, no shadow-price treatment; t_w still in no cost term |
| Jevons: storage-K vs verification-throughput conflation; no queueing/elasticity | **NOT FIXED** | III.4 unchanged: "hub verification bandwidth — αS per artifact against a finite K"; figure unchanged, still draws K as the bottleneck while captioning "bandwidth = the scarcity." My round-1 called this a real error because the figure encodes it; the figure still does. |
| "cannot lose" rhetoric | **NOT FIXED** | unchanged |
| Related Work omits economics neighbors | **FIXED (mostly)** | §II.3 adds 2610.06069 (lead), 2501.07913, 2609.05531 (live-verified this round), 2407.18074, 2610.01231 (VIII + abstract dual-cite). Two residual gaps: "Contracting for LLM Delegation" cited in II.3 **without its ID** (2608.18232), and 2503.05816 appears only in the VIII table, not II.3. |
| Raw worker-draft markers, session-resume strings | **PARTIALLY FIXED — REGRESSION-PRONE** | "hermes --resume" gone ✓. But: (a) §II line 84 still opens "RELATED WORK / EXISTING SYSTEMS (plain text draft, ~900 words)" — the exact marker I flagged, M4's "stripped" claim notwithstanding; (b) needle verdict tokens INTRO-OK (l.76), RELATED-WORK-OK (l.113), PAPER-OUTLINE-OK (l.506), CITATIONS-RESOLVED-OK (l.565) all still in the manuscript; (c) **new catch:** §I line 48 has raw resolver chrome inline in a body sentence: "Anthropic's A2A protocol [A2A (same as 3; authorship correction: by Google…] standardizes…"; (d) §V has dangling empty citations "[, arXiv:2610.01756]" (twice); (e) typos "reinterpretng" (IV.2), "insurerunderwrites" (§V). REVISION_LOG M4 ("6 resumes + 6 needle tokens stripped") overstates. |

---

## 3. NEW issues introduced by v1.2 (regressions)

1. **[NEW-MAJOR] The frozen snapshot itself drifts from the paper.** NUMBER_SNAPSHOT.json
   — declared "the single source for headline stats" — lists `alpha_waves: "w1
   [0.14,0.19]; w2 ~0.16; w3(N=6) ~0.09"`: a **three-wave** taxonomy. The abstract says
   "α ∈ [0.09, 0.19] across **four** task waves"; RESULTS.md Table 1 has **four** rows
   (0.17, 0.19, 0.14, ~0.09). The artifact created to end number drift cannot count the
   waves of the number it freezes. (Endpoints match, so the headline survives — but the
   snapshot's job is to be the canonical decomposition, and it isn't.)
2. **[NEW-MAJOR] REVISION_LOG disposition overclaims.** Beyond B2's false "unit-normalized"
   (see Blocker 2.iv) and M4's "stripped" (see minors): the DRAFT provenance note says
   "All BLOCKER findings are resolved in this revision." The breakeven BLOCKER is not
   resolved in DRAFT.md. For a paper whose entire reflexive method rests on the
   institution's verification gates catching exactly this class of failure, the revision
   gate failing it is not a nit — it is a fourth incident in the INC family, unlogged.
3. **[NEW-MINOR] Replacement-table rounding direction.** Four of six recomputed breakeven
   cells are floor-rounded and fail their own "T ≥ N" semantics by one turn (table in
   §2 above). Always in the flattering direction. Use ⌈T*⌉ or print one decimal.
4. **[NEW-MINOR] III.6 "median 31.5 s as of 2026-10-08"** is the n=14 median; at n=16
   (the 10-08 rows) the median is 29–32 depending on convention, and stats_live.md
   prints p50 = 32. The "as of" date claims freshness the number doesn't have. The
   snapshot-freeze discipline arguably covers it; then say "as of the 14-dispatch
   snapshot."
5. **[NEW-MINOR] §II.3 cites "Contracting for LLM Delegation" without its arXiv ID**
   (2608.18232) in a section whose purpose is citation completeness.

## 4. Residual (carried, unaddressed) issues I re-checked

- RESULTS.md still says "Its admission ratio was 0.16 — … measured. [M]" — 0.16 matches
  no computed value (0.17 / 0.19 / 0.14 / 0.09 / total 0.137). Still orphaned.
- RESULTS.md total row still reads "Total (3 waves, 12 dispatches)" over a four-wave
  table, and prints total α = 0.13 where the row's own numbers give 0.137.
- §VII REFERENCES remains an **empty stub** ("registry-verified 2026-10-07", then
  nothing) — the paper's only reference list is a verification log in Appendix B. A
  position paper with no reference section will not survive any editorial pass.
- Intro still states "even paid workers costing 15× the hub per character still favor
  delegation" unconditionally; under the *corrected* surface (p=0.3, w/h=15 → T ≥ 60)
  this holds only in the upper half of the paper's own "40–80 further turns" session
  range. One conditional clause fixes it. Intro also still says "approximately 6×"
  without the [5.3, 11.1] range the abstract now correctly carries.

## 5. What v1.2 genuinely fixed (credit where due)

- Abstract: every round-1 kill is gone — no 75×, no 46,264/14%, no retracted-statistic
  residue, INC-001 correctly attributed to post-wave integrity scanning, CI attached,
  α as bounded estimate with range, "existence proof" framing. The abstract is now
  defensible sentence by sentence.
- 1/α range with α-as-policy-parameter (M2): exactly right.
- CP CI + probe disclosure (M1): verified correct.
- §II.3 + §VIII C4a + abstract dual-cite of 2610.01231 (B5, M5, directive #4): the
  paper's novelty positioning now matches its own audit evidence.
- §IV.6 (escalation caught: nothing) and §IX/IX.b (method, external review): the
  reflexive method is now the paper's strongest asset, and IX.b's inventory of what the
  reviewers caught is accurate against my round-1 review.
- Instrument patch (artifact_s auto-logging) is real and visible in the raw TSV.

## 6. Score and verdict

The abstract-level repairs are real; the body-level repairs are where the revision
stopped. My round-1 review said the fixes were "mostly one afternoon." v1.2 is the
honest abstract of that afternoon, not the afternoon. The manuscript still publishes
the impossible breakeven row; the one formula the revision claims to have fixed is
still wrong with a false normalization clause attached; the chrome striptease is
one-third done; and the snapshot built to end number drift miscounts the waves.

Because the remaining work is mechanical and fully specified — port six corrected
lines into DRAFT III.3(2) with ceiling rounding, replace the IV.5 term with
`(ε/S)·(1/p−1)/(1+T)·κ(η)`, finish the chrome strip (intro resolver bracket, draft
marker, −OK tokens, dangling brackets, two typos), reconcile the snapshot's wave
taxonomy and RESULTS.md's three residuals, add one conditional clause to the intro's
15× sentence, and either soften III.4's control-law claim to "rationalized by (★)" or
drop directive #3 from §VIII — this stays a revise, not a reject. But the disposition
overclaims must themselves be corrected in REVISION_LOG, and I want an assert-absence
pass (the paper's own INC-003 lesson) run over every "fixed" string before v1.3: for
each repaired number, a documented grep proving the old value is absent from DRAFT.md.

**Score: 5/10** (up from 4: abstract honesty, CI discipline, novelty positioning, and
the IV.6/IX sections are real improvements; the quantitative core of the manuscript
still fails reproduction, and two disposition claims are false as written).

**Verdict: MAJOR REVISE.**

Round-1 blockers cleared: 75× retraction (yes), abstract denominators (yes),
prior-art omission (yes), instrument α (yes, by honest declaration). Not cleared:
breakeven table in the manuscript (no — side file only), IV.5 dimensional coherence
(no — false fix label). I will flip to ACCEPT-with-minors on a v1.3 that completes
the six mechanical items above and contains zero false disposition claims.

---

*Reviewer B — 2026-10-08. Breakeven surface re-derived from (★) by exact inversion at
α=0.17; CP bound, 1/α bounds, TSV median, and RESULTS totals recomputed; DRAFT.md vs
REVISION_LOG checked by literal string search; arXiv 2609.05531 live-checked via
export.arxiv.org (HTTPS) this round.*
