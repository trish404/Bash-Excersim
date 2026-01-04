#!/usr/bin/env bash

string1="$1"
string2="$2"

# Must have exactly two arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: hamming.sh <string1> <string2>"
  exit 1
fi

# Lengths must be equal
if [ "${#string1}" -ne "${#string2}" ]; then
  echo "strands must be of equal length"
  exit 1
fi

distance=0

for (( i=0; i<${#string1}; i++ )); do
  if [ "${string1:i:1}" != "${string2:i:1}" ]; then
    ((distance++))
  fi
done

echo "$distance"
