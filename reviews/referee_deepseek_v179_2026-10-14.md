# REVIEW: "Agentic Institutions" v1.7.9 (paper for submission.pdf, 21 pp)

Reviewed 2026-10-14. Method: two independent DeepSeek dispatches (R10A numbers
audit, 9m56s, 27 tool calls; R10B hostile referee, 3m33s) + hub-side
verification of both. All three verifiers recomputed from the artifacts in
~/agentic-institutions-paper. This document reports findings only; nothing in
the paper was changed.

## BOTTOM LINE

NOT READY TO SUBMIT AS-IS. Verdict: MAJOR-REVISIONS, borderline NOT-READY.
The arithmetic engine is flawless (91 of 92 checkable numbers reproduce
exactly). The problem is not arithmetic: the single quantity the paper's
central claims stand on (the admitted fraction alpha) is unlogged,
hub-attested, and rounded, so the headline "measured instantiation" is
unverifiable on its defining input. One cheap experiment fixes it. Detailed
findings below.

## PART 1: NUMBERS AUDIT (DeepSeek R10A, verified hub-side)

Tally: 91 PASS, 1 FAIL, 11 UNVERIFIABLE-BY-DESIGN.

Reproduced exactly (spot-verified hub-side as well):
- Table 1 wave rows, instrument sums (2,835 / 20,692 / 30,430+20,137 / 40,441),
  pooled alpha 0.137, 1/alpha 7.3, wall maxima 43+109+525+163 = 840
  (INC-007 correction confirmed: 860 was wrong)
- The full 3x3 breakeven grid re-derived from the printed formula, including
  the largest cell T > 119.5; pooled-alpha, b-restored, and cached rows
- All five p* values (0.018 / 0.022 / 0.021; eviction 0.015 / 0.018)
- Turn counts from the frozen archive: 343 raw, 122 burst rows, 221 distinct
  (burst structure and id-spacing confirmed, CRLF-aware recount)
- SHA-256 of data/t_freeze_2026-10-09T0416.csv: matches
- Rates 16/16, 24/26, 12/13, 11/13; Clopper-Pearson [0.79, 1.00] (lower bound
  = 0.025^(1/16) = 0.794, arithmetic correct)
- Durations (7-525 s, median 29 frozen), correlations r=0.89/0.86 (0.91/0.82),
  F5 arithmetic, v2 dispatcher row (512 vs 449 bytes)

THE ONE FAIL (MINOR, with explanation):
- Paper: "the twelve drafting briefs in briefs/ total 19,262 bytes."
  Repository: the twelve drafting briefs sum to 19,256. No twelve-file subset
  of briefs/ equals 19,262 (checked by exhaustive subset search; the six
  subsets that hit 19,262 all mix in probe/review/resolve files).
- b/S = 0.17 still rounds correctly either way (delta is 0.03%, inside the
  paper's own disclosed "bytes within 1%" typography caveat).
- Hub forensic note: the paper's figure was almost certainly taken BEFORE the
  recovery commit cee4be4, which purged em-dashes per house law. Six
  em-dashes at 3 bytes each becoming 2-byte replacements is exactly -6 bytes.
  Leading hypothesis, labeled as such (the pre-purge copies are not in git).
- Fix: change 19,262 to 19,256 or add "pre-purge" to the sentence.

THE 11 UNVERIFIABLE (by design, disclosed in the paper): all admitted
character counts (waves 1-4), all alpha values, the F3 hub-store traffic
figures (17.39 MB, 75.6%, 2.3x, 185x), and F5's inline counterfactual. These
come from the hub's private store and cannot be recomputed by any reader.
The paper says so. That honesty is not the issue; the dependence is
(Part 2, L2).

## PART 2: REFEREE FINDINGS (DeepSeek R10B, hostile persona, hub-annotated)

Scores: L1 novelty 3/10, L2 measurement 2/10, L3 consistency 8/10,
L4 self-application 2/10, L5 statistics 3/10, L6 missing experiment 2/10,
L7 readiness 3/10.

L1 NOVELTY (3/10). The paper concedes, and the referee verified the concession
is not cosmetic, that under its own eviction reality the paid-lane condition
reduces to the known per-query cascade rule (FrugalGPT/RouteLLM), the horizon
term (1+T) is inoperative, the Karlin rent-or-buy framing does not transfer,
and the 1/alpha bound is "an identity, not a result." What formally survives:
w/h < p at w=0 with p* ~ 0.02. Thin novelty, honestly labeled.

L2 MEASUREMENT VALIDITY (2/10). The killer finding: alpha is simultaneously
the most load-bearing and the least measured quantity in the paper. It sets
both p* (0.018-0.022) and the headline 1/alpha multiplier (5.3-11.1), yet no
admitted count is instrument-logged, waves 3-4 are rounded to the nearest
hundred, the wave-1 denominator is disputed 8x, and alpha is not bounded by 1
by construction. If true alpha were near 1, the paper's own text says the
threshold becomes p > alpha, which would falsify the central claim. Nothing
measured-and-verifiable is load-bearing.

L3 INTERNAL CONSISTENCY (8/10). Denominators hold everywhere; maturity labels
consistent; 1/alpha wording disciplined. One residual defect: Table 1 prints
wave 4 produced as 40,447 (hub-audited) while the instrument sum is 40,441;
the discrepancy is disclosed in the section 3.1 note but the table cell and
the 137,278 total carry no flag. HUB CORRECTION of the referee: the referee
called this "silently" undisclosed, which overstates; note dagger-double-dagger
discloses it. The cell-flag criticism stands.

L4 SELF-APPLICATION LOOP (2/10). The harshest lane: the reflexive framing is
"an unfalsifiable shell game." Every failure is pre-absorbed as an incident
row, the free-lane claim (p* 0.02 vs p at most 0.85) cannot fail by
construction, and the incident log functions as a rhetorical shield:
criticism becomes another confessed incident, and the confessing is then
counted as the method working. The paper needs an ex-ante falsification
protocol for the next wave, or the loop never breaks.

L5 CLOPPER-PEARSON (3/10). A correctly computed interval on a quantity the
same sentence disclaims, on a variable (exit status) the paper itself calls
"a calibration signal, not a performance metric." Statistics theater: print
no interval, or log acceptance and put the interval on that.

L6 MISSING EXPERIMENT (2/10). One cheap experiment converts the paper from
arithmetic identity to measurement: run matched briefs both ways (hub inline
vs delegated), fresh sessions, admitted characters instrument-logged on both
arms; report realized alpha, p*, and the multiplier as logged quantities.
Notably, v2 fixes echo-contamination but still does not log acceptance
outcome or a measured admitted count, so even the current fix does not close
the gap.

L7 READINESS (3/10). Not an ML/systems-conference paper. Venue fit:
governance/empirical venues (FAccT, AIES, ACM EAAMO, econ+computation
workshop). Desk-reject risks: (1) unverifiable central input, (2) no
falsifiable experiment, (3) conceded collapse of novelty to the cascade rule.

REFEREE'S ADDED LANES (not pre-confessed by the paper):
A. The paid-lane grid is vacuous even on its own terms: it dies at the
   plausible cached price c=0.1 (T > 1,195) on a gateway-pricing parameter
   the paper concedes it never established.
B. Every unlogged overhead term (epsilon, o) biases pro-delegation; the
   corollary is systematically overstated in one direction only.
C. The paper's own lesson ("provenance checks must be run by someone other
   than the author of the number") was violated by INC-007 and the 14 Oct
   addendum: author-transcribed reviewer numbers, caught only by re-review.
   The build gate excludes the hub-audited cells, which are exactly the cells
   that keep failing.
D. The T count is conceded to be an upper bound on the horizon term, so the
   paid grid is defended by no number that is both measured and applicable.

REFEREE TOP-5 FIXES (priority order):
1. Run the inline-vs-delegated A/B with logged admission on both arms; make
   alpha, p*, and the multiplier measured quantities.
2. Delete the Clopper-Pearson interval or re-point it at logged acceptance.
3. Re-baseline the paid-lane section (grid, 7.3, 1/(1+cT)) as hypothetical
   and non-load-bearing; the free-lane result is the only live claim.
4. Extend v2 to log acceptance outcome and admitted characters per row.
5. Pre-register a falsification protocol for the next wave (predicted alpha
   range, p threshold, context-budget multiplier).

## PART 3: VERIFIER-OF-VERIFIER NOTES (hub-side)

- Both DeepSeek runs were checked against independent hub recomputation:
  the numbers audit's PASS calls reproduce; the referee's own arithmetic
  (grid cell, pooled alpha, p*, CP bound) reproduces.
- Referee overstatements corrected: wave-4 40,447-vs-40,441 IS disclosed in
  the section 3.1 note (referee said "silently"); L3's 8/10 reflects that.
- The 19,256 finding was independently reproduced by hub byte counts before
  the audit reported it; the em-dash-purge explanation is hub-side forensics,
  probable not proven.
- What survived every verifier: the paper's incident record, artifact
  discipline (frozen snapshot, SHA-256 archive, verifier scripts, build
  gate), and the honesty machinery are real and, per the referee, "a genuine
  contribution to how reflexive empirical AI work could be done." The paper's
  problem is that its one load-bearing number is an attestation, not a
  measurement. That is fixable with one logged A/B wave.

## EVIDENCE FILES
- Full numbers audit (raw): hub re-extract kept at
  ~/agentic-institutions-paper/reviews/r10a_numbers_audit.md
- Full referee text (raw):
  ~/agentic-institutions-paper/reviews/r10b_referee_report.md
- Instrument table, freeze archive, briefs/: in-repo, sha-verified.
