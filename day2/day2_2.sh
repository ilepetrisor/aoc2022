#!/bin/bash

cp input.backup input

filename='input'

sed -i 's/A X/3/' $filename
sed -i 's/A Y/4/' $filename
sed -i 's/A Z/8/' $filename
sed -i 's/B X/1/' $filename
sed -i 's/B Y/5/' $filename
sed -i 's/B Z/9/' $filename
sed -i 's/C X/2/' $filename
sed -i 's/C Y/6/' $filename
sed -i 's/C Z/7/' $filename

score=0

while read -r line
do
	score=$((score+line))
done < $filename
echo "Total score: $score"
