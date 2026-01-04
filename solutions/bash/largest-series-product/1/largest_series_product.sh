#!/usr/bin/env bash

digits="$1"
span="$2"

fail() {
  echo "$1"
  exit 1
}

[[ "$span" =~ ^-?[0-9]+$ ]] || fail "span must be a non-negative integer"

(( span >= 0 )) || fail "span must not be negative"

[[ "$digits" =~ ^[0-9]*$ ]] || fail "input must only contain digits"

len=${#digits}

(( span <= len )) || fail "span must not exceed string length"

if (( span == 0 )); then
  echo 1
  exit 0
fi

max=0

for (( i=0; i<=len-span; i++ )); do
  prod=1
  for (( j=0; j<span; j++ )); do
    prod=$(( prod * ${digits:i+j:1} ))
  done
  (( prod > max )) && max=$prod
done

echo "$max"
