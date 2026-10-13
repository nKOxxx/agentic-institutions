#!/usr/bin/env python3
"""Live stats for the agentic-institutions paper. Run: python3 hf_paper_stats.py
Regenerates stats_live.md from hf_stats.tsv + state.db. Stdlib only."""
import os, sqlite3, sys
from datetime import datetime

HOME = os.path.expanduser('~')
TSV = os.path.join(HOME, '.hermes/scripts/hf_stats.tsv')
OUT = os.path.join(HOME, 'agentic-institutions-paper/stats_live.md')
DB = os.path.join(HOME, '.hermes/state.db')
WORKER_PREFIX = '2026'  # worker sessions are timestamp-named; hub sessions excluded below
HUB_SESSIONS = {'20260725_131848_6f3bc9c8'}  # this hub's session lineage (update on restart)

rows = [l.split('\t') for l in open(TSV).read().strip().splitlines()[1:] if l.strip()]
n = len(rows)
ok = sum(1 for r in rows if r[7] == 'OK')  # verdict col (r[-1] is admitted_s since v1.2)
durs = sorted(int(r[4]) for r in rows)
msgs = sorted(int(r[6]) for r in rows if r[6].isdigit())
art = [int(r[8]) for r in rows if len(r) > 8 and r[8].isdigit()]
adm = [(int(r[8]), int(r[9])) for r in rows if len(r) > 9 and r[8].isdigit() and r[9].isdigit()]
by_worker = {}
for r in rows:
    by_worker[r[1]] = by_worker.get(r[1], 0) + 1

db = sqlite3.connect(DB)
q = lambda s, p=(): db.execute(s, p).fetchone()
hub_chars = sum(q("SELECT COALESCE(SUM(LENGTH(content)),0) FROM messages WHERE session_id=?", (s,))[0] for s in HUB_SESSIONS)
workers = [r[0] for r in db.execute("SELECT DISTINCT session_id FROM messages WHERE role='user' AND content LIKE '%TASK:%'")]
workers = [w for w in workers if w not in HUB_SESSIONS]
wr_total, wr_artifacts = 0, 0
for w in workers:
    wr_total += q("SELECT COALESCE(SUM(LENGTH(content)),0) FROM messages WHERE session_id=?", (w,))[0]
    last = db.execute("SELECT content FROM messages WHERE session_id=? AND role='assistant' ORDER BY id DESC LIMIT 1", (w,)).fetchone()
    if last: wr_artifacts += len(last[0])

def qtl(xs, f):
    xs = sorted(xs); return xs[min(len(xs)-1, int(f*len(xs)))]

rep = f"""# LIVE STATS, regenerated {datetime.now().strftime('%Y-%m-%d %H:%M')}

- dispatches: {n} | p-hat: {ok}/{n} = {ok/n:.2f}
- duration s: min {durs[0]} / p50 {qtl(durs,.5)} / p90 {qtl(durs,.9)} / max {durs[-1]}
- worker msgs: p50 {qtl(msgs,.5)} / max {msgs[-1]}
- by worker: {', '.join(f'{k}×{v}' for k,v in sorted(by_worker.items()))}
- artifact_s logged: {len(art)}/{n} rows (instrument v1.2, from 2026-10-08)
- alpha (admitted/artifact): {f'{sum(a for _,a in adm)/sum(s for s,_ in adm):.2f} over {len(adm)} adjudicated rows' if adm else 'no adjudicated rows yet, hub fills admitted_s at weave time'}
- lifetime chars, hub: {hub_chars:,} | workers: {wr_total:,} | hub:worker-traffic: {int(hub_chars/max(wr_total,1))}×
- artifacts only (final assistant message per worker session): {wr_artifacts:,} | hub:artifact: {int(hub_chars/max(wr_artifacts,1))}×
- frozen manuscript values (v1.1 freeze): 2× / 185×, the live ratio drifts upward with hub lifetime by design (int-truncated); cite frozen values in the paper, live values only with a timestamp

Paper: ~/agentic-institutions-paper/DRAFT.md (§III.6 consumes this file).
Update HUB_SESSIONS after a session restart. α per wave: measured in RESULTS.md.
"""
open(OUT, 'w').write(rep)
print(rep)
