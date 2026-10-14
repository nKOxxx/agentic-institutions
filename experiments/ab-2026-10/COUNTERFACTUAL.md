# Counterfactual (post hoc, not a prediction): print-back reduced to the status line

Status-line bytes per arm-D row (o_bytes - artifact_bytes): ab_s1 55, ab_s2 55, ab_s3 55, ab_s4 55, ab_s5 55, ab_s6 55

| pair | Delta_cf = b + A + status | M_cf = S_I / Delta_cf |
|---|---|---|
| ab_s1 | 3999 | 1.82 |
| ab_s2 | 3642 | 1.69 |
| ab_s3 | 3283 | 1.96 |
| ab_s4 | 3549 | 1.96 |
| ab_s5 | 3761 | 1.79 |
| ab_s6 | 3462 | 1.78 |

Pooled: M_cf = 39732/21696 = 1.83; M'_cf = S_D/Delta_cf = 1/(alpha_D + (b + o_cf)/S_D) = 2.19; proviso (b + o_cf)/S_D = 0.291 against 1 - alpha_D = 0.835; p*_cf at the paper's epsilon = 300 and S_bar_D = 7934 is 0.065.

Reading: with the print-back reduced to its status line the within-arm bound M'_cf is inside the pre-registered band and the matched M_cf is below its 2.0 floor by the size ratio S_I/S_D = 0.83; p*_cf is above 0.05 because these artifacts are smaller than the 20,000 characters the paper's threshold assumed. Both figures treat the adjudication read as evicted; under the section 3.2 law as written the read is S_D per row and Delta_cf + S_D = Delta_D exactly, returning M = 0.57, the realized value.

# Realized, derived from the same rows (post hoc arithmetic on pre-registered quantities)

Proviso on the real o: (b + o)/S_D = 61457/47602 = 1.291 against 1 - alpha_D = 0.835.
Within-arm multiplier M' pooled = S_D/Delta_D = 47602/69298 = 0.69.
Print-back against the inline draft, o_D > S_I on every pair: ab_s1 7967 > 7297; ab_s2 8806 > 6173; ab_s3 7167 > 6434; ab_s4 8079 > 6943; ab_s5 7440 > 6714; ab_s6 8473 > 6171.
Inline arm's own print-back: o_I/S_I = 40062/39732 = 1.008; its measured delta to the dispatching hub b + o_I + A_I = 62259.

Variant, literal traceability clause (the eight drafts ADJUDICATION_NOTES.md lists with an excluded statement rejected): acceptance 1/6, alpha_D = 1251/47602 = 0.026, M = 0.38; P1 FAIL, P2 FAIL.
Variant, length rule applied (arm-D s2 and s6 over 1,400 words rejected): acceptance 4/6, alpha_D = 5442/47602 = 0.114, M = 0.47; P1 PASS, P2 PASS.
As adjudicated (the marks of record, from ab_stats.py): acceptance 6/6, alpha_D = 7841/47602 = 0.165, M = 0.57; P1 PASS, P2 PASS.

