# Usage guide

This section walks through the essentials of working with this template:

- [Editing Markdown files](#editing-markdown-files), by example
- [Navigating](#navigating-in-vscode) your project with VS Code commands and keyboard shortcuts
- [Typesetting](#typesetting-your-documents) with YAML parameters and LaTeX commands
- [Exporting PDF files](#exporting-your-documents), from simple notes and slides to a full dissertation
- Managing your project with [version control](#version-control) and setting up [sync and backup](#sync-and-backup) to protect your work

## Editing Markdown files

To get started, have a look at the [`examples/cookbook.md`](examples/cookbook.md) file that you exported in the [Quickstart](#quickstart).

This file demonstrates [Markdown basics](examples/cookbook.md#basic-syntax)  (headings, bold/italic, block quotes...); [mathematical expressions](examples/cookbook.md#math) in LaTeX; [images](examples/cookbook.md#images) and [tables](examples/cookbook.md#tables) with captions; and advanced features which require Pandoc to function: [footnotes](examples/cookbook.md#footnotes-requires-pandoc), [citations](examples/cookbook.md#citations-requires-pandoc), [cross-referencing](examples/cookbook.md#cross-referencing-requires-pandoc), [bibliography generation](examples/cookbook.md#bibliography-requires-pandoc), and [LoT/LoF](examples/cookbook.md#lot-and-lof-requires-pandoc).

## Navigating in VS Code

Out of the box, VS Code provides [many tools](https://code.visualstudio.com/Docs/languages/markdown) to improve the writing experience in Markdown. Below are some of the shortcuts which become increasingly useful as files grow in size and multiply:

- **Executing commands**
  - `Cmd+Shift+P` to open the **Command Palette**. This is where you can access the functionalities of most extentions.
  - For example, open the command palette, start typing "extensions," and press `Enter` when the command `Extensions: Install Extensions` is selected.

- **Editing text**
  - To move a paragraph up or down, place the cursor within the paragraph and respectively use `option+Up` or `option+Down`.
  - To duplicate a paragraph above or below, place the cursor within the paragraph and respectively use `option+Shift+Up` or `option+Shift+Down`.
  - To insert multiple cursors, either maintain `option` pressed while clicking on each point where you want to insert a cursor, or press `option+Cmd+Up`/`option+Cmd+Down` to multiply cursors across lines. Press `Escape` to collapse multiple cursors.
  - `option+Shift+A` comments out the selected text or inserts an inline comment if no text is selected
  - `Cmd+Shift+A` comments out the paragraph where the cursor is located or inserts a comment as a paragraph

- **Search and replace**
  - `Cmd+F` for a search (and replace) in the current file; if text is selected, the same text will be inserted in the search bar
  - `Cmd+option+F` same as above, but expands the search bar to search and replace
  - `Cmd+Shift+F` for a search (and replace) across all files in the project

- **Navigating the document**
  - `Cmd+Shift+O` to navigate to a heading of the current markdown document
  - `Cmd+Up`/`Cmd+Down` to move the cursor to the beginning/end of the document
  - `ctrl+-` sends the cursor to its last position (useful if you press `Cmd+Up`/`Cmd+Down` by mistake!)

- **Navigating the project**
  - `Cmd+P` to navigate to a different file within the project
  - `Cmd+Shift+E` to view the file explorer

## Typesetting your documents

When you pass Markdown file to Pandoc, it translates it into LaTeX before producing a PDF. Document formatting happens in two steps:

1. Pandoc first applies **the `documentclass`** setting;
2. it applies any extra typesetting instructions in the **front matter**, which overwrite the corresponding parameters of the `documentclass`;
3. finally, it applies any **LaTeX commands** relating to page layout and typesetting found throughout the document

Changing the look and feel out output documents involves intervening in those two steps.

1. **Change the `documentclass`**

    - The **article class** is the default `documentclass` applied by Pandoc, as in [`examples/cookbook.md`](examples/cookbook.md). See the [article class documentation](https://ctan.org/pkg/article).
    - The **memoir class** is an alternative to the `book` class for long documents. Notice in [`examples/dissertation/0_frontmatter.md`](./examples/dissertation/0_frontmatter.md), the `documentclass` field is set to `memoir`. See the [memoir class manual](https://ctan.org/pkg/memoir).
    - The **beamer class** is used to produce slide decks. Rather than being specified in [`examples/slides.md`](./examples/slides.md), the class is applied in the [`export-slides.sh`](export-slides.sh) script. See the beamer [reading list](./examples/slides.md#further-reading) in the slides.

2. **Modify the frontmatter**

    - The frontmatter usually refers to section at the beginning of Markdown documents formatted in [YAML](https://yaml.org/) (see the [cookbook](examples/cookbook.md) and [slides](./examples/slides.md) for examples)
    - The YAML front matter may contain the `documentclass`, the title, author and date metadata, an abstract, page geometry, margins, line spacing, LaTeX packages (`\usepackage{}`), custom commands (`\newcommand{}`), etc. See the [full list of variables](https://pandoc.org/MANUAL.html#variables) supported by Pandoc in the YAML front matter.

3. **Apply LaTeX commands**

    - LaTeX commands throughout the body of the Markdown document may control typesetting, page layout, etc.
    - See [`examples/dissertation/0_frontmatter.md`](./examples/dissertation/0_frontmatter.md) for an example
    - Note that Pandoc cannot translate Markdown syntax and citation keys within LaTeX commands. See the beginning [`examples/dissertation/1_chapter1.md`](examples/dissertation/1_chapter1.md).
  
## Exporting your documents

Pandoc takes your Markdown, applies layout from the **front matter** (`documentclass` and YAML variables) and LaTeX commands, formats `@citationKeys` with **`refs.bib`** and your **CSL style** (see the [citations section](./examples/cookbook.md#citations-requires-pandoc) of the cookbook), and produces a **PDF** (or other formats, such as `.docx`, `.html`, [and more](https://pandoc.org/MANUAL.html#options)).

Here are the export scripts you already tried in the [Quickstart](#quickstart):

- **`export-document.sh`** for articles, notes, and long documents

  - Accepts either a single `.md` file or a directory of `.md` files
  - If given a directory, it concatenates files in **alphabetical order**
  - Feeds the `refs.bib` to the citation engine with the `--citeproc` flag
  - Uses the `citation-style-CMS17.csl` to format citations (to **change citation style**, swap out `citation-style-CMS17.csl` in the export scripts if you need APA, MLA, etc.)

- **`export-slides.sh`** for Beamer slide decks

  - Applies the `beamer` class with the `-t beamer` argument
  - Follows the same citation pipeline (`--citeproc`, `refs.bib`, CSL)

---

*Note: in the [Installation](#installation) diagram, `refs.bib` is used twice: (1) by VS Code in `.vscode/settings.json` (Pandoc Citer for autocomplete) and (2) by Pandoc itself in the export scripts (for formatting at build time).*

---

Markdown can also be exported directly to HTML or PDF, **without Pandoc** (for example with the VS Code extension *Markdown All in One* command `Print current document to HTML`). But this has limitations: Pandoc's extended Markdown features are unavailable, `@citationKeys` will not resolve into references, and LaTeX commands and packages may not be processed.

## Version control with Git

Git lets you "save snapshots" of your work so you can track progress, tag milestones, and roll back if needed. You only need to know the basics to get started:

1. **Stage your changes** (the files you've edited):

    ```bash
    git add .
    ```

2. **Commit them with a message**:

    ```bash
    git commit -m "Draft intro chapter"
    ```

3. **Tag important versions** (like a submission draft):

    ```bash
    git tag draft1
    ```

4. **View commit history**

    ```bash
    git log
    ```

That's enough for everyday use. The key is to **commit regularly** so your writing is backed by a version history, and to **stage changes in small, related chunks** that reflect a single task. Over time you can also:

- "Time travel" to older versions
- Sync your repo remote repository (e.g. GitHub)
- Learn branching for experiments, etc.

See the [official Git docs](https://git-scm.com/docs) for more.

## Sync and backup

It's an all too common tragedy: a researcher loses months (or years) of work to a failed hard drive or a stolen laptop. Don't let that be you.

There are **two complementary protections**:

- **Sync**: keeps your files up to date across devices. Examples include [Zotero sync](https://www.zotero.org/support/sync), GitHub, Dropbox, [Syncthing](https://syncthing.net/), and Synology solutions. You may prevent data loss in the case of a lost device, but **if something gets corrupted or deleted, the bad copy is synced too**

- **Backups** take point-in-time snapshots that you can restore later. They are used to recover a clean copy after mistakes, crashes, or sync errors. Examples include Time Machine (macOS), Borg, and Synology Hyper Backup.

If you only do the basics, I recommend combining these three measures:

1. Turn on Zotero sync (keeps your references and PDFs safe).
2. Use GitHub (private repo) or Dropbox to sync your dissertation project folder.
3. Run Time Machine (macOS) or an equivalent backup tool so you can restore your system to any previous state.