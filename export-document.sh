#!/bin/bash
input=$1

if [[ -d "$input" ]]; then
  files=$(ls -1 "$input"/*.md | sort)
  basename=$(basename "$input")
else
  files=$input
  filename="${input##*/}"
  basename="${filename%%.*}"
fi

pandoc $files \
  --citeproc \
  --bibliography refs.bib \
  --csl citation-style-CMS17.csl \
  -o exports/${basename}.pdf
