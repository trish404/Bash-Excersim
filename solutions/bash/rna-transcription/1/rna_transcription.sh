#!/usr/bin/env bash

dna="$1"
rna=""

if ! [[ "$dna" =~ ^[ACGT]*$ ]]; then
  echo "Invalid nucleotide detected."
  exit 1
fi

for (( i=0; i<${#dna}; i++ )); do
  case "${dna:i:1}" in
    G) rna+="C" ;;
    C) rna+="G" ;;
    T) rna+="A" ;;
    A) rna+="U" ;;
  esac
done

echo "$rna"
