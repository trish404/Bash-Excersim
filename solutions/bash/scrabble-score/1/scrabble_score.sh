#!/usr/bin/env bash

word="$1"
score=0

word=$(printf "%s" "$word" | tr '[:lower:]' '[:upper:]')

for (( i=0; i<${#word}; i++ )); do
  case "${word:i:1}" in
    A|E|I|O|U|L|N|R|S|T) ((score+=1)) ;;
    D|G)                 ((score+=2)) ;;
    B|C|M|P)             ((score+=3)) ;;
    F|H|V|W|Y)           ((score+=4)) ;;
    K)                   ((score+=5)) ;;
    J|X)                 ((score+=8)) ;;
    Q|Z)                 ((score+=10)) ;;
    *) ;;  
  esac
done

echo "$score"
