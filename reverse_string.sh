if [ "$#" -gt 0 ]; then
    printf "%s\n" "$1" | rev
else
    rev
fi
