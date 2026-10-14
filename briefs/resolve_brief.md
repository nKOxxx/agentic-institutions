# TASK: Resolve every citation placeholder to a REAL, verified source

ALREADY VERIFIED (reuse, do not re-derive):
- arXiv:2305.05176 FrugalGPT | arXiv:2406.18665 RouteLLM | arXiv:2610.01231 Age of Jev
- arXiv:2503.05816 labor rebound | arXiv:2501.07913 Governing AI Agents | arXiv:2407.18074 Principal-Agent RL
- arXiv:2609.05531 When Agent Governance Helps | arXiv:2610.01756 SoK agent economic infra
- arXiv:2605.14892 LLM MAS survey | arXiv:2603.22367 O(1)-context | Jensen & Meckling 1976 (canonical, paywalled OK)
- ERC-4337, ERC-8004 (eips.ethereum.org live), A2A protocol spec, ANP whitepaper, MCP spec

PLACEHOLDERS FOUND IN DRAFT (resolve ALL):
1. [CITE: ...]
2. [CITE: A2A protocol documentation or GitHub repo for technical specification details]
3. [CITE: A2A protocol specification, Anthropic/InternalAI/Menlo, 2025]
4. [CITE: A2A protocol task object
    semantics]
5. [CITE: Anthropic A2A]
6. [CITE: AutoGen; CrewAI; LangGraph docs]
7. [CITE: ERC-4337; x402 spec; agent-wallet implementations]
8. [CITE: ERC-8004 draft, Ethereum Requests for Comment, 2024–2025]
9. [CITE: ERC-8004 mandate field description]
10. [CITE: ERC-8004 proposal; ERC-4337 spec; ERC-5192 spec]
11. [CITE: ERC-8004 task routing semantics]
12. [CITE: ERC-8004]
13. [CITE: Governing AI Agents 2501.07913 ;  reviews agent governance frameworks and notes the registry problem as a prerequisite for accountability]
14. [CITE: Jensen-Meckling 1976, agency costs and
    theory of the firm]
15. [CITE: MCP spec; A2A spec; ANP protocol docs]
16. [CITE: MemGPT/Letta arXiv; Graphiti/Zep]
17. [CITE: Park et al. 2023 Generative Agents; Concordia; OASIS]
18. [CITE: SoK 2610.01756 on machine liability and legal personhood open problems; CITE: Governing AI Agents 2501.07913 on accountability gaps in current agent governance proposals]
19. [CITE: SoK 2610.01756 ;  decentralized agent economic infrastructure survey discusses agent marketplace primitives and identifies mandate specification as an open design problem]
20. [CITE: agent cards specification]
21. [CITE: analysis of smart contract legal enforceability, e.g., Verstein 2021 or similar]
22. [CITE: description of any existing capability attestation work, e.g., Gitcoin Passport, Biscot, or similar]
23. [CITE: description of any existing work linking off-chain attestations to ERC-8004-style identities]
24. [CITE: description of any existing work on agent treasury management or agent investment constraints]
25. [CITE: x402 payment protocol]
26. [CITE]

Rules:
- For each: output one line `N -> Full citation (authors, title, venue/arXiv ID/year, URL)`.
- Reuse the verified registry above whenever applicable (multiple placeholders may map to one source).
- For placeholders NOT covered by the registry: find the real source via arXiv/verifiable web.
  You MUST verify IDs exist (arXiv API or live URL check) before including. If you cannot
  verify, write `N -> UNVERIFIED: <best guess + why>`. NEVER invent an ID.
- No prose, no analysis. Just the N -> lines, then final line: CITATIONS-RESOLVED-OK
