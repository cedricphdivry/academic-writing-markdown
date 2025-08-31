#!/usr/bin/env bash
set -euo pipefail

input=${1:?Usage: $0 <file.md|dir>}
mkdir -p exports

if [[ -d "$input" ]]; then
  shopt -s nullglob
  files=( "$input"/*.md )
  if (( ${#files[@]} == 0 )); then
    echo "No .md files found in '$input'." >&2
    exit 1
  fi
  basename=$(basename "$input")
  resource_path="$input:."
else
  files=( "$input" )
  filename="${input##*/}"
  basename="${filename%%.*}"
  srcdir="$(cd "$(dirname "$input")" && pwd)"
  resource_path="$srcdir:."
fi

pandoc "${files[@]}" \
  --resource-path="$resource_path" \
  --citeproc \
  --bibliography refs.bib \
  --pdf-engine xelatex \
  --csl citation-style-CMS17.csl \
  -o "exports/${basename}.pdf"
