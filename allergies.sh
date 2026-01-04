#!/usr/bin/env bash

score=$1
command=$2
item=$3

declare -A allergens=(
  [eggs]=1
  [peanuts]=2
  [shellfish]=4
  [strawberries]=8
  [tomatoes]=16
  [chocolate]=32
  [pollen]=64
  [cats]=128
)

score=$((score % 256))

if [[ "$command" == "allergic_to" ]]; then
  if (( score & allergens[$item] )); then
    echo "true"
  else
    echo "false"
  fi

elif [[ "$command" == "list" ]]; then
  result=()
  for allergen in eggs peanuts shellfish strawberries tomatoes chocolate pollen cats; do
    if (( score & allergens[$allergen] )); then
      result+=("$allergen")
    fi
  done
  echo "${result[*]}"
fi
