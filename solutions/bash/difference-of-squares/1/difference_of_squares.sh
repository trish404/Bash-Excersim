#!/usr/bin/env bash

command=$1
n=$2

square_of_sum() {
  sum=$(( n * (n + 1) / 2 ))
  echo $(( sum * sum ))
}

sum_of_squares() {
  echo $(( n * (n + 1) * (2*n + 1) / 6 ))
}

difference() {
  local sos
  local sosq
  sos=$(square_of_sum)
  sosq=$(sum_of_squares)
  echo $(( sos - sosq ))
}

case "$command" in
  square_of_sum)
    square_of_sum
    ;;
  sum_of_squares)
    sum_of_squares
    ;;
  difference)
    difference
    ;;
esac
