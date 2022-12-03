#!/bin/bash
# Day 1 - part 1

array=()
filename='input'
sum=0
crtline=1
grpnr=1
for i in {65..122..1}
do
	array[$i]=0
done
echo "------------- Group $grpnr ------------"
while read -r line; do
	echo "line $crtline: $line"
	while read -n1 letter; do
		decimal=`printf '%d' \'$letter`
		case $crtline in
			1)
				array[$decimal]=1
			;;
			2)
				if [[ ${array[$decimal]} -eq 1 ]]
				then 
					array[$decimal]=2
				fi
			;;
			3)
				if [[ ${array[$decimal]} -eq 2 ]]
				then
					array[$decimal]=3
				fi
			esac
	done < <(echo -n "$line")

	echo -n "array is ( "
	for i in {65..91..1} 
	do
		echo -n "${array[$i]} "
	done
	for i in {97..122..1}
	do
		echo -n "${array[$i]} "
	done
	echo " )"
	
	# group ended
	if [[ $crtline -eq 3 ]]
	then
		echo "----------------- END ------------------"
		# find "badge" for group and calculate score and sum
		score=0
		for i in {65..122..1}; do
			if [[ ${array[$i]} -eq 3 ]] 
			then
				echo -n "common letter in group is at index $i (score: "
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
			echo "no common letter found in group"
		fi

		# flush array for next group
		for i in {65..122..1}; do
			array[$i]=0
		done
		grpnr=$((grpnr+1))
		crtline=1
		echo "------------------ Group $grpnr --------------------"
	else
		crtline=$((crtline+1))
	fi
	# length of line
#	len=`echo -n "$line" | wc -m`
	# half index
#	half=$len/2
	# split line in 2
#	first=${line:0:$half}
#	second=${line:$half:$len}

done < $filename

echo "Sum = $sum"
