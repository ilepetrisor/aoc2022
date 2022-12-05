#!/bin/bash

filename='input'
stack=()
i=0
j=0
moves=0

while read -r line
do
	if [[ -z $line ]]
	then
		# stacks definition and moves separator
		moves=1
		continue
	fi
	
	if [[ $moves -eq 1 ]]
	then

		# we've got the moves like Jagger
		count=`echo $line | cut -d" " -f2`
		from_index=`echo $line | cut -d" " -f4`
		to_index=`echo $line | cut -d" " -f6`

		oldfrom=${stack[$from_index]}
		oldto=${stack[$to_index]}
		
		newcount=$((count+1))
		from_len=`echo $oldfrom | awk '{print length}'`
		to_len=`echo $oldto | awk '{print length}'`

		moving=""
		moving=`expr substr $oldfrom 1 $count`
		
		# reverse string
		new_moving=`echo $moving | rev`

		newfrom=""
		newfrom=`expr substr $oldfrom $newcount $from_len`
		stack[$from_index]=$newfrom

		newto=$new_moving$oldto
		stack[$to_index]=$newto

	fi

	if [[ $moves -eq 0 ]]
	then
		# create arrays for stacks
		i=0
		while read -n1 char
		do
			j=0
			case $i in
			1)
				j=1
				;;
			5)
				j=2
				;;
			9)
				j=3
				;;
			13)
				j=4
				;;
			17)
				j=5
				;;
			21)
				j=6
				;;
			25)
				j=7
				;;
			29)
				j=8
				;;
			33)
				j=9
				;;
			esac
			if [[ $j -ne 0 ]]
			then
				tmp=""
				tmp=${stack[$j]}
				tmp=${stack[$j]}$char
				stack[$j]=$tmp
			fi
			i=$((i+1))
		done < <(echo "$line" )
	fi
done < $filename

response=""

for i in {1..9..1}
do
	len=`echo ${stack[$i]} | awk '{print length}'`
	tmp=$response
	first=`expr substr ${stack[$i]} 1 1`
	response=$tmp$first
done
echo "response = $response"
