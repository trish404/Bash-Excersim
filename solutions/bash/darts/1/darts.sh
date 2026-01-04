#!/usr/bin/env bash

fail() {
  echo "invalid arguments"
  exit 1
}

(( $# == 2 )) || fail

x="$1"
y="$2"

is_num() {
  [[ "$1" =~ ^[+-]?([0-9]+([.][0-9]+)?|[.][0-9]+)$ ]]
}

is_num "$x" || fail
is_num "$y" || fail

awk -v x="$x" -v y="$y" '
BEGIN {
  r2 = x*x + y*y
  if (r2 <= 1)        print 10
  else if (r2 <= 25)  print 5
  else if (r2 <= 100) print 1
  else                print 0
}
'
