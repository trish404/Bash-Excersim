#!/usr/bin/env bash

input="$1"

s=$(printf "%s" "$input" | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z')

for ch in {a..z}; do
  case "$s" in
    *"$ch"*) ;;
    *) echo "false"; exit 0 ;;
  esac
done

echo "true"
