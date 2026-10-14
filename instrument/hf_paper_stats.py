#!/usr/bin/env python3
"""Live stats for the agentic-institutions paper. Run: python3 hf_paper_stats.py
Regenerates stats_live.md from hf_stats.tsv + state.db. Stdlib only."""
import os, sqlite3, sys
from datetime import datetime

import sys
HOME = os.path.expanduser('~')
REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# paths as arguments: TSV [DB [OUT]]; defaults to the repo copy of the TSV; store-dependent stats are skipped without DB
TSV = sys.argv[1] if len(sys.argv) > 1 else os.path.join(REPO, 'instrument', 'hf_stats.tsv')
DB = sys.argv[2] if len(sys.argv) > 2 else os.path.join(HOME, '.hermes/state.db')
OUT = sys.argv[3] if len(sys.argv) > 3 else os.path.join(REPO, 'stats_live.md')
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

# Store-derived figures (paper Appendix A F3) need the hub's private state.db. On a clone without it, or with a
# store that does not hold both the hub session and the worker sessions, these lines are marked unavailable
# instead of printing a ratio over an empty denominator (v1.7.7; the v1.7.1 guard covered a missing store only).
hub_chars = wr_total = wr_artifacts = None
if os.path.isfile(DB):
    db = sqlite3.connect(DB)
    q = lambda s, p=(): db.execute(s, p).fetchone()
    try:
        hc = sum(q("SELECT COALESCE(SUM(LENGTH(content)),0) FROM messages WHERE session_id=?", (s,))[0] for s in HUB_SESSIONS)
        if hc > 0:
            workers = [r[0] for r in db.execute("SELECT DISTINCT session_id FROM messages WHERE role='user' AND content LIKE '%TASK:%'")]
            workers = [w for w in workers if w not in HUB_SESSIONS]
            wt, wa = 0, 0
            for w in workers:
                wt += q("SELECT COALESCE(SUM(LENGTH(content)),0) FROM messages WHERE session_id=?", (w,))[0]
                last = db.execute("SELECT content FROM messages WHERE session_id=? AND role='assistant' ORDER BY id DESC LIMIT 1", (w,)).fetchone()
                if last: wa += len(last[0])
            if workers and wt > 0:
                hub_chars, wr_total, wr_artifacts = hc, wt, wa
    except sqlite3.Error:
        pass
STORE_NOTE = "unavailable without the hub's store (Appendix A F3 is author-only)"

store_line1 = (f"- lifetime chars, hub: {hub_chars:,} | workers: {wr_total:,} | hub:worker-traffic: {hub_chars/max(wr_total,1):.1f}×"
               if hub_chars else f"- lifetime chars: {STORE_NOTE}")
store_line2 = (f"- artifacts only (final assistant message per worker session): {wr_artifacts:,} | hub:artifact: {hub_chars/max(wr_artifacts,1):.1f}×"
               if hub_chars else f"- artifacts only: {STORE_NOTE}")

def qtl(xs, f):
    xs = sorted(xs); return xs[min(len(xs)-1, int(f*len(xs)))]

rep = f"""# LIVE STATS, regenerated {datetime.now().strftime('%Y-%m-%d %H:%M')}

- dispatches: {n} | p-hat: {ok}/{n} = {ok/n:.2f}
- duration s: min {durs[0]} / p50 {qtl(durs,.5)} / p90 {qtl(durs,.9)} / max {durs[-1]}
- worker msgs: p50 {qtl(msgs,.5)} / max {msgs[-1]}
- by worker: {', '.join(f'{k}×{v}' for k,v in sorted(by_worker.items()))}
- artifact_s logged: {len(art)}/{n} rows (instrument v1.2, from 2026-10-08)
- alpha (admitted/artifact): {f'{sum(a for _,a in adm)/sum(s for s,_ in adm):.2f} over {len(adm)} adjudicated rows' if adm else 'no adjudicated rows yet, hub fills admitted_s at weave time'}
{store_line1}
{store_line2}
- frozen manuscript values (v1.1 freeze): 2× / 185×, the live ratio drifts upward with hub lifetime by design (int-truncated); cite frozen values in the paper, live values only with a timestamp

Paper: ~/agentic-institutions-paper/DRAFT.md (paper §3.7 and Appendix A F3 cite the frozen values; this file is live).
Update HUB_SESSIONS after a session restart. α per wave: measured in RESULTS.md.
"""
open(OUT, 'w').write(rep)
print(rep)
