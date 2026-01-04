name="you"

if [ $# -ge 1 ] && [ -n "$1" ]; then
  name="$1"
else
  read -r input || true
  if [ -n "$input" ]; then
    name="$input"
  fi
fi

printf "One for %s, one for me.\n" "$name"
