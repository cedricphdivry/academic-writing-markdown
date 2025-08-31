#!/bin/bash
file="$1"
filename="${file##*/}"
basename="${filename%%.*}"

mkdir -p exports

srcdir="$(cd "$(dirname "$file")" && pwd)"
resource_path="$srcdir:."

pandoc "$file" \
  -t beamer \
  --slide-level=2 \
  --citeproc \
  --bibliography refs.bib \
  --csl citation-style-CMS17.csl \
  --pdf-engine=xelatex \
  --resource-path="$resource_path" \
  -o "exports/${basename}.pdf"
