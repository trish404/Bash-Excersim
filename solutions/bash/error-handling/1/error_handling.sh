#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Usage: error_handling.sh <person>"
  exit 1
fi

printf "Hello, %s\n" "$1"