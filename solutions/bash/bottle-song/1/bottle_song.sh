#!/usr/bin/env bash
if (( $# != 2 )); then
  echo "2 arguments expected"
  exit 1
fi
start="$1"
take="$2"

if (( take > start )); then
  echo "cannot generate more verses than bottles"
  exit 1
fi

num_to_word_cap() {
  case "$1" in
    10) echo "Ten" ;;
    9) echo "Nine" ;;
    8) echo "Eight" ;;
    7) echo "Seven" ;;
    6) echo "Six" ;;
    5) echo "Five" ;;
    4) echo "Four" ;;
    3) echo "Three" ;;
    2) echo "Two" ;;
    1) echo "One" ;;
    0) echo "No" ;;
  esac
}

num_to_word_low() {
  case "$1" in
    10) echo "ten" ;;
    9) echo "nine" ;;
    8) echo "eight" ;;
    7) echo "seven" ;;
    6) echo "six" ;;
    5) echo "five" ;;
    4) echo "four" ;;
    3) echo "three" ;;
    2) echo "two" ;;
    1) echo "one" ;;
    0) echo "no" ;;
  esac
}

bottle_word() {
  if (( $1 == 1 )); then
    echo "bottle"
  else
    echo "bottles"
  fi
}

for (( i=start; i>start-take; i-- )); do
  current_cap=$(num_to_word_cap "$i")
  next_low=$(num_to_word_low "$((i-1))")

  current_bottle=$(bottle_word "$i")
  next_bottle=$(bottle_word "$((i-1))")

  printf "%s green %s hanging on the wall,\n" "$current_cap" "$current_bottle"
  printf "%s green %s hanging on the wall,\n" "$current_cap" "$current_bottle"
  printf "And if one green bottle should accidentally fall,\n"
  printf "There'll be %s green %s hanging on the wall.\n" "$next_low" "$next_bottle"

  (( i > start-take+1 )) && printf "\n"
done

exit 0
