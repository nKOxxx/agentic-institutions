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
ps = re.search(r'Pooled over the six pairs: [^\n]*', sec); pooled_sentence = ps.group(0) if ps else ''
def want_in(label, vals, where, wname):
    global fail
    for v in vals:
        s_ = fmt(v); ok = s_ in where; print(f'{"ok  " if ok else "MISS"} {label} {s_} in {wname}'); fail += (not ok)
for key, pat in [('alpha_D', r'alpha_D = (\d+)/(\d+) = ([\d.]+)'), ('p_hat', r'p_hat_D = (\d+)/(\d+)'), ('M', r'M = (\d+)/(\d+) = ([\d.]+)'),
                 ('b/S', r'b/S_D = ([\d.]+)'), ('o/S', r'o/S_D = ([\d.]+)'), ('S_I/S_D', r'S_I/S_D = ([\d.]+)'), ('alpha_I', r'alpha_I = (\d+)/(\d+) = ([\d.]+)')]:
    g = re.search(pat, pooled); assert g, key
    want_in(key, list(g.groups()), pooled_sentence if key != 'p_hat' else sec, 'pooled sentence' if key != 'p_hat' else 'section')
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
# the six marks: RESULTS.md's "- Pn ...: PASS/FAIL" against section 3.8's "Pn, ...: PASS/FAIL"
for n in range(1, 7):
    g = re.search(rf'^- P{n} [^:]*: (PASS|FAIL)', res, re.M); assert g, f'P{n} mark in RESULTS'
    h = re.search(rf'P{n}, .{{0,70}}?: (PASS|FAIL)', sec); ok = bool(h) and h.group(1) == g.group(1)
    print(f'{"ok  " if ok else "MISS"} mark P{n} {g.group(1)}'); fail += (not ok)
# the per-pair table: eight numeric cells per pair, section 3.8 (with thousands separators) against RESULTS.md
rt = {m.group(1): m.group(2).split(' | ') for m in re.finditer(r'^\| (ab_s\d) \| (.*?) \|$', res, re.M)}
st = {m.group(1): m.group(2).split(' | ') for m in re.finditer(r'^\| (s\d) \| (.*?) \|$', sec, re.M)}
for k, cells in rt.items():
    sk = k.replace('ab_', ''); bad = []
    if sk not in st: bad = ['row missing']
    else:
        for i, c in enumerate(cells[:8]):
            want_c = fmt(c) if c.isdigit() else c
            if i >= len(st[sk]) or st[sk][i] != want_c: bad.append(f'col{i}: {st[sk][i] if i < len(st[sk]) else "?"} != {want_c}')
    print(f'{"ok  " if not bad else "MISS"} pair {sk} ' + ('; '.join(bad) if bad else '8 cells')); fail += bool(bad)
# the abstract's wave figures: pooled M and the acceptance count must appear in the abstract line
abstract = draft.split('\n')[4]
gM = re.search(r'M = \d+/\d+ = ([\d.]+)', pooled).group(1); gA = re.search(r'p_hat_D = (\d+)/(\d+)', pooled)
gAl = re.search(r'alpha_D = \d+/\d+ = ([\d.]+)', pooled).group(1)
gLit = re.search(r"^Variant, literal traceability clause .*: acceptance (\d)/6", cf, re.M).group(1)
for label, v in [('abstract M', gM), ('abstract acceptance', f'{gA.group(1)} of {gA.group(2)}'), ('abstract alpha_D', gAl), ('abstract literal acceptance', f'{gLit} of 6')]:
    ok = v in abstract; print(f'{"ok  " if ok else "MISS"} {label} {v}'); fail += (not ok)
# row order: for each brief and arm, every non-OK row must precede the valid row (ab_stats.py takes the last row)
rows = list(csv.DictReader(open(os.path.join(AB, 'ab_stats_v2.tsv'), encoding='utf-8'), delimiter='\t'))
last = {}; bad = 0
for i, r in enumerate(rows): last[(r['brief'], r['worker'] == 'hub')] = i
for k, i in last.items():
    if rows[i]['verdict'] != 'OK': bad += 1
print(('ok   row order: every ERROR row precedes its valid row' if not bad else f'MISS row order: {bad} brief/arm slot(s) end on a non-OK row')); fail += (bad > 0)
print('PASS: section 3.8 matches the generated files and the row order holds' if not fail else f'FAIL: {fail} check(s)'); sys.exit(1 if fail else 0)
