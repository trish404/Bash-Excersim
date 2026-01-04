#!/usr/bin/env bash

fail() {
  echo "invalid arguments"
  exit 1
}

is_int() {
  [[ "$1" =~ ^-?[0-9]+$ ]]
}

(( $# == 2 || $# == 4 )) || fail

hour="$1"
minute="$2"

is_int "$hour" || fail
is_int "$minute" || fail

offset=0
if (( $# == 4 )); then
  op="$3"
  delta="$4"
  is_int "$delta" || fail

  case "$op" in
    "+") offset="$delta" ;;
    "-") offset="$((-delta))" ;;
    *) fail ;;
  esac
fi

total=$(( hour * 60 + minute + offset ))

day=$(( 24 * 60 ))
total=$(( (total % day + day) % day ))

h=$(( total / 60 ))
m=$(( total % 60 ))

printf "%02d:%02d\n" "$h" "$m"
