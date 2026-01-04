#!/usr/bin/env bash

subjects=(
  "the house that Jack built."
  "the malt"
  "the rat"
  "the cat"
  "the dog"
  "the cow with the crumpled horn"
  "the maiden all forlorn"
  "the man all tattered and torn"
  "the priest all shaven and shorn"
  "the rooster that crowed in the morn"
  "the farmer sowing his corn"
  "the horse and the hound and the horn"
)

verbs=(
  ""
  "that lay in"
  "that ate"
  "that killed"
  "that worried"
  "that tossed"
  "that milked"
  "that kissed"
  "that married"
  "that woke"
  "that kept"
  "that belonged to"
)

invalid() {
  echo "invalid"
  exit 1
}

# Must have exactly two args
[[ "$#" -eq 2 ]] || invalid

start="$1"
end="$2"

# Must be integers
[[ "$start" =~ ^[0-9]+$ ]] || invalid
[[ "$end" =~ ^[0-9]+$ ]] || invalid

# Must be within 1..12 and start <= end
(( start >= 1 && start <= 12 )) || invalid
(( end >= 1 && end <= 12 )) || invalid
(( start <= end )) || invalid

verse() {
  local n=$1
  echo "This is ${subjects[n]}"
  for (( i=n; i>0; i-- )); do
    echo "${verbs[i]} ${subjects[i-1]}"
  done
}

for (( v=start-1; v<end; v++ )); do
  verse "$v"
  if (( v < end-1 )); then
    echo
  fi
done

exit 0
