# Pre-registered wave: inline versus delegated drafting with logged admission

Status: PRE-REGISTERED, no dispatch run. This file, the six briefs, the scripts and the predictions below are
committed and tagged (v1.8.3) before any row exists. The commit timestamp is the pre-registration date. After the
run, nothing in this file changes; results go to RESULTS.md beside it and to §3.8 of the paper.

## Why

Every admitted fraction α in the paper is a hub-audited count with no instrument record, and α sets both the
free-lane threshold p* and the per-context-budget bound 1/α. The first-try acceptance rate (at most 11/13) is
hub-attested. Nothing measured and verifiable is load-bearing. This wave logs, per row, on both arms: the brief
bytes b, the response bytes, the artifact bytes S, the bytes printed back to the hub o, the needle outcome, the
hub's adjudication (ACCEPT or REJECT with a reason code) and the admitted characters, each recorded before the
text is used anywhere.

## Design

Six matched briefs (`briefs/ab_s1.md` to `ab_s6.md`), each a self-contained fact sheet for one section of a
supplement to the companion repository. Each brief is dispatched twice, in a fresh session each time, through the
same dispatcher (`instrument/hf_dispatch.sh` v2.5) and the same gate:

- Arm D (delegated): worker `deepseek`, the free-lane worker of record.
- Arm I (inline): worker `hub`, the hub's own model, resolved from `AB_HUB_MODEL` and `AB_HUB_PROVIDER`. The
  model name is logged in the row's .err file by the CLI and recorded in RESULTS.md.

Order: for k = 1..6, arm D then arm I. Budget 850 s per dispatch. No retries in this wave (R = 1): a REJECT is a
non-acceptance and the pair is reported with admitted = 0 on that arm.

Rows are written to `ab_stats_v2.tsv` in this directory (same 17 columns as `instrument/hf_stats_v2.tsv`), raw
output to `out/`, admitted excerpts to `admitted/`, adjudications to `ab_adjudication.tsv`.

## Adjudication rule (fixed before the run)

A row is ACCEPT iff all of: (1) dispatcher verdict OK (needle is the last non-empty line); (2) every factual
statement in the draft is traceable to the fact sheet or is a correct consequence of it, with no invented number,
name, date, file, commit or incident; (3) the draft is plain prose within the brief's form rules and attempted no
file write. Otherwise REJECT with one reason code: FAB (invented fact), SCOPE (form or write violation), NEEDLE,
LEN, OTHER. The reason is logged.

Admitted excerpt: the hub copies into `admitted/<key>.md` the sentences it would weave into SUPPLEMENT.md
unedited. A sentence is admitted iff it states a fact-sheet fact correctly in a form usable without edit, is not a
near-verbatim copy of a fact-sheet line (restating the brief back is not admission), and is not redundant with a
sentence already admitted from the same draft. admitted_chars = bytes of that file. The same rule is applied to
the inline arm's draft, which gives the hub's self-admission α_I; the inline context cost is S_I regardless, by the
cost law of §3.2 (the whole inline draft sits in hub context).

The adjudication is still a judgment. What changes is that it is made per row, under a rule written before the
data, and logged before the text is used.

## Quantities (computed by `ab_stats.py`, no hand arithmetic)

Per pair k: S_I = artifact bytes of the inline draft; S_D = artifact bytes of the delegated draft; b = brief bytes;
o = bytes printed back to the hub; A_D = admitted chars on arm D; α_D = A_D / S_D; Δ_D = b + o + A_D (+ ε, where
ε = o of a REJECT row, since a rejected dispatch leaves its verdict in context); multiplier M_k = S_I / Δ_D
(matched) and M'_k = S_D / Δ_D (within arm). Pooled values use sums over the six pairs. p̂_D = ACCEPT rows / 6 on
arm D. p* = ε̄ / (ε̄ + S̄_D (1 − α_D − (b̄ + ō)/S̄_D)) with ε̄ = mean o of REJECT rows on arm D, or the paper's
300-character estimate if no row is rejected (stated as such).

## Predictions (from the paper's record at v1.8.2; each with what invalidates it)

- P1 α_D pooled ∈ [0.09, 0.19] (the hub-audited wave range). Consistent band [0.05, 0.30]; outside the band the
  paper's characterisation of α is invalidated and §3.4 prints the realized range instead. α_D ≥ 0.5 withdraws
  "up to 1/α" as a useful bound (the bound would be below 2).
- P2 p̂_D ≥ 4/6. p̂_D ≤ 2/6 contradicts the representativeness of the 11/13 record and §3.3 says so.
- P3 pooled matched multiplier M = ΣS_I / ΣΔ_D ∈ [2.0, 3.7] (the paper's measured-b bound is 3.3 pooled and 3.6 on
  one denominator). M < 1.5 invalidates the §3.4 bound as a statement about this institution and the paper says
  the per-context-budget advantage is not demonstrated.
- P4 b/S_D pooled ∈ [0.10, 0.40]; o/S_D pooled < 0.05.
- P5 matching holds: ΣS_I / ΣS_D ∈ [0.5, 2.0]. Outside, the multiplier is reported on S_D with the mismatch stated.
- P6 p* at realized α_D, b, o and ε̄ is below 0.05.

Six pairs is small. The predictions are on pooled quantities and the paper will print the per-pair table.

## What cannot be falsified here, stated now

The free-lane threshold itself: with p̂ anywhere above about 0.1 and p* near 0.02 the corollary holds by a wide
margin, and six briefs cannot put p̂ below that. What this wave can falsify is the α range, the multiplier bound,
the b/S range and the representativeness of 11/13.

## Reporting

RESULTS.md (generated by `ab_stats.py --write`), every P1 to P6 marked PASS or FAIL, the per-pair table, the hub
model name, the dispatcher version, and the adjudication log. The paper's §3.8 and Appendix A F6 report the same
numbers, whatever they are. If a prediction fails, the paper says which claim it moves and how.
