#!/usr/bin/env bash

input="$1"

input="${input//-/ }"

input="$(echo "$input" | tr -d '[:punct:]')"

acronym=""
for word in $input; do
  acronym+="${word:0:1}"
done

echo "${acronym^^}"
