#!/usr/bin/env bash

name="$1"
number="$2"

if [ "$#" -ne 2 ]; then
  echo "Usage: deli.sh <name> <number>"
  exit 1
fi

if ! [[ "$number" =~ ^[0-9]+$ ]] || (( number < 1 || number > 999 )); then
  echo "Usage: deli.sh <name> <number>"
  exit 1
fi

suffix="th"
last_two=$(( number % 100 ))
last_one=$(( number % 10 ))

if (( last_two < 11 || last_two > 13 )); then
  case "$last_one" in
    1) suffix="st" ;;
    2) suffix="nd" ;;
    3) suffix="rd" ;;
  esac
fi

printf "%s, you are the %d%s customer we serve today. Thank you!\n" \
  "$name" "$number" "$suffix"
