# ab_adj.py <repo> <key> <verdict> <reason> [sentences.txt]: verify each admitted sentence is a verbatim substring of the
# CR-stripped draft, write admitted/<key>.md, then call ab_admit.sh. Sentences file: one sentence per line.
import sys, io, os, subprocess
repo, key, verdict, reason = sys.argv[1:5]; sf = sys.argv[5] if len(sys.argv) > 5 else None
AB = os.path.join(repo, 'experiments/ab-2026-10')
if verdict == 'ACCEPT':
    draft = io.open(os.path.join(AB, 'out', key + '.out'), encoding='utf-8').read().replace('\r', '')
    sents = [l.strip() for l in io.open(sf, encoding='utf-8') if l.strip()]
    bad = [s for s in sents if s not in draft]
    if bad: print('NOT VERBATIM:', *bad, sep='\n  '); sys.exit(1)
    out = os.path.join(AB, 'admitted', key + '.md')
    io.open(out, 'w', encoding='utf-8').write('\n'.join(sents) + '\n')
    r = subprocess.run(['bash', os.path.join(AB, 'ab_admit.sh'), key, verdict, reason, out], capture_output=True, text=True)
else:
    r = subprocess.run(['bash', os.path.join(AB, 'ab_admit.sh'), key, verdict, reason], capture_output=True, text=True)
print(r.stdout.strip(), r.stderr.strip()); sys.exit(r.returncode)
