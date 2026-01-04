#!/usr/bin/env bash

colors=(
  black
  brown
  red
  orange
  yellow
  green
  blue
  violet
  grey
  white
)

command="$1"
arg="$2"

case "$command" in
  code)
    for i in "${!colors[@]}"; do
      if [[ "${colors[i]}" == "$arg" ]]; then
        echo "$i"
        exit 0
      fi
    done
    exit 1
    ;;
  colors)
    printf "%s\n" "${colors[@]}"
    ;;
  *)
    exit 1
    ;;
esac
