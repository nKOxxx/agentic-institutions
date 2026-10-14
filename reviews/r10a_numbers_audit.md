# R10A: numbers audit (DeepSeek, 2026-10-14)

Dispatched via hf_dispatch.sh; needle R10A-NUMBERS-OK; 9m56s, 27 tool calls.
Hub-side spot verification: PASS calls reproduce (see referee_deepseek_v179_2026-10-14.md Part 3).

---

Query: # TASK: Recompute every number in a paper from its artifacts (PASS/FAIL
matrix)
You are a hostile quantitative verifier. A paper claims numbers; your job is to
recompute each one from the raw artifacts and print a verdict matrix. Trust
nothing derived; re-derive by hand. Read-only mandate: do NOT write, edit, or
delete anything in the repository; return findings as text only.
## Inputs
- Paper full text (extracted): /tmp/paper_submission.txt  (21 pages; Parts 1-8
  plus Appendices A-B. Read it all.)
- Artifact repository: ~/agentic-institutions-paper (read-only for you)
  - instrument/hf_stats.tsv : the dispatch instrument. 26 data rows. The paper
    freezes the FIRST 16 rows (13 briefs + 3 probes). Columns: date, worker,
    brief, budget_s, dur_s, chars, msgs, verdict, artifact_s, admitted_s.
  - briefs/ : the dispatched brief files
  - data/t_freeze_2026-10-09T0416.csv + scripts/verify_t.sh + scripts/dedup_t.sh
  - instrument/hf_stats_v2.tsv, reviews/, sections/
- Numbers the hub's PRIVATE store produced (admitted chars, F3 traffic figures)
  are UNVERIFIABLE by design: mark them UNVERIFIABLE and check only their
  internal arithmetic (ratios, roundings, derived cells).
## Job
1. Extract EVERY numeric claim from the paper's Parts 3, 5, and Appendices A-B,
   plus Table 1 and the sensitivity grid. Include: wave rows (produced,
admitted,
   alpha, wall), totals, pooled alpha, 1/alpha bounds, the 3x3 breakeven grid
   (re-derive T from the printed formula (w/h) < p(1+T)(1-alpha) yourself),
   the pooled-alpha and b-restored and cached sensitivity rows, p* values
   (0.018 / 0.022 / 0.021; eviction variants 0.015 / 0.018), b/S = 19,262 B over
   114,535 B = 0.17, turn counts (343 raw, 122 burst, 221 distinct, 277
earlier),
   rates (16/16, 24/26, 12/13, 11/13, Clopper-Pearson [0.79, 1.00]), durations
   (7-525 s, median 29 frozen; 24-43 two-message; 109 cites; 479-525 sweeps),
   correlations r=0.89 / 0.86 (0.91 / 0.82 DeepSeek subset), F5 arithmetic
   (35 x 554 vs 7K), the sha-256 of the freeze csv, and the wave-1 instrument
   vs hub discrepancy figures (2,835 vs 22,824; 20,692 vs 23,440; 40,441 vs
   40,447; 30,430+20,137 exact).
2. Recompute each from the artifacts. For the grid and p*, re-derive from the
   formulas, not from any file.
3. SPECIAL: the paper says "the twelve drafting briefs in briefs/ total 19,262
   bytes". Enumerate briefs/ with sizes and determine which twelve-file subset
   (if any) sums to exactly 19,262. State the subset or report that none does.
4. Output: a PASS/FAIL/UNVERIFIABLE line per claim, grouped by section, with
   paper value vs recomputed value. End with a tally: X pass, Y fail, Z
   unverifiable, and a list of every FAIL with the corrected number.
5. Also recompute: the Table 1 wall maxima sum (43+109+525+163) and confirm the
   INC-007 correction (860 was wrong, 840 is right).
Be exact. If a recomputation differs from the paper by rounding only, say so
and mark PASS (rounding). Print every formula you use.
End with exactly this line: R10A-NUMBERS-OK
Initializing agent...
 ⚕ Hermes
    I'll start by reading the paper and exploring the artifacts repository.
   💻 preparing terminal…
   📖 preparing read_file…
   💻 $         wc -l /tmp/paper_submission.txt + 2 commands  0.2s
   📖 read      paper_submission.txt  0.2s
 ⚕ Hermes
    Let me continue reading the paper.
   📖 preparing read_file…
   📖 read      paper_submission.txt L501-900  0.1s
 ⚕ Hermes
    Let me read the rest of the paper (appendices).
   📖 preparing read_file…
   📖 read      paper_submission.txt L901-1300  0.2s
 ⚕ Hermes
    I've read the full paper. Now let me examine the artifacts. Let me set up
    tracking and read the key data files.
   📋 preparing todo…
   📖 preparing read_file…
   📖 preparing read_file…
   📖 preparing read_file…
   📋 plan      7 task(s)  0.0s
   📖 read      hf_stats.tsv  0.1s
   📖 read      hf_stats_v2.tsv  0.2s
   📖 read      NUMBER_SNAPSHOT.json  0.2s
 ⚕ Hermes
    I have the instrument data and number snapshot. Now let me compute the
    core arithmetic from the artifacts. Let me do a comprehensive computation.
   💻 preparing terminal…
   📖 preparing read_file…
   💻 $         wc -c briefs/* + 4 commands  0.3s
   📖 read      t_freeze_2026-10-09T0416.csv  0.2s
 ⚕ Hermes
    Let me run a comprehensive computation of the instrument-derived numbers,
    the subset-sum problem, and the freeze-csv analysis.
   💻 preparing terminal…
   💻 $         du = int(row['dur_s']) if w==0: probe_rows.append(row) + 1 command  0.3s
 ⚕ Hermes
    The committed 12 drafting briefs sum to 19,256, not 19,262. Let me do a
    rigorous subset-sum search to determine whether any twelve-file subset of
    briefs/ sums to exactly 19,262, and verify the other computations.
   💻 preparing terminal…
   💻 $         vals=[files[n] for n in names] found=[] for combo in itertools.combinations(range(len(names)),12): s=sum(vals[i] for i in combo) if s==19262: found.append([names[i] for i in combo]) print("12-file subsets summing to 19262:", len(found)) for c in found[:20]: print(" ", c, "=", sum(files[x] for x in c)) # also check any 12-subset that matches a "drafting" interpretation: all must be briefs (exclude probes/notes) # Report candidate subsets that are plausible (exclude review briefs / probe / note ideally, but report all) EOF  1.5s
 ⚕ Hermes
    The drafting-12 files sum to 19,256, not 19,262, and no twelve-file
    subset is the drafting set summing to 19,262 (the 6 subsets that do sum
    to 19,262 all mix in probe/review/resolve files). Let me verify the
    remaining claims.
   💻 preparing terminal…
   💻 $         n=len(s) + 7 commands  0.3s
 ⚕ Hermes
    The Clopper-Pearson function returned 0,0 (bug). Let me fix it and run
    the freeze-csv burst analysis plus the formula-derived p* and breakeven
    grid.
   💻 preparing terminal…
   💻 $         ids.append(int(parts[0])) # check ids inside a burst step by 2 print("\nid spacing check for 48-burst (find timestamps):") # group ids by ts grp=collections.defaultdict(list) for line in open('data/t_freeze_2026-10-09T0416.csv').read().strip().splitlines()[1:]: p=line.split(',') + 1 command  0.3s [exit 1]
 ⚕ Hermes
    The CSV uses CRLF line endings. Let me handle that properly.
   💻 preparing terminal…
   💻 $         cd ~/agentic-institutions-paper python3 - <<'EOF' import math, collections, csv print("=== FREEZE CSV burst analysis ===") rows=[] with open('data/t_freeze_2026-10-09T0416.csv', newline='', encoding='utf-8') as f: rd=csv.reader(f) hdr=next(rd) for r in rd: if r: rows.append(r) print("raw rows (excl header):", len(rows)) idc=[int(r[0]) for r in rows] ts=[r[1] for r in rows] cnt=collections.Counter(ts) burst={t:c for t,c in cnt.items() if c>=5} print("burst rows (>=5 same second):", sum(burst.values()), "across", len(burst), "timestamps") for t,c in sorted(burst.items(), key=lambda x:-x[1]): print(" ", c, "rows at", t) print("distinct =", len(rows)-sum(burst.values())) # id stepping within each burst grp=collections.defaultdict(list) for r in rows: grp[r[1]].append(int(r[0])) for t in ['2026-10-08 08:46:41','2026-10-08 14:13:40','2026-10-08 15:21:55','2026-10-08 17:42:43']: g=grp.get(t,[]) diffs=[g[i+1]-g[i] for i in range(len(g)-1)] print(f" {len(g)} at {t}: id-diff counts={collections.Counter(diffs)}") print("\n=== paper turn claims: raw 343, burst 122, distinct 221, earlier 277 ===") print("raw=343? ", len(rows)==343) print("burst=122? ", sum(burst.values())==122) print("distinct=221?", (len(rows)-sum(burst.values()))==221) print("277 earlier (v1.4 snapshot): from number snapshot supplement_v1_4") EOF  0.2s
 ⚕ Hermes
    I have all the data I need. Let me verify the per-brief b/S range
    (0.09–0.38) and the §3.4 brief-term bounds, then finalize.
   💻 preparing terminal…
   💻 $         cd ~/agentic-institutions-paper python3 - <<'EOF' # per-brief b/transcript for the 10 briefs where transcript>brief pair={'intro_brief.md':(3327,8709),'cites_brief.md':(1571,11983),'priorart_brief.md':(2678,30430), 'strike_brief.md':(2966,20137),'sec_s2_brief.md':(858,5840),'sec_s3a_brief.md':(1018,5552), 'sec_s3b_brief.md':(843,5951),'sec_s3c_brief.md':(820,6966),'sec_s3d_brief.md':(855,5289), 'sec_s4_brief.md':(964,10843)} r=[(b/tr*100) for b,tr in pair.values()] print("ratio range %:", round(min(r),1), "-", round(max(r),1)) print("individual:", [round(x,2) for x in r]) print("\n§3.4 brief-term bounds:") # pooled alpha 0.137 + b/S instr 0.1681 print("1/(0.137+0.1681)=", 1/(0.137+0.16812)) # both hub denom: alpha pooled 0.137, b/S=19256/137278 print("1/(0.137+", round(19256/137278,4),")=", 1/(0.137+19256/137278)) # wave1 alpha 0.17 + pooled brief print("1/(0.17+0.1681)=", 1/(0.17+0.16812)) # wave1 own hub denom: alpha 3853/22824, b/S=3356/22824 print("1/(alpha+bs)_w1hub=", 1/(3853/22824+3356/22824)) print("\ngrid checks (alpha=0.17):") for p in (0.3,0.5,0.7): for w in (15,20,30): T=w/(p*(1-0.17))-1 print(f" p={p} w/h={w}: T>{T:.1f}") print("pooled alpha 0.137:") for w in (15,20,30): T=w/(0.3*(1-0.137))-1 print(f" p=0.3 w/h={w}: T>{T:.1f}") print("b-restored alpha0.17 b/S0.168:") for w in (15,20,30): T=w/(0.3*(1-0.17-0.168))-1 print(f" p=0.3 w/h={w}: T>{T:.1f}") print("cached c=0.1 w/h=30 p=0.3 alpha0.17: 1+0.1T>", 30/(0.3*(1-0.17)), "-> T>", (30/(0.3*(1-0.17))-1)/0.1) print("p*:") print(" b=0:", 300/(300+20000*0.83)) print(" b=0.17:", 300/(300+20000*0.66)) print(" b=0.14:", 300/(300+20000*0.69)) print(" eviction b=0:", 300/(300+20000)) print(" eviction b=0.17(3400):", 300/(300+20000-3400)) print("F3 arith: 17.39/7.60=", 17.39/7.60, " 17.39MB/94.2KB=", 17390000/94200) print("2.1x range: 0.19/0.09=", 0.19/0.09) print("137278 check:", 22824+23440+50567+40447, " 18800=",3853+4447+7000+3500) EOF  0.3s
 ⚕ Hermes
    I now have everything verified. Let me compile the verdict matrix.
    VERDICT MATRIX ;  hostile recomputation of every claimed number from the
    public artifacts
    Read-only: I wrote nothing to the repository. All figures below
    re-derived by hand from
    instrument/hf_stats.tsv, data/t_freeze_2026-10-09T0416.csv, and briefs/.
    Formulas used
      alpha = admitted / produced
      grid: delegation wins iff (w/h) < p(1+T)(1-alpha), breakeven 1+T =
    (w/h)/(p(1-alpha))
      pooled alpha = sum(admitted)/sum(produced)
      p* = eps/(eps + S(1 - alpha - b/S)), eps=300, S=20000
      eviction p = eps/(eps + S - b), b=0 or 0.168*20000~3400
      b/S over instrument denom = b_sum/114535; hub denom = b_sum/137278
      1/alpha bounds; brief-term bound 1/(alpha + b/S)
      Clopper-Pearson 95%, k=n=16: lower = 0.025^(1/16)
      correlations = Pearson r
    =====================================================================
    PART 3: TABLE 1 (waves), pooled, totals
    =====================================================================
    Wave 1  produced instr      paper 2,835   recomputed 1,397+1,438=2,835
    PASS
    Wave 1  produced hub        paper 22,824  hub-audited, no instrument
    UNVERIFIABLE
    Wave 1  admitted 3,853      hub-audited, not logged
    UNVERIFIABLE
    Wave 1  alpha 0.17          3853/22824=0.1688 -> 0.17
    PASS (arith, hub denom)
    Wave 1  wall 43             max(37,43)=43
    PASS
    Wave 2  produced instr      paper 20,692  recomputed 8,709+11,983=20,692
    PASS
    Wave 2  produced hub 23,440 hub-audited
    UNVERIFIABLE
    Wave 2  admitted 4,447      hub-audited
    UNVERIFIABLE
    Wave 2  alpha 0.19          4,447/23,440=0.1897 -> 0.19
    PASS (arith)
    Wave 2  wall 109            max(24,109)=109
    PASS
    Wave 3  produced 50,567     recomputed 30,430+20,137=50,567 (exact)
    PASS
    Wave 3  admitted ~7,000     hub-audited
    UNVERIFIABLE
    Wave 3  alpha 0.14          7,000/50,567=0.1384 -> 0.14
    PASS (arith)
    Wave 3  wall 525            max(479,525)=525
    PASS
    Wave 4  produced instr      paper 40,441  recomputed sec sum=40,441
    PASS
    Wave 4  produced hub 40,447 hub-audited
    UNVERIFIABLE
    Wave 4  admitted ~3,500     hub-audited
    UNVERIFIABLE
    Wave 4  alpha ~0.09         3,500/40,447=0.0865 -> 0.09
    PASS (arith)
    Wave 4  wall 163            max(...)=163
    PASS
    Total   N=12                2+2+2+6=12
    PASS
    Total   produced 137,278    22,824+23,440+50,567+40,447=137,278
    PASS
    Total   admitted 18,800     sum 3,853+4,447+7,000+3,500=18,800 (arith)
    PASS (values hub/UNV)
    Total   pooled alpha 0.137  18,800/137,278=0.1370
    PASS
    Total   wall 840            sum of maxima (see below)
    PASS
    Resolver row N=1, produced 19,759 (instr), wall 234
    PASS
    WALL MAXIMA SUM and INC-007
      43+109+525+163 = 840
    PASS
      INC-007: 860 was wrong, 840 is right: confirmed, 840
    PASS
    Wave-vs-hub discrepancy figures
      2,835 vs 22,824 (wave 1)
    PASS
      20,692 vs 23,440 (wave 2)
    PASS
      40,441 vs 40,447 (wave 4)
    PASS
      30,430 + 20,137 = 50,567 (wave 3, exact match)
    PASS
    =====================================================================
    PART 3: brief term b, 114,535, b/S
    =====================================================================
    SPECIAL: "the twelve drafting briefs in briefs/ total 19,262 bytes"
      Enumerated all 24 files (wc -c). The twelve drafting briefs (outline,
    related,
      intro, cites, priorart, strike, sec_s2, sec_s3a/b/c/d, sec_s4) sum to
    19,256,
      NOT 19,262. Subset-search over all 12-element subsets: 6 subsets reach
    19,262,
      but every one mixes in non-drafting files (probe2_brief, reviewN_*,
    resolve,
      review2_common). NO twelve-file subset of the drafting briefs equals
    19,262;
      none of the 6 reaching subsets is the drafting set.
     FAIL
      corrected: 19,256 (committed copies); within the paper's own disclosed
      post-typography 1% tolerance, so the ratio below is unaffected.
    114,535 instrument-logged output bytes (waves 1-4)
      2,835+20,692+50,567+40,441 = 114,535
     PASS
    b/S = 0.17  19,256/114,535 = 0.1681 -> 0.17 (paper used 0.1682 -> 0.17)
     PASS (rounding)
    b/S = 0.14  excl rows 1-2: (19,256-3,356)/(111,700) = 0.1423 -> 0.14
     PASS (rounding)
    b/S = 0.14  hub denom: 19,256/137,278 = 0.1403 -> 0.14
     PASS (rounding)
    b/S range 0.09-0.38 on ten briefs (transcript > brief)
      0.088-0.382 recomputed (min priorart 0.088, max intro 0.382)
     PASS
    =====================================================================
    PART 3: 3x3 breakeven grid (re-derived from (w/h) < p(1+T)(1-alpha),
    alpha=0.17)
    =====================================================================
    p=0.3, w/h=15   T > 15/(0.3*0.83)-1 = 59.2   paper T>59.2 (T>=60)
     PASS
    p=0.3, w/h=20   T > 79.3   paper 79.3
     PASS
    p=0.3, w/h=30   T > 119.5  paper 119.5
     PASS
    p=0.5, w/h=15   T > 35.1   paper 35.1
     PASS
    p=0.5, w/h=20   T > 47.2   paper 47.2
     PASS
    p=0.5, w/h=30   T > 71.3   paper 71.3
     PASS
    p=0.7, w/h=15   T > 24.8   paper 24.8
     PASS
    p=0.7, w/h=20   T > 33.4   paper 33.4
     PASS
    p=0.7, w/h=30   T > 50.6   paper 50.6
     PASS
    All nine cells reproduce exactly.
    Sensitivity rows
    pooled alpha 0.137: p=0.3  15/(0.3*0.863)-1 = 56.9; 76.2; 114.9
     PASS
      "~4% drop": 59.2->56.9 = 3.9%
     PASS (rounding)
    b-restored (alpha=0.17, b/S=0.168): 15/(0.3*0.662)-1 = 74.5; 99.7; 150.1
     PASS
      factor (1-0.17)/(1-0.17-0.168) = 0.83/0.662 = 1.2538 -> 1.25
     PASS
    cached c=0.1: 1+0.1T > 30/(0.3*0.83) = 120.48, T > 1,194.8 -> T>1,195
     PASS
      "tenfold": 119.5 -> 1194.8
     PASS
    "cleared by 221 distinct turns": 221 > 119.5 (and > 150.1)
     PASS
    =====================================================================
    PART 3: p* values
    =====================================================================
    p* b=0:         300/(300+20000*0.83) = 0.0178 -> 0.018
     PASS
    p* b/S=0.17:    300/(300+20000*0.66) = 0.0222 -> 0.022
     PASS
    p* b/S=0.14:    300/(300+20000*0.69) = 0.0213 -> 0.021
     PASS
    eviction b=0:   300/(300+20000) = 0.0148 -> 0.015
     PASS
    eviction b meas:300/(300+20000-3400)=0.0178 -> 0.018
     PASS
    round to 0.02 everywhere
     PASS
    =====================================================================
    PART 3: 1/alpha bounds and brief-term multipliers
    =====================================================================
    1/alpha spans 5.3-11.1  (1/0.19=5.26, 1/0.09=11.11)
     PASS
    1/alpha unrounded wave-4 1/0.0865 = 11.56 -> 11.6
     PASS
    1/alpha pooled 1/0.137 = 7.30 -> 7.3
     PASS
    pooled brief-term 1/(0.137+0.1681) = 3.28 -> 3.3
     PASS
    both-hub-denom 1/(0.137+0.1403) = 3.61 -> 3.6
     PASS
    wave-1 alpha pooled-brief 1/(0.17+0.1681) = 2.96 -> 3.0
     PASS
    wave-1 own-hub-denom 1/(0.1688+0.1470) = 3.17 -> 3.2
     PASS
    alpha range [0.09,0.19], "2.1x range": 0.19/0.09 = 2.11
     PASS
    =====================================================================
    PART 3: turn counts
    =====================================================================
    343 raw rows          wc-l of freeze csv - 1 = 343
     PASS
    122 burst rows        same-second groups >=5: 48+18+26+30 = 122
     PASS
                           (48 @08:46:41, 18 @14:13:40, 26 @15:21:55, 30
    @17:42:43)
    221 distinct turns    343 - 122 = 221
     PASS
    277 earlier freeze (8 Oct)   historical hub-store value, not in repo
     UNVERIFIABLE
    ids step by 2 inside bursts (two gaps of 3 in last burst)   confirmed
    (48-burst: 47 diffs of 2; last: 2 gaps of 3)  PASS
    "5 threshold does no quiet work" (no 2/3/4-row timestamps)  confirmed
     PASS
    =====================================================================
    PART 3 / F2: rates
    =====================================================================
    16/16 exit-zero         all 16 frozen rows verdict OK
     PASS
    24/26 exit-zero         live table, rows 18-27: 2 TIMEOUT, 24 OK
     PASS
    12/13 hub-attested needles (briefs; row 13 = INC-001 variant)
     PASS
    11/13 mandate-compliant first-try (INC-001, INC-004 excluded)
     PASS
    11/13 = 0.846 -> ~0.85
     PASS
    Clopper-Pearson 95% [0.79, 1.00]
      lower = 0.025^(1/16) = 0.794 -> [0.79,1.00]
     PASS
    =====================================================================
    PART 3 / F4: durations and correlations
    =====================================================================
    duration range 7-525 s, mean check
     PASS
    median 29 s (n=16, even -> mean of 26 & 32 = 29); n=14 snapshot 31.5
     PASS
    two-message drafts 24-43 s (intro 24 ... related 43, excl probes)
     PASS
    18-message citation sweep 109 s (cites_brief)
     PASS
    research sweeps 479-525 s at 27-70 msgs (priorart 479/70, strike 525/27)
     PASS
    corr(dur, bytes) r=0.894 -> 0.89
     PASS
    corr(dur, msgs)  r=0.858 -> 0.86
     PASS
    DeepSeek subset: dur-bytes 0.909 -> 0.91, dur-msgs 0.816 -> 0.82
     PASS
    =====================================================================
    PART 3 / F5: inline counterfactual arithmetic
    =====================================================================
    35 x 554 = 19,390 ~ 19.4K vs ~7K admitted (floor; says savings)
     PASS
    plausible inline 30-60K (explicitly illustrative, labelled)
     PASS
    =====================================================================
    PART 3 / F3 & assorted
    =====================================================================
    F3 traffic figures (17.39 MB, 27,775 msgs, 75.6%, 7.60 MB, 94.2 KB,
      2.3x, 185x, 184.6)   hub private store, not reproducible
     UNVERIFIABLE
      internal arithmetic: 17.39/7.60 = 2.288 -> 2.3x  PASS;
      17.39 MB/94.2 KB = 184.6 -> 185x  PASS
    sha-256 of freeze csv: 5572cf45...4258 matches shasum
     PASS
    =====================================================================
    TALLY
    =====================================================================
    PASS:           91
    FAIL:            1
    UNVERIFIABLE:   11
    FAILURES (with corrected number):
      1. "the twelve drafting briefs in briefs/ total 19,262 bytes"
           Correct: 19,256 bytes (committed copies). The twelve drafting
    brief
           files sum to 19,256, not 19,262. No twelve-file subset of the
    drafting
           briefs equals 19,262; the 6 subsets that do sum to 19,262 all
    include
           non-drafting files (probe2_brief, review*_A/B/C, resolve,
    review2_common)
           and none is the drafting set. The derived ratios still hold
    because the
           paper's own disclosed post-typography caveat (bytes within 1%)
    absorbs
           19,256 -> 19,262 (a 0.03% shift) and b/S still rounds to 0.17.
    All grid cells, p* values, sensitivity rows, turn counts, rates,
    intervals,
    durations, correlations, F5 arithmetic, sha-256, the wall-maxima sum
    (840), and
    the INC-007 correction (860 wrong, 840 right) reproduce exactly or within
    stated
    rounding. The only exact-number failure is the 19,262 brief-byte total.
