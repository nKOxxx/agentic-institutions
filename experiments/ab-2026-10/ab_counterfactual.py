#!/usr/bin/env python3
"""ab_counterfactual.py: POST HOC, written after the run, NOT a pre-registered prediction. Two blocks:
(1) Counterfactual: the dispatcher's print-back o replaced by the status line alone. The status line is
    o_bytes - artifact_bytes (55 bytes on every valid row). v1.9 defined it as o_bytes - out_bytes, which subtracts
    the blank lines the dispatcher strips before its tail and gave 44 to 47; corrected at v1.9.1.
(2) Realized, derived from the same rows: the Corollary 1 proviso on the real o, the within-arm multiplier M' pooled,
    the six inequalities o_D > S_I, the inline arm's own print-back, and two variant readings of the adjudication rule
    (the literal traceability clause; the length rule) on the rows ADJUDICATION_NOTES.md names, hard-coded here.
Reads the same files as ab_stats.py; writes COUNTERFACTUAL.md with --write. Run with python3 -I."""
import csv, os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
rows = list(csv.DictReader(open(os.path.join(HERE, 'ab_stats_v2.tsv'), encoding='utf-8'), delimiter='\t'))
adj = {r['key']: r for r in csv.DictReader(open(os.path.join(HERE, 'ab_adjudication.tsv'), encoding='utf-8'), delimiter='\t')}
EPS = 300
# rows with at least one statement excluded as unsupported (ADJUDICATION_NOTES.md): the literal-clause variant rejects these
LITERAL_REJECT = {('ab_s1', 'D'), ('ab_s2', 'D'), ('ab_s4', 'D'), ('ab_s5', 'D'), ('ab_s6', 'D'), ('ab_s2', 'I'), ('ab_s4', 'I'), ('ab_s6', 'I')}
# arm-D drafts over the brief's 1,400-word limit (wc -w, needle line excluded): the length-rule variant rejects these
LENGTH_REJECT = {('ab_s2', 'D'), ('ab_s6', 'D')}
pairs = {}
for r in rows:
    k = r['brief'].replace('.md', ''); arm = 'I' if r['worker'] == 'hub' else 'D'
    a = adj.get(r['key'], {})
    S = int(r['artifact_bytes']) if r['artifact_bytes'] else int(r['out_bytes'])
    pairs.setdefault(k, {})[arm] = dict(S=S, b=int(r['brief_bytes']), o=int(r['o_bytes']), status=int(r['o_bytes']) - S,
                                         A=int(a.get('admitted_chars') or 0), acc=a.get('verdict') == 'ACCEPT' and r['verdict'] == 'OK')
P = sorted(pairs.items())
def pooled(reject=set()):
    SI = SD = b = o = A = D = 0; acc = 0
    for k, p in P:
        d, i = p['D'], p['I']
        accD = d['acc'] and (k, 'D') not in reject
        a = d['A'] if accD else 0
        delta = d['b'] + d['o'] + a + (0 if accD else d['o'])
        SI += i['S']; SD += d['S']; b += d['b']; o += d['o']; A += a; D += delta; acc += accD
    return dict(SI=SI, SD=SD, b=b, o=o, A=A, D=D, acc=acc, alpha=A / SD, M=SI / D)
base = pooled()
# block 1: counterfactual
per = []
for k, p in P:
    d, i = p['D'], p['I']; dcf = d['b'] + d['A'] + d['status']; per.append((k, d['status'], dcf, i['S'] / dcf))
SI, SD, b, A = base['SI'], base['SD'], base['b'], base['A']; st = sum(x[1] for x in per); Dcf = b + A + st
alpha = base['alpha']; bo_cf = (b + st) / SD; Sbar = SD / len(P)
pstar_cf = EPS / (EPS + Sbar * (1 - alpha - bo_cf)) if 1 - alpha - bo_cf > 0 else float('nan')
Mprime_cf = 1 / (alpha + bo_cf)
out = ['# Counterfactual (post hoc, not a prediction): print-back reduced to the status line', '',
       'Status-line bytes per arm-D row (o_bytes - artifact_bytes): ' + ', '.join(f'{k} {s}' for k, s, _, _ in per), '',
       '| pair | Delta_cf = b + A + status | M_cf = S_I / Delta_cf |', '|---|---|---|'] + [f'| {k} | {d} | {m:.2f} |' for k, _, d, m in per] + ['',
       f"Pooled: M_cf = {SI}/{Dcf} = {SI / Dcf:.2f}; M'_cf = S_D/Delta_cf = 1/(alpha_D + (b + o_cf)/S_D) = {Mprime_cf:.2f}; proviso (b + o_cf)/S_D = {bo_cf:.3f} against 1 - alpha_D = {1 - alpha:.3f}; "
       f"p*_cf at the paper's epsilon = {EPS} and S_bar_D = {Sbar:.0f} is {pstar_cf:.3f}.", '',
       "Reading: with the print-back reduced to its status line the within-arm bound M'_cf is inside the pre-registered band and the matched M_cf is below its 2.0 floor "
       f"by the size ratio S_I/S_D = {SI / SD:.2f}; p*_cf is above 0.05 because these artifacts are smaller than the 20,000 characters the paper's threshold assumed. "
       "Both figures treat the adjudication read as evicted; under the section 3.2 law as written the read is S_D per row and Delta_cf + S_D = Delta_D exactly, "
       f"returning M = {SI / (Dcf + SD):.2f}, the realized value.", '',
       '# Realized, derived from the same rows (post hoc arithmetic on pre-registered quantities)', '',
       f"Proviso on the real o: (b + o)/S_D = {b + base['o']}/{SD} = {(b + base['o']) / SD:.3f} against 1 - alpha_D = {1 - alpha:.3f}.",
       f"Within-arm multiplier M' pooled = S_D/Delta_D = {SD}/{base['D']} = {SD / base['D']:.2f}.",
       'Print-back against the inline draft, o_D > S_I on every pair: ' + '; '.join(f"{k} {p['D']['o']} > {p['I']['S']}" for k, p in P) + '.',
       f"Inline arm's own print-back: o_I/S_I = {sum(p['I']['o'] for _, p in P)}/{sum(p['I']['S'] for _, p in P)} = {sum(p['I']['o'] for _, p in P) / sum(p['I']['S'] for _, p in P):.3f}; "
       f"its measured delta to the dispatching hub b + o_I + A_I = {b + sum(p['I']['o'] for _, p in P) + sum(p['I']['A'] for _, p in P)}.", '']
lit = pooled(LITERAL_REJECT); ln = pooled(LENGTH_REJECT)
def marks(x): return f"acceptance {x['acc']}/6, alpha_D = {x['A']}/{x['SD']} = {x['alpha']:.3f}, M = {x['M']:.2f}; P1 {'PASS' if 0.09 <= x['alpha'] <= 0.19 else 'FAIL'}, P2 {'PASS' if x['acc'] / 6 >= 4 / 6 else 'FAIL'}"
out += [f"Variant, literal traceability clause (the eight drafts ADJUDICATION_NOTES.md lists with an excluded statement rejected): {marks(lit)}.",
        f"Variant, length rule applied (arm-D s2 and s6 over 1,400 words rejected): {marks(ln)}.",
        f"As adjudicated (the marks of record, from ab_stats.py): {marks(base)}.", '']
txt = '\n'.join(out); print(txt)
if '--write' in sys.argv:
    open(os.path.join(HERE, 'COUNTERFACTUAL.md'), 'w', encoding='utf-8').write(txt + '\n'); print('written COUNTERFACTUAL.md')
