#!/usr/bin/env bash

set -euo pipefail

tmpf=$(mktemp)
cat "$1" > "$tmpf"

IFS=$'\n'
for l in $(cat "$2" | tr -s '\n');
do
  match=$(echo "$l" | cut -d' ' -f1)
  sub=$(echo "$l" | cut -d' ' -f2)
  sed -i '' -e "s|${match}|${sub}|g" "$tmpf"
done

cat "$tmpf"
rm "$tmpf"
