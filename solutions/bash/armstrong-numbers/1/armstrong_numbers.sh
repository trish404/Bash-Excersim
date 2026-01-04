number="$1"
len=${#number}
sum=0

for (( i=0; i<len; i++ )); do
  digit=${number:i:1}
  sum=$(( sum + digit ** len ))
done

if [[ "$sum" -eq "$number" ]]; then
  echo "true"
else
  echo "false"
fi