#!/usr/bin/env bash

input="$1"

[[ "$input" =~ ^[0-9]+$ ]] || exit 0

actions=()

(( input & 1 ))  && actions+=( "wink" )
(( input & 2 ))  && actions+=( "double blink" )
(( input & 4 ))  && actions+=( "close your eyes" )
(( input & 8 ))  && actions+=( "jump" )

if (( input & 16 )); then
  reversed=()
  for (( i=${#actions[@]}-1; i>=0; i-- )); do
    reversed+=( "${actions[i]}" )
  done
  actions=( "${reversed[@]}" )
fi

out=""
for (( i=0; i<${#actions[@]}; i++ )); do
  if (( i > 0 )); then out+=","; fi
  out+="${actions[i]}"
done

echo "$out"
