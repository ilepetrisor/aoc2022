#!/bin/bash
# Day 1 - part 1

array=()
filename='input'
sum=0

while read -r line; do
	#flushing the array
	for i in {65..122..1}; do
		array[$i]=0
	done

	# length of line
	len=`echo -n "$line" | wc -m`
	# half index
	half=$len/2
	# split line in 2
	first=${line:0:$half}
	second=${line:$half:$len}

	# cycle through first half
	while read -n1 letter; do
		decimal=`printf '%d' \'$letter`
		array[$decimal]=1
	done < <(echo -n "$first")

	# cycle through second half
	while read -n1 letter; do
		decimal=`printf '%d' \'$letter`
		if [[ ${array[$decimal]} -eq 1 ]]
		then
			array[$decimal]=2
		fi
	done < <(echo -n "$second")

	score=0
	for i in {65..122..1}; do
		if [[ ${array[$i]} -eq 2 ]] 
		then
			echo -n "common letter in $line (length: $len) is at index $i (score: "
			if [[ $i -gt 91 ]]
			then
				sum=$((sum+i-96))
				score=$((i-96))
			else
				sum=$((sum+i-38))
				score=$((i-38))
			fi
			echo "$score)"
		fi
	done
	if [[ $score -eq 0 ]]
	then
		echo "no common letter found in $line (length: $len)"
	fi
done < $filename

echo "Sum = $sum"
