# Run sheet for the pre-registered A/B wave (hub side)

Run on the hub account, from the repository root, after `git pull` shows tag v1.8.3 or later and
`git log -1 -- experiments/ab-2026-10/PROTOCOL.md` is dated before your first dispatch. Read PROTOCOL.md first.

## 0. One-time setup

```bash
cd ~/agentic-institutions-paper && git pull && git status --short
export AB=experiments/ab-2026-10
export HF_STATS=$PWD/$AB/ab_stats_v2.tsv HF_OUT_DIR=$PWD/$AB/out
export AB_HUB_MODEL="<the model the hub session runs on, exactly as hermes names it>"
export AB_HUB_PROVIDER="<its provider name as hermes names it>"
unset HERMES_KANBAN_TASK
```

Record the two values you set in a file `$AB/hub_model.txt` (one line: model, provider), since the CLI logs the model
only in the .err files.

## 1. Dispatch, k = 1..6, arm D then arm I, no retries

```bash
for k in 1 2 3 4 5 6; do
  bash instrument/hf_dispatch.sh $AB/briefs/ab_s$k.md deepseek AB-S$k-OK 850
  bash instrument/hf_dispatch.sh $AB/briefs/ab_s$k.md hub      AB-S$k-OK 850
done
```

Each call prints the response tail and a status line ending in `key=<key>`. Twelve rows land in
`$AB/ab_stats_v2.tsv`; raw output in `$AB/out/<key>.out`. If a dispatch fails a precondition it exits 2 and writes
no row; fix the cause and rerun that one call. Do not delete rows.

## 2. Adjudicate, one row at a time, under PROTOCOL.md's rule

For each of the twelve keys: read `$AB/out/<key>.out`. Decide ACCEPT or REJECT with a reason code (FAB, SCOPE,
NEEDLE, LEN, OTHER). For ACCEPT, copy the sentences you would weave into SUPPLEMENT.md, unedited, into
`$AB/admitted/<key>.md`, then:

```bash
bash $AB/ab_admit.sh <key> ACCEPT OK $AB/admitted/<key>.md
```

For REJECT:

```bash
bash $AB/ab_admit.sh <key> REJECT FAB
```

Apply the same rule to the inline (hub) rows; their admitted file gives the hub's self-admission.

## 3. Compute and commit

```bash
python3 -I $AB/ab_stats.py --write
git add $AB && git commit -m "ab-2026-10: twelve rows, adjudicated, RESULTS.md generated" && git push
```

Commit the data exactly once, after step 2 is complete. The paper's §3.8 is written from RESULTS.md after that.
