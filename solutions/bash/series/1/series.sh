#!/usr/bin/env bash

digits="$1"
n="$2"

fail() {
  echo "$1"
  exit 1
}

if [[ "$n" == -* ]]; then
  [[ "${n#-}" =~ ^[0-9]+$ ]] || fail "slice length must be a non-negative integer"
  fail "slice length cannot be negative"
fi

[[ "$n" =~ ^[0-9]+$ ]] || fail "slice length must be a non-negative integer"

(( n != 0 )) || fail "slice length cannot be zero"

[[ "$digits" =~ ^[0-9]*$ ]] || fail "input must only contain digits"

len=${#digits}

(( len > 0 )) || fail "series cannot be empty"

(( n <= len )) || fail "slice length cannot be greater than series length"

slices=()
for (( i=0; i<=len-n; i++ )); do
  slices+=( "${digits:i:n}" )
done

echo "${slices[*]}"
