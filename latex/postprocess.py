#!/usr/bin/env python3
"""Post-process pandoc .tex for XeLaTeX: unicode glyph -> LaTeX, verbatim-safe."""
import re, sys

SRC, DST = sys.argv[1], sys.argv[2]
t = open(SRC).read()

# split on verbatim environments; transform only non-verbatim segments
parts = re.split(r'(\\begin\{verbatim\}.*?\\end\{verbatim\})', t, flags=re.S)

MAP = {
    'α': r'$\alpha$', 'ε': r'$\varepsilon$', 'δ': r'$\delta$', 'β': r'$\beta$',
    'ρ': r'$\rho$', 'η': r'$\eta$', 'σ': r'$\sigma$', 'κ': r'$\kappa$',
    'Σ': r'$\Sigma$', '→': r'$\rightarrow$', '−': r'$-$', '×': r'$\times$',
    '≤': r'$\leq$', '≥': r'$\geq$', '≈': r'$\approx$', '∈': r'$\in$',
    '⊆': r'$\subseteq$', '·': r'$\cdot$', '★': r'$\star$', '§': r'\S{}',
    '₁': r'\textsubscript{1}', '₂': r'\textsubscript{2}',
    'ν': r'$\nu$', '≪': r'$\ll$', '†': r'\dag{}', '⋆': r'$\star$', '‡': r'\ddag{}',
    'ℝ': r'$\mathbb{R}$', '∉': r'$\notin$', '⇒': r'$\Rightarrow$', 'Δ': r'$\Delta$', '³': r'\textsuperscript{3}', '∗': r'$\ast$', '∑': r'$\sum$', 'φ': r'$\varphi$',
    'p\u0302': r'$\hat{p}$', '«': r'\guillemetleft{}', '»': r'\guillemetright{}',
}
# multi-char first (p̂), then single chars
def fix(seg):
    seg = seg.replace('p\u0302', MAP['p\u0302'])
    for k, v in MAP.items():
        if k != 'p\u0302':
            seg = seg.replace(k, v)
    return seg

t = ''.join(p if p.startswith('\\begin{verbatim}') else fix(p) for p in parts)

# preamble additions: geometry, mono font with box-drawing coverage, verbatim sizing
PRE = r'''
\usepackage{geometry}
\geometry{margin=2.4cm}
\usepackage{xcolor}
\usepackage{fontspec}
\setmonofont{Menlo}
\usepackage{fvextra}
\fvset{fontsize=\small,breaklines}
\usepackage{hyperref}
\hypersetup{colorlinks=true, linkcolor=blue!60!black, urlcolor=blue!60!black}
\usepackage{booktabs}
'''
t = re.sub(r'(%\n\\usepackage\{hyperref\}\n\\usepackage\{xcolor\}\n\\usepackage\{bookmark\}\n\\usepackage\{bookmark\}\n)',
           PRE.replace('\\', '\\\\') + r'\1', t, count=1)
if 'geometry' not in t:  # fallback anchor if pattern missed
    t = t.replace('\\begin{document}', PRE + '\\begin{document}', 1)

# breakable verbatim (fvextra) + paragraph-width columns for the audit longtable
t = t.replace(r'\begin{verbatim}', r'\begin{Verbatim}[breaklines,breakanywhere,fontsize=\small]')
t = t.replace(r'\end{verbatim}', r'\end{Verbatim}')
t = t.replace(r'\begin{longtable}[]{@{}lll@{}}',
              r'\begin{longtable}[]{@{}p{0.22\textwidth}p{0.38\textwidth}p{0.32\textwidth}@{}}')

open(DST, 'w').write(t)
# verify no stray unicode outside verbatim
body = re.sub(r'\\begin\{[Vv]erbatim\}[\[]?.*?\\end\{[Vv]erbatim\}', '', t, flags=re.S)
left = sorted({c for c in body if ord(c) > 127})
print("non-ascii outside verbatim:", left if left else "NONE")
