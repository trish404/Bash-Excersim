#!/usr/bin/env bash

fail() {
  echo "Error: Only positive numbers are allowed"
  exit 1
}

(( $# == 1 )) || fail

n="$1"

[[ "$n" =~ ^[0-9]+$ ]] || fail
(( n > 0 )) || fail

steps=0
while (( n != 1 )); do
  if (( n % 2 == 0 )); then
    n=$(( n / 2 ))
  else
    n=$(( 3 * n + 1 ))
  fi
  (( steps++ ))
done

echo "$steps"
