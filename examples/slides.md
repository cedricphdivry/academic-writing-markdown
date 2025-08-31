---
title: "Why Write in Plain Text?"
subtitle: "A case for academics based on Kieran Healy's guide[^Healy_url]"
author: "Your Name"
institute: "Your Organization"
date: "September 1, 2025"
# find other themes and color themes at online, e.g. https://mpetroff.net/files/beamer-theme-matrix/
theme: "Singapore" 
colortheme: "default"
# all fonts installed on your system should be available
mainfont: "Helvetica Neue"
fonttheme: "professionalfonts" # see https://www.beamer.plus/Fonts.html
fontsize: 11pt
colorlinks: true
linkcolor: blue # set all link colors to blue
urlcolor: blue # set all link colors to blue
citecolor: blue # set all link colors to blue
filecolor: blue # set all link colors to blue
aspectratio: 43 # change to e.g. 169 for a 19:9 aspect ratio
section-titles: false # set to true to give each new section its own title page
header-includes: |
  \linespread{1.2}
...

[^Healy_url]:
  *The Plain Person's Guide to Plain Text Social Science* -@Healy2018:PlainPersonsGuide. Read online at [https://plain-text.co](https://plain-text.co).

# Two models

### The Problem

- Academic writing is messy: prose, data, citations, figures
- The **Office model** relies on proprietary formats and heavy software:
  - `.docx` files pile up (v1, v2, FINAL, FINAL2…)
  - Citations and data pasted in by hand
- Hard to reproduce, hard to manage over years

### The Alternative: Plain Text

- **Engineering model**: plain text at the center
- Text, code, citations, and data linked transparently
- Outputs: PDF, HTML, DOCX — all generated automatically

## No *One True Way*

> You can do productive, maintainable and reproducible work with all kinds of different software set-ups. ... So **this discussion is not geared toward convincing you there is One True Way to organize things**. I do think, however, that if you're in the early phase of your career as a graduate student ... you should give some thought to how you're going to organize and manage your work. [@Healy2018:PlainPersonsGuide 2, emphasis added]

# Core Benefits

- **Reproducibility**: your work can always be re-run
- **Transparency**: files readable anywhere, no lock-in
- **Durability**: plain text doesn’t rot with software updates
- **Automation**: generate tables, figures, bibliographies with one command

---

\centering{(not to mention the nerdy aesthetic)}

![The VS Code text editor](../assets/editor-screenshot.png){width=320px}

# Practices and tools

### Good Practices

- Keep a record (scripts, notes, datasets in plain text)
- Use **version control** (Git) instead of endless “Final.docx”
- **Back up** automatically (e.g. GitHub + offsite)

### Tools of the Trade

- **Text editors** (VS Code, Emacs, Sublime, etc.)  
- **Markdown** for formatting, citations, cross-references  
- **Pandoc** to convert Markdown to PAF/Word/HTML  
- **R + RMarkdown** for integrated analysis & writing  

# The Takeaway

### Plain text = control over your research workflow

- Scales from a single paper to an entire dissertation
- Frees you from software lock-in
- Makes your work reproducible for collaborators, reviewers, and your future self

# Further reading

### More on Beamer + Pandoc

- Integrate some examples from the [cookbook](./cookbook.md) into the slides
- About the front matter, refer to the [typesetting section](../README.md#typesetting-your-documents) of the README
- Get familiar [Pandoc guide](https://pandoc.org/MANUAL.html#slide-shows) on slide shows with Beamer
- Change the combination of [beamer themes and colorthemes](https://mpetroff.net/files/beamer-theme-matrix/)
- Dive into the [official](https://ctan.org/pkg/beamer) or [unofficial](https://www.beamer.plus/home.html) manuals for the beamer class

## References

<div id="refs"></div>