#!/usr/bin/env bash

target="$1"
candidates_str="$2"

read -r -a candidates <<< "$candidates_str"

normalize() {
  echo "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | grep -o . \
    | sort \
    | tr -d '\n'
}

target_norm="$(normalize "$target")"
target_lower="$(echo "$target" | tr '[:upper:]' '[:lower:]')"

results=()

for word in "${candidates[@]}"; do
  word_lower="$(echo "$word" | tr '[:upper:]' '[:lower:]')"

  [[ "$word_lower" == "$target_lower" ]] && continue

  word_norm="$(normalize "$word")"

  [[ "$word_norm" == "$target_norm" ]] && results+=("$word")
done

echo "${results[*]}"
