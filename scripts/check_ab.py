#!/usr/bin/env python3
"""check_ab.py <DRAFT.md>: assert that every pooled number in experiments/ab-2026-10/RESULTS.md and COUNTERFACTUAL.md
appears in the paper's section 3.8, and that the row order the pairing rule depends on holds (every ERROR row precedes
the valid row for the same brief and arm). Run by latex/build.sh after both generated files are regenerated and
compared. Added at v1.9; order check and the realized block added at v1.9.1."""
import csv, os, re, sys
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__))); AB = os.path.join(ROOT, 'experiments/ab-2026-10')
draft = open(sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, 'DRAFT.md'), encoding='utf-8').read()
m = re.search(r'### 3\.8.*?(?=\n## 4\.)', draft, re.S); sec = m.group(0) if m else ''
res = open(os.path.join(AB, 'RESULTS.md'), encoding='utf-8').read(); cf = open(os.path.join(AB, 'COUNTERFACTUAL.md'), encoding='utf-8').read()
fail = 0
def fmt(x): return f'{int(x):,}' if x.isdigit() and int(x) >= 1000 else x
def want(label, vals):
    global fail
    for v in vals:
        s = fmt(v); ok = s in sec; print(f'{"ok  " if ok else "MISS"} {label} {s}'); fail += (not ok)
pooled = re.search(r'^Pooled: (.*)$', res, re.M).group(1)
for key, pat in [('alpha_D', r'alpha_D = (\d+)/(\d+) = ([\d.]+)'), ('p_hat', r'p_hat_D = (\d+)/(\d+)'), ('M', r'M = (\d+)/(\d+) = ([\d.]+)'),
                 ('b/S', r'b/S_D = ([\d.]+)'), ('o/S', r'o/S_D = ([\d.]+)'), ('S_I/S_D', r'S_I/S_D = ([\d.]+)'), ('alpha_I', r'alpha_I = (\d+)/(\d+) = ([\d.]+)')]:
    g = re.search(pat, pooled); assert g, key; want(key, list(g.groups()))
g = re.search(r"^Pooled: M_cf = (\d+)/(\d+) = ([\d.]+); M'_cf = .*? = ([\d.]+); proviso \(b \+ o_cf\)/S_D = ([\d.]+) against 1 - alpha_D = ([\d.]+); p\*_cf .* is ([\d.]+)\.", cf, re.M); assert g, 'cf pooled'
want('cf', list(g.groups()))
g = re.search(r"^Proviso on the real o: \(b \+ o\)/S_D = (\d+)/(\d+) = (\d+\.\d+)", cf, re.M); assert g; want('proviso', [g.group(3)])
g = re.search(r"^Within-arm multiplier M' pooled = S_D/Delta_D = (\d+)/(\d+) = (\d+\.\d+)", cf, re.M); assert g; want("M'", [g.group(3)])
g = re.search(r"^Variant, literal traceability clause .*: acceptance (\d/6), alpha_D = (\d+)/(\d+) = ([\d.]+)", cf, re.M); assert g; want('literal', [g.group(1), g.group(4)])
g = re.search(r"^Variant, length rule .*: acceptance (\d/6), alpha_D = (\d+)/(\d+) = ([\d.]+)", cf, re.M); assert g; want('length', [g.group(1), g.group(4)])
g = re.search(r"^Print-back against the inline draft, o_D > S_I on every pair: (.*)\.$", cf, re.M); assert g
for pair in g.group(1).split('; '):
    k, o, _, si = pair.split(); assert int(o) > int(si), pair
    want('o_D > S_I ' + k, [o, si])
alphas = [float(x) for x in re.findall(r'^\| ab_s\d \|(?: [^|]* \|){5} ([\d.]+) \|', res, re.M)]; Ms = [float(x) for x in re.findall(r'^\| ab_s\d \|(?: [^|]* \|){7} ([\d.]+) \|', res, re.M)]
want('alpha range', [f'{min(alphas):.3f}', f'{max(alphas):.3f}']); want('M range', [f'{min(Ms):.2f}', f'{max(Ms):.2f}'])
# row order: for each brief and arm, every non-OK row must precede the valid row (ab_stats.py takes the last row)
rows = list(csv.DictReader(open(os.path.join(AB, 'ab_stats_v2.tsv'), encoding='utf-8'), delimiter='\t'))
last = {}; bad = 0
for i, r in enumerate(rows): last[(r['brief'], r['worker'] == 'hub')] = i
for k, i in last.items():
    if rows[i]['verdict'] != 'OK': bad += 1
print(('ok   row order: every ERROR row precedes its valid row' if not bad else f'MISS row order: {bad} brief/arm slot(s) end on a non-OK row')); fail += (bad > 0)
print('PASS: section 3.8 matches the generated files and the row order holds' if not fail else f'FAIL: {fail} check(s)'); sys.exit(1 if fail else 0)
