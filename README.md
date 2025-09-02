# Academic Writing in Markdown

This repository is a template for academic writing based on plain text and automatic reference management. I used this setup to research, write, typeset, and produce my economics PhD dissertation at Pantheon-Sorbonne University, as well as to prepare slide decks for conferences, notes for classes, and a variety of administrative documents.

- [Academic Writing in Markdown](#academic-writing-in-markdown)
  - [Why?](#why)
  - [Quickstart](#quickstart)

## Why?

I have often seen academic writing workflows in the social sciences rely on proprietary text files (Word or another [WYSIWYG](https://en.wikipedia.org/wiki/WYSIWYG) editor), references managed by hand, endless versions of the same document, and syncing via Dropbox. In my experience, this works for short projects, but for something long and complex (like a PhD dissertation) it quickly becomes unwieldy and error-prone.

This template offers a different path. Although the effort upfront is higher than opening Word and going from there, in the long run this tempalte proves to be:

- **simple**, as everything is plain text and easy to learn;
- **flexible**, easy to extend, customize, and adapt to your own workflow;
- **powerful**, with citations managed automatically and easy navigation in large projects.

If you share the same frustrations, you're comfortable with a code editor, you can write a bit of LaTeX or command-line, and you enjoy tailoring your tools to your needs, this repository is for you.

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

    - [MacTeX](https://tug.org/mactex/mactex-download.html) (TeX distribution)
    - [Pandoc](https://pandoc.org/installing.html)

    *(You can add Zotero, VS Code, and other tools later. See [Installation](#installation))*

4. **Export a sample document**:

   - Singe-file document (e.g. an article):
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

You now have a working **plain-text → PDF pipeline**. From here you can:

- Edit the sample Markdown files (`dissertation/chapters/`, `examples/cookbook.md`) and re-export to see changes
- Proceed with the full [installation](#installation) to enable reference management
- Check the [usage guide](#usage-guide) for Markdown, citations, math, diagrams, and more