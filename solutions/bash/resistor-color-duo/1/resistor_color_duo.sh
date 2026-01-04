#!/usr/bin/env bash

colors=(
  black brown red orange yellow green blue violet grey white
)

invalid() {
  echo "invalid color"
  exit 1
}

value_for() {
  local color="$1"
  for i in "${!colors[@]}"; do
    [[ "${colors[i]}" == "$color" ]] && { echo "$i"; return 0; }
  done
  return 1
}

[[ $# -ge 2 ]] || invalid

first=$(value_for "$1") || invalid
second=$(value_for "$2") || invalid

echo $((10#$first$second))
