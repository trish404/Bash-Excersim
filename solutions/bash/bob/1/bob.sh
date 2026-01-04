#!/usr/bin/env bash

input="$1"

trimmed="$(echo "$input" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

if [[ -z "$trimmed" ]]; then
  echo "Fine. Be that way!"
  exit 0
fi

is_question=false
[[ "$trimmed" == *\? ]] && is_question=true

has_letters=$(echo "$trimmed" | grep -q '[A-Za-z]' && echo yes || echo no)
is_yelling=false
if [[ "$has_letters" == yes && "$trimmed" == "$(echo "$trimmed" | tr '[:lower:]' '[:upper:]')" ]]; then
  is_yelling=true
fi

if [[ "$is_question" == true && "$is_yelling" == true ]]; then
  echo "Calm down, I know what I'm doing!"
elif [[ "$is_yelling" == true ]]; then
  echo "Whoa, chill out!"
elif [[ "$is_question" == true ]]; then
  echo "Sure."
else
  echo "Whatever."
fi
