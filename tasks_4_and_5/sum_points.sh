#!/bin/bash
# Piotr Skowron

FILE='data.txt'
arrSum=()

# all points which are in the same line like [xx pts]
if [ -f $FILE ]; then
  SUM_1="$(grep -oP '\[\K\s?[0-9]+\s?(?=pts\])' data.txt | paste -sd+ | bc)"
  arrSum+=("$SUM_1")
else
  echo "No such file $FILE"
  exit 1
fi

while IFS= read -r line
do
  # if line starts from pts then check out previous to get points
  if [[ "$line" =~ ^pts.* ]]; then
    if [ ! -z ${prev_line+x} ]; then
      SUM_2="$(echo "$prev_line" | grep -oP '\[\K\s?[0-9]+\s?')"
      arrSum+=("$SUM_2")
    fi
  fi
  prev_line=$line
done < "$FILE"

POINTS=0

for i in ${arrSum[@]}; do
  let POINTS+=$i
done

echo "Total points: $POINTS"
