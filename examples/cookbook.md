---
title: Markdown Cookbook^[Here is a neat place to thank all the people who have made your article possible.]
subtitle: A practical, copy-by-example guide to writing long documents in Markdown and exporting clean PDFs with Pandoc.
abstract: |
  This cookbook shows how to draft and typeset long documents in Markdown. Each recipe is a small example you can copy: headings, math, images, tables, footnotes, citations, cross-references, bibliographies, table of contents, and more. Preview most pieces in VS Code, then export with Pandoc when you need the final look.
author: C. Philadelphe Divry^[Show off your fancy affiliation here.]
date: September, 2025^[Let us know if this is a working paper, a submitted version, etc.]
mainfont: "Helvetica Neue" # or any installed font, e.g. "Times New Roman"
colorlinks: true
linkcolor: blue # set all link colors to blue
urlcolor: blue # set all link colors to blue
citecolor: blue # set all link colors to blue
filecolor: blue # set all link colors to blue
nocite: |
  @Williams1990:StyleClarityGrace
---

\tableofcontents

\newpage

# Markdown Cookbook

Heads-up about rendering:

- **[VS Code Markdown Preview](https://code.visualstudio.com/Docs/languages/markdown#_markdown-preview)**, accessible with the command[s] `Markdown: Open Locked Preview[ to the Side]`, renders basic Markdown. It can handle some of the more advanced features with extensions, but it doesn't process citations, cross-references, LoT/LoF, and most LaTeX beyond math.

- The **Pandoc export** explained in the [README](../README.md) runs the full pipeline: citations & bibliography, cross-refs from your labels, figure/table numbering, image sizing, LoT/LoF, etc.

**Recommendation**: preview the text and structure in VS Code, but trust Pandoc PDF outputs for the final output.

## Basic syntax

To get you started, here are some of the basic elements of Markdown which I used the most:

- **Headings** are introduced with one or more `#` symbols. If you look at the raw Markdown of this document, the title is written `# Thesis in Markdown` (top level heading or title), the subsection is written `## How to use` (level-2 heading) this sub-subsection is written `### Writing` (level-3 heading).

- **Bold** text is surrounded by `**` symbols, as in this sentence which is starts out as `**Bold** text`.
- ***Italic*** text is surrounded by a single `*` symbol. Text can be both bold and italic with `***` surrounding the text. VS Code automatically inserts the symbols around a selection of text with the common shortcuts `Cmd-b` for bold and `Cmd-i` for italic.

- > **Block quotes** are introduced as paragraphs starting with a `>` symbol. In the raw Markdown, this paragraph starts out with as follows: `> **Block quotes** are introduced`.

- A **non-breaking space** is inserted by pressing `option-Space`. The non-breaking space will be highlighted by VS Code in a little colored box.

<!-- GIF colored box -->

- **Comments** can be included using HTML syntax: `<!-- This comment would not be visible in this output document if it wasn't surronded with backticks which ignores all syntax -->`. In fact, all HTML syntax works natively in Markdown. Check out this HTML list:

- **Lists** can be unnumbered (like this list) or numbered, in which case you would replace the dashes with `1., 2.`, etc.

Threre a lot more to [Markdown syntax](https://www.markdownguide.org/basic-syntax/), which is still more powerful in the [Pandoc variant](https://pandoc.org/MANUAL.html) used in this setup. Here we will only cover a few more essentials most relevant to academic writing.

## Math

Writing mathematical expressions in Markdown follows the syntax of [LaTeX formatted math](https://en.wikibooks.org/wiki/LaTeX/Mathematics).

**Inline equations** are delimited by `$...$`. The following intput `$Y = AK^{\alpha}L^{\beta}$` will output $Y = AK^{\alpha}L^{\beta}$.

A **displayed equation** will take up a line of its own, and is delimited by `$$...$$`. For example, the following input:

<!-- The following paragraph surrounded by three backticks ```...``` is a code block. All syntax will be ignored. You can specify the language of the code snippet for code highlighting in the Preview, as here with "latex." -->

```latex
$$ c^* = (1-s)A\left(\frac{s}{\delta + \gamma + n}\right)
^{\frac{\alpha}{1-\alpha}} $$
```
will output:

$$ c^* = (1-s)A\left(\frac{s}{\delta + \gamma + n}\right)^{\frac{\alpha}{1-\alpha}} $$

## Images

Here is *Port de mer au soleil couchant* by Claude Lorrain:

![Port de mer au soleil couchant by Claude Lorrain \label{couchant-lorrain}](../assets/Lorrain_port_au_soleil_couchan_1639_light.jpg){width=250px}

If you are viewing the source code or using VS Code's Markdown Preview, the size setting `{width=200px}` will be rendered. The `label` LaTeX command will allow us to do some [cross-referencing](#cross-referencing-requires-pandoc) later on.

**Diagrams** can be easily inserted as images from another tool like [draw.io](https://www.drawio.com/).

Alternatively, diagrams can constructed with a plain-text solution like [Mermaid](https://mermaid.js.org/), as the one in the [Installation](../README.md#installation) section of the README). Viewing Mermaid charts in the VS Code Markdown Preview requires [an extension](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid). Using Mermaid with Pandoc involves [installing a filter](https://github.com/raghur/mermaid-filter). The Mermaid in the README.md is meant to be displayed on GitHub, which natively renders mermaid charts in Markdown files.

## Tables

Check out the Markdown source code that will generate the following table:

| City          | Nonbasic to basic ratio | 1950 metro population |
| ------------- | ----------------------- | --------------------- |
| New York City | 2.1                     | 12,900,000            |
| Detroit       | 1.2                     | 3,000,000             |
| Cincinnati    | 1.7                     | 900,000               |
| Albuquerque   | 1.0                     | 200,000               |
| Madison       | 0.8                     | 110,000               |
| Oshkosh       | 0.6                     | 40,000                |

Table: Evolution of the nonbasic to basic ratio in selected American metropolitan areas [@Ullman1953:BasicServiceRatioAreal] \label{table-metro-data}

You can also install the [Markdown Table extension](https://marketplace.visualstudio.com/items?itemName=TakumiI.markdowntable) for some handy commands, or use the [HTML syntax for tables](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/table).

If you are viewing the source code or using VS Code's Markdown Preview, the reference `@citationKey` and the `label` LaTex command are visible in the Table's caption. See respectively [Referencing](#referencing-requires-pandoc) and [Cross-referencing](#cross-referencing-requires-pandoc) below.

## Footnotes (requires Pandoc)

Footnotes are created in the body of text by inserting the `[^footnote_name]` in the body of the text, and a paragraph below with. See the source Markdown to see how this footnote[^footnote_name] was populated.

[^footnote_name]: This is how you would write the content of a footnote. Watch out for the colon after the footnote name! You can place footnote contents anywhere in your Markdown document, but I recommend placing them below the paragraph where they are referenced. In the final document, the footnote will be numbered and its name will not be visible. The number will be automatically determined based on where the `[^footnote_name]` is placed in the text. \label{my-footnote}

*In VS Code's Preview, you will not see the above paragraph as a footnote. Use the [Markdown Footnotes extension](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-footnotes) to view footnotes in the Preview.*

## Referencing (requires Pandoc)

To **reference**, simply type `@` and part of a `@citationKey` you are looking for. The `Pandoc Citer` VS Code extension will provide autocomplete based on the contents of the `refs.bib` file, which is automatically updated by Zotero's `Better BibTex` extension.

The output of references is determined by the Citation Style Language (CSL) citation style at the root of the project. The style included in this repository is the [Chicago Manual of Style 17th edition (author-date)](./citation-style-CMS17.csl), but you can choose [another CSL style](https://github.com/citation-style-language/styles?tab=readme-ov-file).

The formatting options for citations cover many situations:

| Markdown input                                          | Output                            |
| ------------------------------------------------------- | --------------------------------- |
| `@Lucas1988:Mechanics`                                  | Lucas (1988)                      |
| `[@Lucas1988:Mechanics]`                                | (Lucas 1988)                      |
| `-@Lucas1988:Mechanics`                                 | (1988)                            |
| `[@Lucas1988:Mechanics 41]`                             | (Lucas 1988, 41)                  |
| `[@Lucas1988:Mechanics 41, 43]`                         | (Lucas 1988, 41, 43)              |
| `[@Lucas1988:Mechanics 41-43]`                          | (Lucas 1988, 41-43)               |
| `[see also @Lucas1988:Mechanics]`                       | (see also Lucas 1988)             |
| `[@Lucas1980:MdPbBusiness; @Lucas1988:Mechanics]`       | (Lucas 1980, 1988)                |
| `[@Lucas1988:Mechanics; @GlaeserEtAl1992:GrowthCities]` | (Lucas 1988; Glaeser et al. 1992) |

## Cross-referencing (requires Pandoc)

Pandoc/LaTeX lets you point to numbered objects anywhere in the document. This file already defines two labels:

* the image: `\label{couchant-lorrain}`
* the table: `\label{table-metro-data}`

Here they are **used in context** (these will compile to clickable numbers):

As shown in **Figure \ref{couchant-lorrain}**, Claude Lorrain’s seascape illustrates the effect we discuss above.
The city ratios in **Table \ref{table-metro-data}** summarize the data used in the examples.
For a page-specific pointer: see **Figure \ref{couchant-lorrain}** on page \pageref{couchant-lorrain}.

*Tip:* To add your own cross-reference, place a `\label{my-label}` in a caption (figure/table) or right after a heading, then refer to it later with `\ref{my-label}` (or `\pageref{my-label}` for the page). In VS Code’s Preview you’ll see the raw commands, but the PDF will show the final numbers and links.

## LoT and LoF (requires Pandoc)

**List of Tables (LoT)** and **List of Figures (LoF)** are generated automatically from captions. The lists appear where you place the commands `\listoftables` and `\listoffigures`[^toc].

[^toc]:
  Similarly, `\tableofcontents` will insert a ToC, like at the beginning of this document.

They include any **table** that has a caption line starting with `Table:` and any **image** that Pandoc turns into a figure (the image sits on its own line and has non-empty alt text). Entries do not render in VS Code's Preview.

\listoftables

\listoffigures

## Bibliography (requires Pandoc)

The following bibliography is automatically generated by Pandoc, which places it at the end of your document by default. It will include the following from your `refs.bib` file:

- references cited directly in the text, like `@Ullman1953:BasicServiceRatioAreal` in the caption on Table \ref{table-metro-data}
- references listed in the `nocite` argument of the frontmatter like `@Williams1990:StyleClarityGrace`, which are included even if they don't appear in the body of the text.

\hrulefill <!-- This LaTeX command creates a horizontal line -->

<!-- The bibliography will be generated after this line, in the HTML div with id=refs. If the HTML div is absent, Pandoc will place the bibliography at the very end of the document by default -->

<div id="refs"></div>