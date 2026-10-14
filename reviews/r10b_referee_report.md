# R10B: hostile referee report (DeepSeek, 2026-10-14)

Dispatched via hf_dispatch.sh; needle R10B-REFEREE-OK; 3m33s, 11 tool calls.
Hub-side annotations: see referee_deepseek_v179_2026-10-14.md Part 3 (L3 'silently' corrected; 19,256 forensics added).

---

Query: # TASK: Hostile referee review of "Agentic Institutions" v1.7.9 (21-page
paper)
You are referee #2: hostile, expert in multi-agent systems + mechanism design +
LLM economics. The paper claims to be a measured instantiation of delegation
economics inside a live hub-and-worker institution. Your job: try to reject it.
Read-only mandate: do NOT write or edit anything; findings as text only.
## Inputs
- Paper full text: /tmp/paper_submission.txt (read ALL 21 pages before judging)
- Companion repo (read-only): ~/agentic-institutions-paper
  (instrument/, briefs/, sections/, reviews/, data/, scripts/, incident log)
## Read the authors' own honesty machinery FIRST
The paper self-reports 7 incidents (INC-001..008), labels alpha as hub-audited,
admits the needle test was satisfiable by the CLI echo (INC-008), admits no
admitted count is logged, and states Assumption E (persistence) is violated by
its own store. Do not re-discover what the paper already confesses; your value
is in what it does NOT confess. Skip praise for the honesty; note it once and
move on.
## Attack lanes (cover all, then add your own)
L1. NOVELTY: Is the delegation condition genuinely more than FrugalGPT/RouteLLM
    per-query cascade + a horizon multiplier? Is the Karlin rent-or-buy
    framing load-bearing or decoration? Does [15] (Anchan & Sen attention
    tax) already contain the contribution? Is the paper honest that under its
    own eviction reality (3.6) the contribution collapses to the cascade
    condition w/h < p?
L2. MEASUREMENT VALIDITY: alpha is hub-audited, unlogged, rounded to nearest
    hundred for waves 3-4, denominator disputed 8x on wave 1. p <= 11/13 from
    the paper's own incident record. T = 343 raw rows with 122 compaction
    bursts inferred from timestamp spacing alone (ids in archived csv only).
    Are ANY of the measured results load-bearing on verifiable quantities?
    Which single number, if wrong, kills the paper?
L3. INTERNAL CONSISTENCY: abstract says "at most 11 of 13 accepted" and
    "ranged over [0.09, 0.19]" - do all sections use the same denominators?
    Does the 1/alpha bound wording (5.3-11.1, 7.3 pooled) survive its own
    caveats? Does §3.4's "identity, not a result" framing hold? Do the
    maturity labels (IMPLEMENTED/DESIGNED) stay consistent across Parts 4-5?
L4. THE SELF-APPLICATION LOOP: the paper was written by the system it studies.
    Is the reflexive framing a feature or an unfalsifiable shell game? What
    would a falsified version of this paper even look like? Is "the institution
    studies itself" testable, or is every failure absorbable as another incident
    row?
L5. THE CLOPPER-PEARSON INTERVAL: §3.7 prints [0.79, 1.00] on 16/16 then
    admits i.i.d. is violated. Is printing a confidence interval whose
    assumptions the same sentence disclaims honest statistics or
    statistics-theater?
L6. MISSING EXPERIMENTS: what is the ONE cheap experiment the paper needed to
    run to make its central claim (free-lane delegation wins for p > 0.02)
    more than an arithmetic identity on unlogged quantities?
L7. PUBLICATION READINESS: venue fit (which venue: CS conference, economics
    workshop, ML conference?) and the 3 defects a desk-reject would cite.
## Output
Sections L1..L7. For each: 2-6 sentences, specific, quoting line-level
evidence (quote the paper). Then: SCORE 1-10 with justification, a verdict
line (SUBMIT AS-IS / MINOR-REVISIONS / MAJOR-REVISIONS / NOT-READY), and the
top-5 fix list in priority order.
End with exactly this line: R10B-REFEREE-OK
Initializing agent...
 ⚕ Hermes
    I'll start by reading the full paper and exploring the companion repo
    structure in parallel.
   📖 preparing read_file…
   🔎 preparing search_files…
   📖 read      paper_submission.txt  0.3s
   🔎 find      *  0.3s
 ⚕ Hermes
    I'll continue reading the paper and examine the key data files in
    parallel.
   📖 preparing read_file…
   📖 preparing read_file…
   📖 read      paper_submission.txt L501-900  0.2s
   📖 read      INCIDENT_LOG.md  0.2s
 ⚕ Hermes
    Continuing to read the final pages of the paper, and examining the
    instrument data.
   📖 preparing read_file…
   📖 preparing read_file…
   📖 read      paper_submission.txt L901-1200  0.2s
   📖 read      hf_stats.tsv  0.2s
 ⚕ Hermes
    I've read the full 21-page paper, the complete incident log, and the raw
    instrument table through row 26. Let me verify a few load-bearing numbers
    myself before writing the review, since a hostile referee who doesn't
    check the arithmetic isn't hostile enough.
   🐍 preparing execute_code…
   🐍 exec      import math  0.1s
 ⚕ Hermes
    Verification complete. My arithmetic confirms the paper's internal math
    engine is self-consistent (Table 1 totals, pooled alpha = 0.137, p-star
    values, grid horizons, Clopper-Pearson [0.79, 1.00] all reproduce), but
    it also confirms one real discrepancy (wave 4: instrument sum 40,441 vs
    Table 1's 40,447) and sharpens my central attack. Here is the review.
    ==================================================================
    REFEREE #2 (hostile): AGENTIC INSTITUTIONS, v1.7.9
    ==================================================================
    Preface. I read all 21 pages, the incident log (INC-001..008 plus
    addenda), and the raw instrument table through row 26, and I recomputed
    every headline quantity. I acknowledge the honesty machinery once and
    then ignore it as instructed: the paper confesses nearly everything it
    can, and does so in unusually fine detail. That confession is itself part
    of what I attack, because it is structurally absorbed as method.
    Acknowledged; moving on.
    L1 NOVELTY. The paper concedes its own load-bearing claims reduce to
    known results, and I verified the concession is not cosmetic. The
    paid-lane condition is, in the paper's words, "the rent-or-buy breakeven
    of Karlin et al. [34]" (line 168) and the difference from
    FrugalGPT/RouteLLM "is one term, the remaining-turns horizon (1+T)" (line
    166). But that one term dies immediately: "Under eviction, at zero
    overhead, our condition reduces to theirs" (line 167-168), and §3.6 is
    explicit that "the (1+T) amplification in (nexists) disappears. The
    1/alpha bound of §3.4 is then a property of admission policy, not of
    delegation" (line 447-448). The other pillar is admitted to be empty:
    "This is an identity, not a result: 1/alpha is alpha's definition
    inverted" (line 403). Anchan and Sen [15] already price the same
    inline-vs-delegate trade (attention tax vs handoff tax, line 153-155);
    the paper is the "machine-institution analogue" (line 155). And
    Assumption E, the entire justification for the horizon term and the paid
    grid, "this hub's own store compacts, so the measured result is the
    free-lane one" (line 77). Once the horizon term (inoperative) and the
    1/alpha bound (an identity) are stripped, what survives of the formal
    contribution is w/h < p with free workers and a p-star of 0.02, which is
    the known cascade rule [23][24] at w = 0. The institution anatomy
    restates electronic institutions [31], which the paper itself narrows:
    "the gap is narrower than 'no prior institutional structure'" (line 174).
    Karlin is decoration: the paper admits the classical rent-or-buy
    switching strategy "does not transfer directly" (line 326). Honesty about
    thin novelty does not make thin novelty thick. Score: 3/10.
    L2 MEASUREMENT VALIDITY. My independent recomputation shows the
    arithmetic engine is flawless and the data feed is unverifiable, which is
    the point. The single number that kills the paper is alpha, the admitted
    fraction, because it is simultaneously the most load-bearing and the
    least measured: it sets both the free-lane threshold p-star (0.018 to
    0.022 in the corollary, line 318-320) and the headline 1/alpha context
    multiplier (5.3 to 11.1, line 404). Yet "No admitted count for any wave
    is instrument-logged. The admitted column of the instrument exists from 8
    October 2026 but no row carries a value" (line 255-257), "Waves 3 and 4
    are reported to the nearest hundred because the hub did not record the
    exact figure" (line 256-257), "All four alpha values are therefore
    hub-audited estimates" (line 258), and "admitted... can include hub
    expansion of the worker text, so alpha is not bounded by 1" (line
    186-187). If the true alpha were near 1, as nothing prevents, then
    1/alpha collapses toward 1 and the free-lane threshold p-star rises
    toward p > alpha (the paper states this escalation itself at line
    473-474: "If each failed attempt left its admitted share, the free-lane
    threshold would be p > alpha"), which would falsify the central claim.
    The wave-1 denominator is contested 8x (line 475-476), p is an
    upper-bounded, hub-attested 11/13 (line 502-503), and the T count of 343
    rests on 122 compaction bursts "inferred" purely from timestamp spacing
    because "the archive carries only id and timestamp" and "the store
    columns that would confirm it... are not public" (line 384-389). Every
    [B]-labelled quantity is hub-audited; the one [M] quantity, completions,
    is exit-zero status, which the paper itself calls "a calibration signal,
    not a performance metric" (line 741). No measured result is load-bearing
    on a verifiable quantity, because the load-bearing quantity is the one
    that is not logged. Score: 2/10.
    L3 INTERNAL CONSISTENCY. The denominators hold: "at most 11 of 13"
    appears identically in the abstract (line 28), §3.7 (line 502-503), and
    Appendix F2 (line 1100), and [0.09, 0.19] matches Table 1 waves and
    Appendix F1. The 1/alpha wording is disciplined: it is everywhere
    labelled an admission-only upper bound, and §3.4's "identity, not a
    result" framing (line 403) is honored. Maturity labels are consistent
    across Parts 4-5 (alpha/needle IMPLEMENTED, registry DESIGNED, ladder
    DESIGNED, rollback DESIGNED and nowhere claimed as run). I found one
    genuine residual defect: Table 1 prints wave 4 "Produced (bytes) 40,447"
    and the total 137,278 depends on it, but the instrument sum of the six
    section rows is 40,441 (I summed 5,840+5,289+5,951+5,552+6,966+10,843 =
    40,441); the §3.1 note discloses "40,447 vs 40,441" (line 251) but the
    table and total silently use the hub-audited number with no per-cell
    flag, which is exactly the class of weave-time discrepancy the build gate
    (INC-007 fix) purports to catch. A second tension: the free-lane argument
    treats an upper bound (p at most 0.85) as if it were the rate, then
    compares it to a threshold of 0.02; the gap is so large the comparison
    carries no information, which is not an error but reveals the "measured
    result" is not actually exercising any measurement. Score: 8/10.
    L4 SELF-APPLICATION LOOP. The reflexive framing is an unfalsifiable shell
    game dressed as a feature. "The paper's measurements are the
    institution's operational log. Its incidents are its governance data"
    (line 825-826). The reviewer panels are "not peer review. The reviewers
    were not independent of the institution and were not blind to each other"
    (line 829-830), they are the same free-lane worker species (line
    830-832), and rounds 1-2 have "their model... not recorded" (line
    833-834). Every possible failure is pre-absorbed as another incident row;
    the record grew to absorb the panel's own errors (INC-007 and its 14 Oct
    addendum, line 1172-1176). A falsified version of this paper is hard to
    even draw: the paid-lane claim sits on an assumption (E) the paper says
    its own store violates, the verification-binding conjecture is explicitly
    untested ("Nothing in this paper measures D expanding or K saturating,"
    line 424-425), and the free-lane claim has a threshold of 0.02 versus an
    estimated p of 0.85, so it cannot fail by construction. The incident log
    functions as a rhetorical shield: criticism becomes "another incident we
    already confessed," and the confession is then counted as evidence the
    method works, a circularity the paper does not break. Testability is the
    missing layer, and it is the layer no amount of transparency substitutes
    for. One concession: at least the paper labels the reflexivity plainly
    instead of hiding it. Score: 2/10.
    L5 CLOPPER-PEARSON. This is statistics-theater. Line 503-505: "The
    exit-zero rate 16/16 carries a Clopper-Pearson 95% interval of [0.79,
    1.00] under an i.i.d. assumption that the self-selected, heterogeneous
    briefs do not satisfy," followed by the palliative "The interval bounds a
    pooled rate over this brief mix." I verified the interval is
    arithmetically correct (two-sided exact lower bound = 0.025^(1/16) =
    0.794). That makes it worse, because it is a correctly computed interval
    on a quantity the same sentence disclaims and on a measurement the paper
    elsewhere declares meaningless ("a calibration signal, not a performance
    metric," line 741; the needle outcome "was not logged for any public
    row," line 915). Printing a confidence interval whose assumptions you
    simultaneously negate, on a variable (exit status) orthogonal to the
    institutional claim (acceptance), for which the meaningful variable is
    unmeasured, is not honest statistics; it is a decorative number. The
    honest move is to print no interval, or to log acceptance and interval
    the thing that matters. Score: 3/10.
    L6 MISSING EXPERIMENT. One cheap experiment converts the paper from
    arithmetic identity to measurement: run the same briefs two ways, inline
    (hub drafts directly) and delegated, in fresh logged sessions, with
    admitted characters instrument-logged on both arms, and report the delta
    in context budget consumed and the realized alpha. Right now alpha is
    hub-attested and the free-lane "win" reduces to "0.02 < 0.85," which is
    true without running anything; that is the tell. The paper even names the
    machinery it would need and doesn't build it: the persistent-persistence
    duration is "the next instrument addition" (line 455-456), and admitted
    characters are unlogged in every v1 row (line 510-511). The v2 dispatcher
    adds b and o logging but still does not log acceptance outcome or a
    measured admitted count (line 524-531), so even the fix does not fix the
    measurability gap. The single experiment: a controlled
    inline-vs-delegated A/B of matched briefs with logged admission on both
    arms, which would make the 1/alpha multiplier and p-star measured rather
    than asserted. Its absence is fatal given the paper's own headline is
    that it "instantiates every measured quantity in a live institution"
    (line 22). Score: 2/10.
    L7 PUBLICATION READINESS. Venue fit: this is not a CS systems or ML
    conference paper, there is no algorithmic novelty (the condition is a
    known cascade, the anatomy restates electronic institutions, and the one
    measured claim is structurally unfailable). It is a single-n reflexive
    case study and belongs, if anywhere, in a governance/empirical venue
    (FAccT, AIES, ACM EAAMO, or an economics+computation workshop), where the
    incident record and the measured-run-warts-and-all framing are the
    contribution. Desk-reject defects a program chair would cite: (1) the
    central empirical quantity, the admitted fraction alpha, is completely
    hub-attested, unlogged, rounded, and unreproducible, so the paper's own
    "measured instantiation" claim is unverifiable on its defining input (F1
    [B]); (2) no falsifiable experiment, the only measured claim cannot fail
    given p-star pocket-change against a measured p of 0.85, so the empirical
    content is not substantive (L6); (3) unestablished novelty, the paper
    concedes its paid condition collapses to [23][24] under its own eviction
    reality and its 1/alpha bound is "an identity," leaving a self-authored n
    = 1 case study whose reviewer panels are non-independent and partially
    unrecorded (L4). Any of the three alone spurs rejection at a venue
    demanding methodological integrity. Score: 3/10.
    ADDED LANES (the paper does not pre-confess these).
    A. Pricing assumptions make the paid grid vacuous even on its own terms.
    The caching sensitivity is the decisive cell: at a re-read price c = 0.1,
    "every horizon rises tenfold, and the p = 0.3, w/h = 30 cell becomes T >
    1,195, which the session below does not clear" (line 359-360). Whether
    the gateway discounts cached prefixes "is not established" (line
    266-267). So the paid-lane section, one of three "things that follow
    from" the condition (line 74), is a claim that depends on a pricing
    parameter the paper concedes it never checked, and it fails at a
    plausible value. That surrenders an entire intended result, quietly.
    B. Each unlogged overhead term enters in the pro-delegation direction.
    The paper says "epsilon... o... All three enter (nexists) in the
    direction of making delegation look better than it is" (line 474). Every
    optimistic bias is uncounted and unmeasured, so the free-lane corollary
    is systematically overstated, and the paper's own "our runs" magnitudes
    for epsilon (line 311-312) are hub-attested tails, not logged.
    C. The headline lesson is violated by the author of the headline lesson.
    The paper's "practical lesson" is "provenance checks must be run by
    someone other than the author of the number" (line 34-35), but INC-007
    (line 1167-1170) and its 14 Oct addendum show the author transcribing
    reviewer numbers without recomputation, and the fix (a build gate)
    excludes the hub-audited cells that carry exactly the numbers that keep
    failing (line 1177-1178). The lesson, stated as established, was not
    followed by the institution that states it.
    D. The T upper-bound admission undercuts the paid claim twice. §3.3
    concedes "even the de-duplicated count is an upper bound on the horizon
    term," and "a turn that was evicted at turn 50 of 221 was re-paid 50
    times, not 221" (line 394-395). So the grid horizons, already conditional
    on violated E, are priced against a T that double-counts none of the
    turns that matter. The paid-lane conclusion is defended by no number that
    is both measured and applicable.
    ==================================================================
    SCORES
    ==================================================================
    L1 Novelty: 3/10 (concessions hide removal of both pillars, horizon
    inoperative and 1/alpha an identity)
    L2 Measurement validity: 2/10 (alpha, the load-bearing input, is unlogged
    hub attestation)
    L3 Internal consistency: 8/10 (careful; one undisclosed 6-byte wave-4
    cells)
    L4 Self-application: 2/10 (unfalsifiable; incident log is a rhetorical
    shield)
    L5 Clopper-Pearson: 3/10 (correct arithmetic, theater application)
    L6 Missing experiments: 2/10 (the A/B that would make it measured is
    absent)
    L7 Publication readiness: 3/10 (no venue clears unverifiable central
    input)
    ==================================================================
    VERDICT: MAJOR-REVISIONS (borderline NOT-READY)
    ==================================================================
    The paper is not rejectable purely on dishonesty, it is unusually honest,
    and its artifact discipline (frozen snapshot, SHA-256 archive, verifier
    scripts, build-gated Table 1) is a genuine contribution to how reflexive
    empirical AI work could be done. But as a hostile referee I cannot
    certify claims built on an unlogged, hub-attested, rounded,
    denominator-disputed alpha. The free-lane corollary is not a measurement,
    it is a tautology with a threshold nobody can miss. The barrier to
    acceptance is one experiment and one honesty re-baseline: measure alpha
    and p-star from instrument-logged admission on an inline-vs-delegated A/B
    of matched briefs, and re-frame the paid-lane material as hypothetical
    (it is conditional on violated E and an unestablished caching parameter
    that already kills it). Do that and the paper becomes a modest but
    defensible measured case study. Do not, and it remains theater mounted on
    arithmetic.
    TOP-5 FIXES (priority order)
    1. Run the controlled inline-vs-delegated A/B of matched briefs with
    admitted characters instrument-logged on both arms; report alpha, p-star,
    and the 1/alpha multiplier as measured, logged quantities. This is the
    single change that makes the central claim non-arithmetic (L6, addresses
    L2 and L7-defect 2).
    2. Delete the Clopper-Pearson interval, or re-point it at a logged binary
    acceptance outcome whose i.i.d. assumption can be argued; never print a
    CI whose assumptions the same sentence negates (L5).
    3. Re-baseline the paper's headline to its own eviction reality: mark the
    entire paid-lane section (§3.3 grid, 7.3, the 1/(1+cT) scaling) as
    hypothetical and non-load-bearing, since it depends on violated
    Assumption E and an unestablished caching price that already makes its
    own largest cell fail (L3/Added-A). The free-lane result is the only live
    claim, and it must carry the new logged alpha.
    4. Extend the v2 dispatcher to log acceptance outcome and admitted
    characters per row, accumulate to a disclosable n, and gate the paper's
    own acceptance claim on logged data rather than hub attestation
    (addresses L2, L4, Added-C).
    5. Break the self-application shield: state ex ante a falsification
    protocol predicting a measured alpha range, a p threshold, and a
    pre-registered context-budget multiplier for the next wave, so the
    reflexive method is testable against future runs instead of absorbing
    every failure as an incident row (L4).
