#!/bin/bash
# Day 1 - part 1

cp input.backup input
sed -i 's/-/,/g' input

filename='input'

overlapping=0
limits=()

while read -r line
do	
	limits=($(echo $line | tr "," " "))
	l11=${limits[0]}
	l12=${limits[1]}
	l21=${limits[2]}
	l22=${limits[3]}
	if [[ $l21 -ge $l11 ]] && [[ $l21 -le $l12 ]] && [[ $l22 -ge $l11 ]] && [[ $l22 -le $l12 ]]
	then
		overlapping=$((overlapping+1))
	else
		if [[ $l11 -ge $l21 ]] && [[ $l11 -le $l22 ]] && [[ $l12 -ge $l21 ]] && [[ $l12 -le $l22 ]]
		then
			overlapping=$((overlapping+1))
		fi
	fi
done < $filename
echo "Overlapping pairs: $overlapping"
