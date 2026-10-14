#!/usr/bin/env python3
"""ab_counterfactual.py: POST HOC, written after the run, NOT a pre-registered prediction. Replaces the dispatcher's
print-back o with the status line alone (o_bytes - out_bytes on each row) and recomputes M, the Corollary 1 proviso
and p* at the paper's epsilon estimate of 300. Reads the same files as ab_stats.py; writes COUNTERFACTUAL.md.
Run with: python3 -I experiments/ab-2026-10/ab_counterfactual.py [--write]"""
import csv, os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
rows = list(csv.DictReader(open(os.path.join(HERE, 'ab_stats_v2.tsv'), encoding='utf-8'), delimiter='\t'))
adj = {r['key']: r for r in csv.DictReader(open(os.path.join(HERE, 'ab_adjudication.tsv'), encoding='utf-8'), delimiter='\t')}
pairs = {}
for r in rows:
    k = r['brief'].replace('.md', ''); arm = 'I' if r['worker'] == 'hub' else 'D'
    a = adj.get(r['key'], {})
    pairs.setdefault(k, {})[arm] = dict(S=int(r['artifact_bytes'] or r['out_bytes']), b=int(r['brief_bytes']), o=int(r['o_bytes']),
                                         status=int(r['o_bytes']) - int(r['out_bytes']), A=int(a.get('admitted_chars') or 0), acc=a.get('verdict') == 'ACCEPT')
SI = SD = b = A = st = 0; per = []
for k, p in sorted(pairs.items()):
    D, I = p['D'], p['I']
    d = D['b'] + D['A'] + D['status']
    per.append((k, D['status'], d, round(I['S'] / d, 2)))
    SI += I['S']; SD += D['S']; b += D['b']; A += D['A']; st += D['status']
alpha = A / SD; bo = (b + st) / SD; Sbar = SD / len(pairs); eps = 300
pstar = eps / (eps + Sbar * (1 - alpha - bo)) if 1 - alpha - bo > 0 else float('nan')
out = ['# Counterfactual (post hoc, not a prediction): print-back reduced to the status line', '',
       'Status-line bytes per arm-D row (o_bytes - out_bytes): ' + ', '.join(f'{k} {s}' for k, s, _, _ in per), '',
       '| pair | Delta_cf = b + A + status | M_cf = S_I / Delta_cf |', '|---|---|---|'] + [f'| {k} | {d} | {m:.2f} |' for k, _, d, m in per] + ['',
       f'Pooled: M_cf = {SI}/{b + A + st} = {SI / (b + A + st):.2f}; proviso (b + o_cf)/S_D = {bo:.3f} against 1 - alpha_D = {1 - alpha:.3f}; '
       f'p*_cf at the paper\'s epsilon = 300 and S_bar_D = {Sbar:.0f} is {pstar:.3f}.', '',
       'Reading: removing the print-back entirely leaves M_cf below the pre-registered floor of 2.0 (b/S is 0.284 on these briefs) and p*_cf above 0.05 '
       '(these artifacts are smaller than the 20,000 characters the paper\'s threshold assumed). The counterfactual does not rescue P3 or P6.']
print('\n'.join(out))
if '--write' in sys.argv:
    open(os.path.join(HERE, 'COUNTERFACTUAL.md'), 'w', encoding='utf-8').write('\n'.join(out) + '\n'); print('\nwritten COUNTERFACTUAL.md')
