#!/bin/bash
# Day 1 - part 1

filename='input'
maxsum=0
maxelf=0
elf=1
sum=0
while read -r line
	do
		if [[ $line = "" ]]
		then
			echo "Elf $elf : total $sum"
			if [[ $sum -gt $maxsum ]]
			then
				maxsum=$sum
				maxelf=$elf
				echo "New max found: elf $maxelf with $maxsum"
			fi
			elf=$((elf+1))
			sum=0
		else
			sum=$((sum+line))
		fi
	done < $filename
echo "Max is $maxsum carried by elf $maxelf"
		
