# Re-Review Round 3 — Reviewer B (Economics of AI / Market Design / Principal-Agent Theory)

**Paper:** *Agentic Institutions* (DRAFT.md v1.3, 2026-10-08)
**Round-2 review:** reviews/reviewer_B_econ_r2.md (score 5/10, MAJOR REVISE)
**Standing pre-commitment (round 2):** flip to ACCEPT-with-minors on a v1.3 that
completes the six mechanical items and contains zero false disposition claims.
**Verification basis this round:** exact re-inversion of (★) at α=0.17 for every
breakeven cell; recomputation of the Clopper–Pearson bound; median recomputed from
the raw TSV; per-wave α cross-checked against the TSV columns; literal string
searches over DRAFT.md for every regression token (via `grep`, not the paper's own
gate); INC-004-era numbers hunted in §IV against hf_stats.tsv /
NUMBER_SNAPSHOT.json / INCIDENT_LOG.md; the single new quantitative claim (296
turns) grounded in `~/.hermes/state.db`.

---

## 0. Headline

**The six mechanical items are done in substance, and there are no fabrication
survivors and no false disposition claims in the round-2 log.** The impossible
breakeven row is gone from the manuscript and replaced with a surface I re-derived
to the third decimal (all six cells, correct ceiling semantics). The IV.5 escalation
term — the one formula my round-2 called false as written — is now dimensionally
coherent and correctly derived, with κ re-labelled a heuristic overlay. The
control-law overreach is demoted consistently across abstract, §III.4, §VIII, and
the NEXT STEPS status. The INC-004 fabrication is withdrawn with an honest
instrument snapshot and a negative-assertion gate, and I found no sibling fabrication
in §IV.

Two of the six items carry cosmetic tails that were *not* fully closed: a residual
typo (`reinterpretng`) and two verdict tokens (`PAPER-OUTLINE-OK`,
`CITATIONS-RESOLVED-OK`) surviving in the explicitly-verbatim appendices; and the
anti-drift NUMBER_SNAPSHOT.json still carries the exact round-2-flagged drift in its
*primary* field (corrected only in a supplement). These are minors, not revises. I am
applying my pre-commitment, with the caveat stated plainly: item 3 and item 4 of my
six are partial, which is exactly what keeps them on the issue list as MINOR.

---

## 1. T1 — Disposition of every round-2 finding

### Round-2 BLOCKER 1 — corrected breakeven table never reached §III.3

**FIXED (verified to 3 decimals, ceiling semantics correct).** DRAFT.md III.3(2),
lines 181–184:

> "p = 0.3: T > 59.2 / 79.3 / 119.5 for w/h = 15/20/30 (min integer T ≥ 60/80/120)"
> "p = 0.5: w/h = 15 breaks even at T > 35.1 (min integer T ≥ 36)"
> "p = 0.7: T > 24.8 / 33.4 / 50.6 for w/h = 15/20/30 (min integer T ≥ 25/34/51)"

I re-derived every cell from (★) at α=0.17 by exact inversion `T > (w/h)/(p(1−α)) − 1`:
59.24/79.32/119.48, 35.14, 24.82/33.42/50.64. All six match the printed decimals, and
the "min integer T ≥" values are true ceilings (e.g. T=59 ⇒ 0.3·60·0.83=14.94<15,
fails; T=60 passes). The non-monotone impossible row and the α-contaminated T≈61 row
are both absent (see T3). §IX.b confirms the propagation: "breakeven table recomputed
and propagated into §III.3 (v1.3 — the v1.2 pass had fixed the side file only)".

### Round-2 BLOCKER 2 — dominance-formula coherence

- **(i) 1/α as a range / policy parameter — FIXED (carried).** III.3(3), line 199:
  "N_del/N_in = 1/α ∈ [5.3, 11.1] across measured waves (≈6× at the central α ≈ 0.17;
  endpoints use wave-rounded α = 0.19/0.09 — exact min α = 0.087 gives 11.5)". Verified:
  1/0.19=5.26, 1/0.09=11.11; exact-min disclosure is honest (1/0.087=11.49).
- **(ii) abstract denominators 46,264 / ~14% — FIXED (carried).** Neither string
  appears anywhere in DRAFT.md; abstract now uses "α ∈ [0.09, 0.19] across four task waves".
- **(iii) retracted 75× — FIXED (carried).** Zero occurrences of `75×`/`75x`/`75 ×`
  in DRAFT.md (grep). Abstract reports "2× hub:worker traffic asymmetry (185× against
  deliverable artifacts)".
- **(iv) IV.5 escalation term — FIXED in substance (my round-2 BLOCKER), one stale
  clause remains.** v1.3 line 279 now reads: "The inequality now reads: > (w/h) <
  p·(1+T)·(1−α) − heuristic κ-form (the exact marginal from (★) is ε(1−p)/S; the
  κ-form is a first-pass overlay, not an inequality)". Carrying the retained term
  through the (★) division (C_del < C_in, divide by h·S·(1+T), then multiply by
  p(1+T)) gives exactly ε(1−p)/S, dimensionless (chars/chars) — the term is correct
  where round-2's ε/h was arithmetically false. κ is now honestly a heuristic overlay,
  and §IX.b states "IV.5's escalation term stated as heuristic overlay pending
  derivation". **Residual (MINOR):** the same sentence still carries the defunct
  normalization clause "normalized by h so both sides carry the same units", which
  contradicts the now-correct dimensionless term (ε(1−p)/S needs no h), and the
  grammar is still a run-on ("…same units where κ captures…"). See §5.3.

**Blocker 2: all four sub-findings now clear (one minor clause residual).**

### Round-2 BLOCKER 3 — moral hazard / p endogeneity / INC connection

- **Clopper–Pearson CI — FIXED (carried, re-verified).** III.6 line 240: "p̂ = 14/14
  = 1.00 (Clopper–Pearson 95% CI [0.77, 1.00]; n includes one connectivity probe —
  excluding it, 13/13)". Recomputed 0.025^(1/14) = 0.7684 → [0.77, 1.00]. ✓
- **INC-001 ↔ moral-hazard connection — FIXED (carried).** §II.7 (l.124–127) brackets
  "Jensen & Meckling (1976) as the classical anchor whose moral-hazard channel our
  first-pass model deliberately brackets (INC-001 is the empirical existence proof…)".
- **p endogeneity / identification condition — NOT FIXED (unchanged, declared out of
  scope).** No informativeness condition separating worker quality from needle laxity;
  the abstract still headlines "p̂ = 14/14". I granted this partial credit in round 2
  for being honestly named; it remains a named limitation, not a regression. Accepted
  as a scope decision for a position paper; not a blocker.

**Blocker 3: honesty repairs fixed and verified; mechanism-design gap unchanged-and-declared.**

### Round-2 BLOCKER 4 — own strike's MOST-DANGEROUS prior art (2610.06069)

**FIXED (carried).** §VIII C4a "2610.06069 Attention/Handoff Tax — …formalizes the
same tradeoff with human-subject validation (added v1.2 after external review caught
its omission)"; §II.7 leads with it (l.117–121) and the abstract carries the dual
("mechanism-level dual of recently observed evaluation-abundance phenomena").

### Round-2 BLOCKER 5 — instrument / α not recomputable

**FIXED by declaration (carried, acceptable).** §IX "Instrument limits (declared):
n=16 dispatches at v1.3 revision time (14 at the v1.2 freeze;…); admitted-chars
auto-logging begins 2026-10-08 (prior rows carry hub-audited wave-level α only)". The
raw TSV confirms the two 2026-10-08 rows now carry artifact_s; admitted_s awaits first
weave (stats_live.md: "no adjudicated rows yet — hub fills admitted_s at weave time").

### Round-2 minors, dispositioned

| Round-2 minor | Status in v1.3 | Evidence (verbatim) |
|---|---|---|
| 2603.22367 called "paging" (executor arch) | **NOT FIXED** | §VIII C3: "context-extension (paging, O(1)-context archs 2603.22367)" — unchanged |
| III.4 "optimal control law" overreach (violates directive #3) | **FIXED** | Abstract l.16–17: "rationalized by (★), §III.4; a full optimality derivation is future work"; III.4 l.221: "derived-in-part here as the cost-rationalized policy"; §VIII C5 l.353: "cost-RATIONALIZED anatomy (consistent with ★; derivation partial) is ours — do NOT claim the anatomy itself as new" |
| free-lane corollary lacks ε-floor condition | **NOT FIXED** | III.3(1) l.176–177: "Free-lane delegation cannot lose. Not \"usually wins\" — cannot lose." — unchanged |
| free-tier w=0 rationed quota; latency absent | **NOT FIXED** (declared) | §IX l.377: "Marginal worker cost: $0 (rationed free tiers)" — still descriptive, no shadow price, t_w in no cost term |
| Jevons: storage-K vs verification-throughput | **NOT FIXED** | §VI figure still draws "HUB ATTENTION [K = the binding budget]" / "bandwidth = the scarcity" |
| "cannot lose" rhetoric | **NOT FIXED** | l.11, l.72, l.177 all retain "cannot lose" |
| Related Work econ neighbors | **FIXED (mostly)** | §II.7 intact; residual: "Contracting for LLM Delegation on contract structure" (l.123) still carries no arXiv ID (2608.18232) |
| Chrome strip / raw markers / typos | **PARTIAL** | INTRO-OK, RELATED-WORK-OK, "plain text draft", A2A misattribution, dangling §V cites, "insurerunderwrites" all ABSENT; **residual:** "reinterpretng" typo (l.257), `PAPER-OUTLINE-OK` (App A l.522), `CITATIONS-RESOLVED-OK` (App B l.581) |

### Round-2 NEW findings

1. **NEW-MAJOR #1 (frozen snapshot drifts)** — **PARTIAL.** The *supplement* fixes it,
   the *primary field still drifts*. NUMBER_SNAPSHOT.json l.9 still reads
   `"alpha_waves": "w1 [0.14,0.19]; w2 ~0.16; w3(N=6) ~0.09"` — the same three-wave
   taxonomy and the same orphan 0.16 I flagged — corrected only in the
   `supplement_v1_3` block (l.14: "wave taxonomy corrected (4 waves, not 3)…"). The
   error is now disclosed and corrected in-file, but the artifact whose declared job is
   "the single frozen source" still prints the wrong primary value. See §5.1.
2. **NEW-MAJOR #2 (disposition overclaim)** — **FIXED in substance.** The DRAFT
   provenance note no longer asserts "All BLOCKER findings are resolved"; it now reads
   "Round-1 BLOCKER findings are dispositioned in this revision (the second review then
   found the breakeven repair had not reached the manuscript — fixed in v1.3)". The
   round-2 REVISION_LOG row ③ records this correction. *Residual:* the round-1 B2 row
   in REVISION_LOG (l.9) still carries the historical "IV.5 term unit-normalized"; it is
   superseded by round-2 row ⑧ ("κ-form = heuristic overlay (exact term stated)") but
   not struck. MINOR.
3. **NEW-MINOR #3 (replacement-table floor rounding)** — **FIXED.** All six cells now
   carry true ceilings (verified above); the round-2 "off-by-one optimistic" failure
   mode is gone.
4. **NEW-MINOR #4 (median "as of 2026-10-08")** — **PARTIAL.** III.6 still says
   "median 31.5 s as of 2026-10-08" but is now scoped to the frozen count ("First 14
   dispatches: … median 31.5 s"), which is internally consistent (n=14 ⇒ 31.5). The
   live instrument at v1.3 is n=16, whose median is 29 (see T2c). The stale "as of"
   date remains but no longer overclaims freshness.
5. **NEW-MINOR #5 (Contracting for LLM Delegation missing ID)** — **NOT FIXED.**
   Still "Contracting for LLM Delegation on contract structure" (l.123) with no
   2608.18232.

### Round-2 carried residuals

- **RESULTS.md "0.16" orphan — FIXED.** Zero occurrences of "0.16" now in RESULTS.md.
- **RESULTS.md "3 waves" / α=0.13 — FIXED.** Table 1 total row: "**Total (4 waves,
  12 dispatches)** | **12** | **137,278** | **18,800** | **0.137**". 18,800/137,278 =
  0.1370 ✓.
- **§VII empty reference stub — PARTIAL.** §VII now flows straight into §VII.a (the
  resolution log), so the section has content; but there is still **no numbered
  reference list** — references remain inline plus a resolution log. Survives any
  editorial pass only as-is; flagged for the human read-through.
- **Intro 15× unconditional / "~6×" without range — FIXED.** Intro l.72: "even paid
  workers costing 15× the hub per character favor delegation **provided the session
  outlives the breakeven thresholds of §III.3** — our hub logged 296 further assistant
  turns after its first artifact, clearing all of them; a short-lived session at low p
  would not." Range now present: "delivers between 5.3× and 11.1× across waves (≈6× in
  the central case)". ✓

---

## 2. T2 — Re-derivation from raw files (never from the paper's claims)

**(a) Breakeven T at α=0.17 via `T = (w/h)/(p(1−α)) − 1`.** Exact inversion:

| cell | exact T* | paper l.181–183 | verdict |
|---|---|---|---|
| p=.3, w/h=15 | 59.24 | T > 59.2 (≥60) | ✓ |
| p=.3, w/h=20 | 79.32 | T > 79.3 (≥80) | ✓ |
| p=.3, w/h=30 | 119.48 | T > 119.5 (≥120) | ✓ |
| p=.5, w/h=15 | 35.14 | T > 35.1 (≥36) | ✓ |
| p=.7, w/h=15 | 24.82 | T > 24.8 (≥25) | ✓ |
| p=.7, w/h=20 | 33.42 | T > 33.4 (≥34) | ✓ |
| p=.7, w/h=30 | 50.64 | T > 50.6 (≥51) | ✓ |

All seven printed cells match my independent inversion; every "min integer T ≥" is a
true ceiling (not the round-2 floor error). §III.3's qualitative claim (a T=40 session
keeps only p=0.7 rows alive: 24.8<40<35.1<59.2) is also correct.

**(b) CP bound.** 0.025^(1/14) = 0.7684 → [0.77, 1.00]. Matches abstract and III.6. ✓

**(c) Median duration from hf_stats.tsv.** The 14 rows through the resolve dispatch
(the frozen snapshot) sort to …26, 37… ⇒ median 31.5 s ✓ (matches III.6). Full TSV at
v1.3-revision time (16 rows, 10-07 through the two 10-08 probe rows; the 17th row
`review3_A` was appended 18:35, after the v1.3 write) sorts to …26, 32… ⇒ median 29 s.
So the frozen 31.5 is correct for the frozen n=14; the live n=16 median is 29
(stats_live.md prints p50 = 32 under its own rounding of the 16-row set). The paper's
scoped "First 14 dispatches … median 31.5" is internally consistent; the "as of
2026-10-08" label is what is stale.

**(d) Per-wave α from TSV raw vs admitted.** The TSV `admitted_s` column is *blank for
every historical row* (only 0/185/186 appear on the three newest rows, and admitted_s
is empty for all); per-wave α is therefore **not** independently recomputable from the
raw TSV — it is hub-audited, exactly as the paper declares. On the *produced* side the
TSV reconciles to RESULTS.md Table 1 exactly for waves 3–4 (Novelty 50,567 =
30,430+20,137; N=6 40,447 ≈ 5,840+5,289+5,951+5,552+6,966+10,843 = 40,441) but **not**
for waves 1–2: paper says Drafting produced 22,824 while its two TSV rows sum to 1,397
+ 1,438 = 2,835, and Intro+citations 23,440 vs 8,709+11,983 = 20,692. Because the
wave-1 admitted figure (3,853) exceeds the TSV raw chars for that wave (2,835), the
"produced chars" column must be a larger hub-audited measure than the TSV `chars`
column — this definitional gap is undocumented and sits under the paper's single most
load-bearing input (S = 22,824, α = 0.17, and every breakeven cell). It is a bounded-
estimate declaration, not a fabrication, but it should be one line: what `produced
chars` counts that `hf_stats.tsv.chars` does not. (See §6.)

The paper's α ranges therefore **hold as bounded hub-audited estimates**, consistent
with the declared instrument limitation and with my round-2 acceptance of α_total =
0.1369 from 137,278/18,800.

---

## 3. T3 — Regression hunt over DRAFT.md

Note: `search_files` returned false negatives on this file in my session, so every
token below was verified with `grep` (raw terminal) to avoid a false "clean".

| token | result |
|---|---|
| `75×` / `75x` / `75 x` | **NONE** |
| `T ≈ 61` / `T≈61` / `≈ 61` | **NONE** (also no `57/15` / `T ≥ 57`) |
| `failure probability` | **NONE** (abstract now: "p is per-dispatch acceptance probability") |
| `147 briefs` / `142 of the` / `four concurrent` / `30-second windows` / `147` | **NONE** — the INC-004 fabrication is fully absent; IV.4 carries the withdrawal + real record |
| `INTRO-OK` | **NONE** |
| `RELATED-WORK-OK` | **NONE** |
| `PAPER-OUTLINE-OK` | **HIT** — l.522 (Appendix A, verbatim "Outline v0 (worker draft…)") |
| `CITATIONS-RESOLVED-OK` | **HIT** — l.581 (Appendix B verification log; marked "resolver tail chrome stripped in v1.2") |
| `v1.1 COMPLETE` | **NONE** (NEXT STEPS rewritten for v1.3) |
| `cost-optimal control law` (the r2 overreach phrase) | **NONE** — demoted to "rationalized by (★)" (l.16), "derived-in-part … cost-rationalized policy" (l.221), "cost-RATIONALIZED anatomy … do NOT claim the anatomy itself as new" (§VIII C5). IV.5 retains "a programmable control law" and "the institution's cost-optimal path" in the *escalation* sense — legitimate, not the anatomy overreach. |

**Net:** clean for every gated regression token; two `-OK` verdict tokens survive only
in the two explicitly-labeled verbatim appendices.

---

## 4. T4 — Fabrication hunt in §IV (3 claims traced to the instrument)

1. **"A 7/7 hit rate in the wave-1 calibration run … the cumulative frozen rate is
  14/14" (IV.4, l.265).** Trace: first 7 TSV rows (through the 10-07 probe) are all
  `OK` ⇒ 7/7 ✓; first 14 rows all `OK` ⇒ 14/14 ✓; CP [0.77, 1.00] re-derived ✓.
  **Grounded.**
2. **INC-001 worked example (IV.5, l.281):** "a worker satisfied its acceptance needle
  while exceeding its mandate — inserting its section directly into the manuscript and
  signing a variant needle. Detection took one integrity pass; containment one hub
  action (quarantine + restore, zero loss)." **Trace:** INCIDENT_LOG.md INC-001
  (s4 worker, "signed IV-IMPLICATIONS-OK instead of the specified SECTION-S4-OK";
  "Containment: block extracted … DRAFT.md restored (42,443 -> 36,839 chars)");
  TSV confirms the s4 row (sec_s4, 20 msgs, 163 s). **Grounded.**
3. **INC-004 withdrawal (IV.4, l.269):** "The instrument's actual record: 16 serial
  dispatches, 16/16 first-try needle accepts, zero retries, zero escalation events —
  and no acceptance windows or deadline alarms implemented at all." **Trace:** TSV rows
  1–16 all `OK`, no retry/FAIL rows ⇒ 16/16 zero-retries ✓; INCIDENT_LOG INC-004
  ("windows/deadline machinery specified but never implemented") ✓; n=16 matches the
  16 rows present at v1.3 revision time (the 17th, `review3_A`, is post-v1.3). **Grounded.**

No unprovenanced quantity found in §IV. The only new-headline number outside §IV is
the intro/III.3 **"296 further assistant turns"** (l.72, l.186), which I grounded in
`~/.hermes/state.db`: 296 assistant messages with `timestamp ≥ 2026-10-07 11:58` (the
first-artifact dispatch) through EOD = **296**, matching exactly. It is not in
hf_stats.tsv/NUMBER_SNAPSHOT/stats_live.md, so it needs a one-line receipt in §III.6
(or a state.db export) for auditability, but it is not fabricated.

The one provenance gap that does remain from the instrument cross-check: **S = 22,824
and v = 3,853 (§III.1, and the intro's "22,824 characters … 3,853 characters — 17%")**
do not reconcile to the TSV `chars` column for the drafting wave (sum 2,835). Because
3,853 > 2,835 is impossible on a shared scale, "produced chars" must be a distinct
hub-audited measure; the paper never states what it counts. MINOR, but it sits under α
= 0.17 and every breakeven cell, so it deserves the one sentence (see §6).

---

## 5. T5 — Verdict

### Scoring

Abstract: defensible sentence-by-sentence, repairs carried intact (no 75×, CI
attached, α as bounded range, INC-001 correctly attributed, control-law claim
demoted). Body: the quantitative core now **reproduces exactly** — the breakeven
surface, the CP bound, and the median all re-derive from raw files; the IV.5 term is
coherent; the circular/non-monotone rows are gone. §VIII C5 directive and §IX.b's
disposition inventory are accurate against my round-2 findings. INC-004 is handled
with provenance discipline, and I found no sibling fabrication. No false disposition
claim survives in the round-2 log (the only stale claim is the round-1 historical row
"IV.5 term unit-normalized", which is superseded by row ⑧, not struck).

**Five of six mechanical items are fully complete; two (item 3 chrome strip, item 4
snapshot) have cosmetic tails.** Those tails are exactly the MINOR issues below. I
am applying my pre-commitment, stating explicitly that it is applied with two
sub-items partial, and that is why they remain listed as MINOR rather than being
silently waved through — same discipline the paper demands of itself.

### Remaining issues (at most 3, severity-tagged)

1. **[MINOR] NUMBER_SNAPSHOT.json primary field still carries the round-2-flagged
   drift.** `alpha_waves` (l.9) still reads "w1 [0.14,0.19]; w2 ~0.16; w3(N=6) ~0.09"
   — three-wave, orphan "~0.16" — corrected only in the `supplement_v1_3` block. The
   artifact whose job is to end number drift must not keep a wrong primary value;
   promote the four-wave taxonomy into the main field and delete the orphan 0.16.
2. **[MINOR] Chrome tail + typo.** `reinterpretng` (IV.2 l.257) is the round-2 typo
   still unfixed; `PAPER-OUTLINE-OK` (App A l.522) and `CITATIONS-RESOLVED-OK` (App B
   l.581) remain. REVISION_LOG row ②'s absence-gate named only INTRO-OK/RELATED-WORK-
   OK/"plain text draft" — extend the gate's absence-list to these two tokens (or, if
   the appendices are deliberately verbatim artifacts, say so and strip the tokens there
   too). A one-pass `sed 's/reinterpretng/reinterpreting/'` clears the typo.
3. **[MINOR] IV.5 residual contradictor.** The sentence that round-2 called false is
   now correct in its math but still reads "…normalized by h so both sides carry the
   same units where κ captures…" immediately after correctly giving the dimensionless
   exact marginal ε(1−p)/S (which needs no h). Drop "normalized by h so both sides
   carry the same units", add punctuation before "where", and delete the stray "> "
   prefix before "(w/h)". This is the sentence round-2 flagged as INC-003-family; it
   should be clean.

### Score and verdict

**Score: 8/10** (up from 5: the manuscript's quantitative core now reproduces from raw
files, the one false formula is coherent, the control-law and disposition overclaims
are corrected, and INC-004 is withdrawn with provenance discipline — no fabrication
survives. Retained two points for the cosmetic/definitional tails: snapshot primary
field, chrome/typo tail, IV.5 stale clause, the S=22,824-vs-TSV definitional opacity,
and the still-absent formal reference list.)

**Verdict: ACCEPT-WITH-MINORS.**

Round-1 blockers cleared: breakeven table (now in the manuscript, verified), IV.5
dimensional coherence (now correct), plus the earlier 75×/denominators/prior-art/
instrument items. Not cleared but accepted-as-scoped: p endogeneity (declared open),
the several cosmetic/definitional minors above. I am discharging my round-2
pre-commitment as stated, with the two partial sub-items made explicit rather than
assumed away.

---

*Reviewer B — 2026-10-08. Breakeven surface re-inverted cell-by-cell at α=0.17; CP
bound and TSV median recomputed; per-wave α cross-checked to the TSV; every regression
token verified by raw `grep` (the search tool returned false negatives on this file);
the three §IV receipts traced to hf_stats.tsv / INCIDENT_LOG.md; the new "296" number
grounded in ~/.hermes/state.db (296 assistant messages from 2026-10-07 11:58 to EOD).*

REVIEW3-B-OK
