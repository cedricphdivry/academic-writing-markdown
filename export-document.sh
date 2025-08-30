#!/usr/bin/env bash
set -euo pipefail

input=${1:?Usage: $0 <file.md|dir>}
mkdir -p exports

if [[ -d "$input" ]]; then
  # Use bash globbing (already lexicographically sorted) instead of ls | sort
  shopt -s nullglob
  files=( "$input"/*.md )
  if (( ${#files[@]} == 0 )); then
    echo "No .md files found in '$input'." >&2
    exit 1
  fi
  basename=$(basename "$input")
  resource_path="$input:."          # look in that folder AND project root
else
  files=( "$input" )
  filename="${input##*/}"
  basename="${filename%%.*}"
  srcdir="$(cd "$(dirname "$input")" && pwd)"
  resource_path="$srcdir:."         # file's folder AND project root
fi

pandoc "${files[@]}" \
  --resource-path="$resource_path" \
  --citeproc \
  --bibliography refs.bib \
  --csl citation-style-CMS17.csl \
  --pdf-engine xelatex \
  -o "exports/${basename}.pdf"
