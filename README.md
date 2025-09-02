# Academic Writing in Markdown

This repository is a template for academic writing based on plain text and automatic reference management. I used this setup to research, write, typeset, and produce my economics PhD dissertation at Pantheon-Sorbonne University, as well as to prepare slide decks for conferences, notes for classes, and a variety of administrative documents.

- [Academic Writing in Markdown](#academic-writing-in-markdown)
  - [Why?](#why)
  - [Quickstart](#quickstart)
  - [Next steps](#next-steps)

## Why?

I have often seen academic writing workflows in the social sciences rely on proprietary text files (Word or another [WYSIWYG](https://en.wikipedia.org/wiki/WYSIWYG) editor), references managed by hand, endless versions of the same document, and syncing via Dropbox. In my experience, this works for short projects, but for something long and complex (like a PhD dissertation) it quickly becomes unwieldy and error-prone.

This repository offers an alternative. While the initial setup is more involved than opening Word, in the long run this template offers key advantages:

- **Powerful tools** for managing large projects: citations, cross-references, numbering, and more all handled automatically.
- **Beautiful outputs** with professional typesetting, while most writing stays in simple Markdown.
- A **flexible setup** you can extend and customize to fit your workflow.
- **Transparency**, since everything is plain text, based on open standards, with no proprietary lock-in.
- And it comes with a **gentle learning curve**: start by editing the provided samples, then explore advanced features as you go.

If these benefits appeal to you, and you don't mind working in a code editor and occasionally using a bit of LaTeX or the command line, you'll find this repository a practical starting point.

## Quickstart

Clone this repository and produce a sample PDF in just a few steps:

1. **Open Terminal** and move into the folder where you want the project:

    ```bash
    cd path/to/my-folder
    ```

2. **Clone this repo**:

    ```bash
    git clone https://github.com/cedricphdivry/academic-writing-markdown
    cd academic-writing-markdown
    ```

3. **Install the essentials**:

    - A TeX distribution: [MacTeX](https://tug.org/mactex/mactex-download.html) (macOS), [TeX Live](https://www.tug.org/texlive/) (Linux and Windows)
    - [Pandoc](https://pandoc.org/installing.html)

    *(You can add Zotero, VS Code, and other tools later. See [installation](./docs/installation.md))*

4. **Export a sample document**:

   - Single-file document (e.g. an article):
     ```bash
     sh export-document.sh examples/cookbook.md
     ```
   - Multi-file document (e.g. a dissertation):
     ```bash
     sh export-document.sh examples/dissertation
     ```
   - Slides:
     ```bash
     sh export-slides.sh examples/slides.md
     ```

   All PDFs will appear in the `exports/` folder.

## Next steps

You now have a functioning pipeline from Markdown to PDF. From here, you can:

- Edit the sample Markdown files (`examples/dissertation/*.md`, `examples/cookbook.md`) and re-export to see the changes
- Go through the `docs/`:
  - Proceed with the full [installation](./docs/installation.md) to enable reference management
  - Check the [usage guide](./docs/usage-guide.md) for Markdown, citations, math, diagrams, and more