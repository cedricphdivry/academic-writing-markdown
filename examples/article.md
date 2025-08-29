

# Writing in Markdown

## The basics

Starting to write in Markdown is straightforward: create a `new-file.md` wherever you want and start writing!

Like HTML, Mardown is a **markup language**. If you are reading this Markdown document on the main page of the GutHub repository, the raw Markdown is interpreted to display this formatted document. If you are reading it in VS Code, you only see the Markdown.

To get you started, here are some of the basic elements of Markdown which I used the most:

- **Headings** are introduced with one or more `#` symbols. If you look at the raw Markdown of this document, the title is written `# Thesis in Markdown` (top level heading or title), the subsection is written `## How to use` (level-2 heading) this sub-subsection is written `### Writing` (level-3 heading).

- **Bold** text is surrounded by `**` symbols, as in this sentence which is starts out as `**Bold** text`.
- ***Italic*** text is surrounded by a single `*` symbol. Text can be both bold and italic with `***` surrounding the text. <!-- VS Code [extension?] automatically inserts the symbols around a selection of text with the common shortcuts `Cmd-b` for bold and `Cmd-i` for italic. -->

- > **Block quotes** are introduced as paragraphs starting with a `>` symbol. In the raw Markdown, this paragraph starts out with as follows: `> **Block quotes** are introduced`.

- A **non-breaking space** is inserted by pressing `option-Space`. The non-breaking space will be highlighted by VS Code in a little colored box.

<!-- GIF colored box -->

- **Comments** can be included using HTML syntax: `<!-- This comment would not be visible in this output document if I didn't surrond it with backticks, which ignores all syntax -->`.

Threre a lot more to [Markdown syntax](https://www.markdownguide.org/basic-syntax/), which is still more powerful in the [Pandoc variant](https://pandoc.org/MANUAL.html) used in this setup. Here we will only cover a few more essentials most relevant to academic writing.

### Math

Writing mathematical expressions in Markdown follows the syntax of [LaTeX formatted math](https://en.wikibooks.org/wiki/LaTeX/Mathematics).

**Inline equations** are delimited by `$...$`. The following intput `$Y = AK^{\alpha}L^{\beta}$` will output $Y = AK^{\alpha}L^{\beta}$.

A **displayed equation** will take up a line of its own, and is delimited by `$$...$$`. For example, the following input:

```
$$ c^* = (1-s)A\left(\frac{s}{\delta + \gamma + n}\right)^{\frac{\alpha}{1-\alpha}} $$
```
will output

$$ c^* = (1-s)A\left(\frac{s}{\delta + \gamma + n}\right)^{\frac{\alpha}{1-\alpha}} $$

### Images

Images are inserted using 

This image is produced by the input below.

```
![The multiplication of activities and 'divisions of labor' [@Jacobs1969:EconomyCities 58]](img/eoc-diagrams/divisions-labor.png){width=300px}
```

I group images in the `images` folder.

### Diagrams

Diagrams can be easily inserted as [images](#images) from another tool like [draw.io](https://www.drawio.com/).

Alternatively, diagrams can constructed with a plain-text solution like [Mermaid](https://mermaid.js.org/) (like in this README, see [publishing](#publishing)). Using Mermaid with Pandoc involves [installing a filter](https://github.com/raghur/mermaid-filter).

### Footnotes

Footnotes are created in the body of text by inserting the `[^footnote_name]`, and the actual content of the footnote in the body of the text:

```
[^footnote_name]:
  This is how you would write the content of a multiline footnote. Watch out for the colon after the footnote name and the tab at the beginning of the paragraph! You can place footnote contents anywhere within your markdown document, but I recommend placing them below the paragraph where they are referenced. In the final document, the footnote will be numbered and its name will not be visible. The number will be automatically determined based on where the [^footnote_name] is placed in the text.
```

## References

Notice the `nocite` key in the frontmatter: the references listed are not cited in the body of the text, but will appear in the references anyway.

