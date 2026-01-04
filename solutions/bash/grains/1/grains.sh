#!/usr/bin/env bash

arg="$1"

error() {
  echo "Error: invalid input"
  exit 1
}

[[ "$#" -ne 1 ]] && error

if [[ "$arg" == "total" ]]; then
  echo "2^64 - 1" | bc
  exit 0
fi

[[ "$arg" =~ ^[0-9]+$ ]] || error
(( arg >= 1 && arg <= 64 )) || error

echo "2^($arg-1)" | bc
