#!/usr/bin/env python3
"""Generate quiet-path fixtures with the same call hermes uses on `chat -Q` (a plain print of the final response).
Three cases: a correct response ending in the needle; the same with CRLF endings (what the -q path's terminal
library produces, kept to prove the normalisation); a response whose lines begin with 't' (BSD sed \t trap)."""
import os, sys
d = os.path.dirname(os.path.abspath(__file__))
needle = "SECTION-S3B-OK"
body = ["touch DRAFT.md is not permitted; write to the returned message only.",
        "Delegation without verifiable acceptance is delegation without a floor.",
        "\tAn institution that cannot observe acceptance bears the full variance.",
        "", needle]
with open(os.path.join(d, "fixture_Q_plain.out"), "w", newline="\n") as f:
    print("\n".join(body), file=f)                       # hermes -Q: print(response)
with open(os.path.join(d, "fixture_Q_crlf.out"), "w", newline="\r\n") as f:
    print("\n".join(body), file=f)                       # same text, CRLF endings
with open(os.path.join(d, "fixture_Q_miss.out"), "w", newline="\n") as f:
    print("\n".join(body + ["trailing prose after the needle"]), file=f)
with open(os.path.join(d, "fixture_Q.err"), "w") as f:
    print("\nsession_id: 20261013_000000_deadbeef", file=f)  # hermes -Q: session id on stderr
print("fixtures written")
