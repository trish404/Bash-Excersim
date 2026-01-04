#!/usr/bin/env bash

number="$1"
result=""

(( number % 3 == 0 )) && result+="Pling"
(( number % 5 == 0 )) && result+="Plang"
(( number % 7 == 0 )) && result+="Plong"

if [[ -z "$result" ]]; then
  echo "$number"
else
  echo "$result"
fi
