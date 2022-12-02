#!/bin/bash
# Day 1 - part 1

filename='input'
myArray=()
elf=1
sum=0
while read -r line
	do
		if [[ $line = "" ]]
		then
			echo "Elf $elf : total $sum"
			myArray[$elf]=$sum
			elf=$((elf+1))
			sum=0
		else
			sum=$((sum+line))
		fi
	done < $filename
sum=0
for x in `printf "%s\n" ${myArray[@]} | sort -rnu | head -3`
do
	sum=$((sum+x))
done
echo $sum


		
