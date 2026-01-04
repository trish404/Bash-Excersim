#!/usr/bin/env bash

a_str="$1"
b_str="$2"

parse_list() {
  local s="$1"
  local -n out="$2"

  out=()

  s="${s#[}"
  s="${s%]}"

  s="${s//,/}"

  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"

  [[ -z "$s" ]] && return 0

  read -r -a out <<< "$s"
}

parse_list "$a_str" a
parse_list "$b_str" b

is_equal() {
  local -n x=$1
  local -n y=$2
  (( ${#x[@]} == ${#y[@]} )) || return 1
  for (( i=0; i<${#x[@]}; i++ )); do
    [[ "${x[i]}" == "${y[i]}" ]] || return 1
  done
  return 0
}

contains() {
  local -n big=$1
  local -n small=$2

  local bl=${#big[@]}
  local sl=${#small[@]}

  (( sl == 0 )) && return 0
  (( bl < sl )) && return 1

  for (( i=0; i<=bl-sl; i++ )); do
    local match=1
    for (( j=0; j<sl; j++ )); do
      if [[ "${big[i+j]}" != "${small[j]}" ]]; then
        match=0
        break
      fi
    done
    (( match == 1 )) && return 0
  done

  return 1
}

if is_equal a b; then
  echo "equal"
elif contains a b; then
  echo "superlist"
elif contains b a; then
  echo "sublist"
else
  echo "unequal"
fi
