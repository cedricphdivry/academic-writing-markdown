\renewcommand{\chaptername}{Introduction}
<!-- The asterisk prevents the numbering from applying to the intro. -->
\chapter*[Introduction]{}
<!-- Because we added the asterisk, we have to add this chapter to the ToC manually. -->
\addcontentsline{toc}{chapter}{Introduction}
\label{chapter0}
\chapterprecistoc{}

This dummy thesis is a working specimen showing how a long document in Markdown compiles to a polished PDF with Pandoc and the memoir `documentclass`. It demonstrates important features for a long document: chapters, figures, tables, citations, and cross-references. It also bridges the two other resources in this repository: the README, which explains installation and how to run the export scripts; and the Markdown Cookbook, which provides short, copy-and-paste recipes for individual features.

Use this document as a sandbox: duplicate a chapter, add a figure with a `\label{...}`, cite a source with an `@citationKey` from `refs.bib`, and re-export to see numbering and references update automatically. When you need a specific pattern (e.g. footnotes, lists of figures/tables, or math), grab the corresponding snippet from the Cookbook and paste it into your chapter, then build to verify.

As you'll see in the source code of the front matter, producing long documents involves writing more LaTeX commands. The learning curve is steeper than a point-and-click word processor, but the payoff is fine-grained control and beautiful outputs.

Chapter \ref{chapter1} presents Adam Smith's account of the division of labor, anchored by a historical engraving of the pin-making workshop (Figure \ref{figure-pin-factory}, page \pageref{figure-pin-factory}). It also condenses Smith's argument about productivity into a compact summary (Table \ref{table-smith-dol-productivity}, page \pageref{table-smith-dol-productivity}). Together these show how to cite your figures and tables from anywhere in your text.

Chapter \ref{chapter2} turns to Darwin's divergence of character. The branching schematic illustrates how variation accumulates across generations and doubles as another example of a labeled figure you can reference in running text—e.g., "see Figure \ref{figure-darwin-divergence}, page \pageref{figure-darwin-divergence}."