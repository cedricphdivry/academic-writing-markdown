---
title: Dummy Thesis
subtitle: A Demonstration
author: Your Name
date: September 2025
documentclass: memoir
mainfont: Times New Roman
fontsize: 11pt
geometry:
- right=3.5cm
- left=3.5cm
- top=3cm
- bottom=4cm
header-includes: |
  \usepackage{graphicx}
  \usepackage{enumitem}
  \setlength{\parskip}{0pt}
  \usepackage{pdfpages}
  \AtBeginDocument{\let\maketitle\relax}
nocite: |
  @Schumpeter1954:HistoryEconomicAnalysis; @Smith1776:InquiryNatureCauses; @Darwin1859:OriginSpecies; @Montaigne1580:Essais
---

<!-- Oftentimes your institution will provide a template for the cover page of your thesis. You can include it here as an external PDF. If you want to use the automatic title page, remove the above command and the line \AtBeginDocument{\let\maketitle\relax} in the YAML. -->
\includepdf[pages={1}]{examples/thesis/__cover-page.pdf}

<!-- Everything between the \frontmatter command and the \mainmatter below will be numbered in small Roman numerals.-->
\frontmatter

<!-- Content (headings and ToC) is not automatically numbered. -->
\maxsecnumdepth{section}

<!-- A blank page after the cover page -->
\clearpage
<!-- Line height 1.5 for the rest of the document -->
\OnehalfSpacing

\begin{abstract}
This dummy thesis demonstrates all the moving parts of the template:
front matter, epigraphs, math, figures, tables, cross-references,
citations, and back matter (LoF/LoT/References).
\end{abstract}

<!-- End of frontmatter: normal page numbering from now on -->
\mainmatter

<!-- Custom chapter style -->
\makeatletter
\newcommand{\fonttitle}{\chaptitlefont}
\makechapterstyle{customchapter}{%
  \renewcommand*{\chapnumfont}{\normalfont\fontsize{50}{10}\selectfont\bfseries}
  \def\chapterheadstart{\vspace*{\beforechapskip}}
  \def\printchaptername{}
  \def\printchapternonum{}
  \def\afterchapternum{\par\nobreak\vskip \midchapskip}
  \def\printchaptertitle##1{\SingleSpace \fonttitle \@chapapp\space \fonttitle \afterchapternum \fonttitle ##1}
}
\makeatother
<!-- Apply the chapter style -->
\chapterstyle{customchapter}

<!-- Custom pagestyle -->
<!-- Remove ruler -->
\makeheadrule{ruled}{\textwidth}{0pt} 
<!-- Remove smallcaps from headers, \itshape \bfseries are options) -->
<!-- Usage: \makeoddhead{<pagestyle>}{<left>}{<center>}{<right>} -->
\makeevenhead{ruled}{\itshape \leftmark}{}{}
\makeoddhead{ruled}{}{}{\itshape \rightmark}
\pagestyle{ruled}

<!-- Custom pagestyle -->
<!-- Center page numbers everywhere (fronmatter, new chapter page) by changing the plain style -->
\makeevenfoot{plain}{\thepage}{}{}
\makeoddfoot{plain}{}{}{\thepage}