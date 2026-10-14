#!/usr/bin/env python3
"""check_ab.py <DRAFT.md>: assert that every pooled number in experiments/ab-2026-10/RESULTS.md and COUNTERFACTUAL.md
appears in the paper's section 3.8 (run by latex/build.sh; fails the build on a mismatch). Added at v1.9 so that the
wave's numbers, like Table 1's, cannot be typed by hand."""
import os, re, sys
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
draft = open(sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, 'DRAFT.md'), encoding='utf-8').read()
m = re.search(r'### 3\.8.*?(?=\n## 4\.)', draft, re.S); sec = m.group(0) if m else ''
res = open(os.path.join(ROOT, 'experiments/ab-2026-10/RESULTS.md'), encoding='utf-8').read()
cf = open(os.path.join(ROOT, 'experiments/ab-2026-10/COUNTERFACTUAL.md'), encoding='utf-8').read()
pooled = re.search(r'^Pooled: (.*)$', res, re.M).group(1)
want = {}
for key, pat in [('alpha_D', r'alpha_D = (\d+)/(\d+) = ([\d.]+)'), ('p_hat', r'p_hat_D = (\d+)/(\d+)'), ('M', r'M = (\d+)/(\d+) = ([\d.]+)'),
                 ('b/S', r'b/S_D = ([\d.]+)'), ('o/S', r'o/S_D = ([\d.]+)'), ('S_I/S_D', r'S_I/S_D = ([\d.]+)'), ('alpha_I', r'alpha_I = (\d+)/(\d+) = ([\d.]+)')]:
    g = re.search(pat, pooled); assert g, key
    want[key] = [x for x in g.groups()]
cfp = re.search(r'^Pooled: M_cf = (\d+)/(\d+) = ([\d.]+); proviso \(b \+ o_cf\)/S_D = ([\d.]+) against 1 - alpha_D = ([\d.]+); p\*_cf .* is ([\d.]+)\.', cf, re.M)
assert cfp, 'counterfactual pooled line'
want['cf'] = list(cfp.groups())
def fmt(x): return f'{int(x):,}' if x.isdigit() and int(x) >= 1000 else x
fail = 0
for key, vals in want.items():
    for v in vals:
        s = fmt(v)
        ok = s in sec
        print(f'{"ok  " if ok else "MISS"} {key} {s}'); fail += (not ok)
# per-pair alpha range and M range from the table
alphas = [float(x) for x in re.findall(r'^\| ab_s\d \|(?: [^|]* \|){5} ([\d.]+) \|', res, re.M)]
Ms = [float(x) for x in re.findall(r'^\| ab_s\d \|(?: [^|]* \|){7} ([\d.]+) \|', res, re.M)]
for label, lo, hi in [('alpha range', min(alphas), max(alphas)), ('M range', min(Ms), max(Ms))]:
    for v in (f'{lo:.3f}' if label.startswith('alpha') else f'{lo:.2f}', f'{hi:.3f}' if label.startswith('alpha') else f'{hi:.2f}'):
        ok = v in sec; print(f'{"ok  " if ok else "MISS"} {label} {v}'); fail += (not ok)
print('PASS: section 3.8 matches RESULTS.md and COUNTERFACTUAL.md' if not fail else f'FAIL: {fail} value(s) missing from section 3.8'); sys.exit(1 if fail else 0)
