# Counterfactual (post hoc, not a prediction): print-back reduced to the status line

Status-line bytes per arm-D row (o_bytes - out_bytes): ab_s1 44, ab_s2 44, ab_s3 45, ab_s4 47, ab_s5 46, ab_s6 44

| pair | Delta_cf = b + A + status | M_cf = S_I / Delta_cf |
|---|---|---|
| ab_s1 | 3988 | 1.83 |
| ab_s2 | 3631 | 1.70 |
| ab_s3 | 3273 | 1.97 |
| ab_s4 | 3541 | 1.96 |
| ab_s5 | 3752 | 1.79 |
| ab_s6 | 3451 | 1.79 |

Pooled: M_cf = 39732/21636 = 1.84; proviso (b + o_cf)/S_D = 0.290 against 1 - alpha_D = 0.835; p*_cf at the paper's epsilon = 300 and S_bar_D = 7934 is 0.065.

Reading: removing the print-back entirely leaves M_cf below the pre-registered floor of 2.0 (b/S is 0.284 on these briefs) and p*_cf above 0.05 (these artifacts are smaller than the 20,000 characters the paper's threshold assumed). The counterfactual does not rescue P3 or P6.
