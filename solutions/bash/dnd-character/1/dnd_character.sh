#!/usr/bin/env bash

roll_die() {
  echo $(( RANDOM % 6 + 1 ))
}

ability() {
  local rolls=()
  for _ in {1..4}; do
    rolls+=( "$(roll_die)" )
  done

  IFS=$'\n' local sorted=($(sort -n <<<"${rolls[*]}"))
  unset IFS

  echo $(( sorted[1] + sorted[2] + sorted[3] ))
}

modifier() {
  local diff=$(( $1 - 10 ))
  if (( diff < 0 && diff % 2 != 0 )); then
    diff=$(( diff - 1 ))
  fi
  echo $(( diff / 2 ))
}

character() {
  local strength dexterity constitution intelligence wisdom charisma hitpoints

  strength=$(ability)
  dexterity=$(ability)
  constitution=$(ability)
  intelligence=$(ability)
  wisdom=$(ability)
  charisma=$(ability)

  hitpoints=$(( 10 + $(modifier "$constitution") ))

  echo "strength $strength"
  echo "dexterity $dexterity"
  echo "constitution $constitution"
  echo "intelligence $intelligence"
  echo "wisdom $wisdom"
  echo "charisma $charisma"
  echo "hitpoints $hitpoints"
}

fail() {
  echo "invalid arguments"
  exit 1
}

cmd="$1"
shift || true

case "$cmd" in
  modifier)
    (( $# == 1 )) || fail
    [[ "$1" =~ ^-?[0-9]+$ ]] || fail
    modifier "$1"
    ;;
  ability)
    (( $# == 0 )) || fail
    ability
    ;;
  character|generate)
    (( $# == 0 )) || fail
    character
    ;;
  *)
    fail
    ;;
esac
