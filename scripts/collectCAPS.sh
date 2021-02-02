#!/bin/bash
clear
echo " "
echo "-> Executing the  ..."
echo " "

ls -l
echo " "
echo "-> Enter the filename:"
read filename
echo " "

# verifica se o arquivo informado existe.
if [ -f "$filename" ]; then
	echo " "
	echo "-> Analyzing $filename ..."
	mkdir tmp
	# Divide o arquivo sempre em 00:00: de forma que todas as vezes esse arquivo se repita.
    csplit -n 1 -f tmp/ $filename '/00:00:/' '{*}'
	echo " "
	echo "-> Checking data... "
	echo " "


	eval "cd tmp"
	nfiles=`ls -l | wc -l`
	nfiles=$(($nfiles - 1))
	echo "-> The $filename was splited in $nfiles files."
	echo " "
	ls -l
	echo " "

	nfiles=$((nfiles - 1))
	lastFile=$nfiles
	echo "-> Checking $lastFile ..."
	echo " "
	
	time1=`cat $lastFile | head -1 | awk '{ print $1 }' | cut -b 2-9`
	time2=`cat $lastFile | tail -1 | awk '{ print $1 }' | cut -b 2-9`
	echo "-> Checking CAPS between $time1 and $time2"
	echo " "

	echo "-> Top CAPS"
	echo " "

	awk '{ print }' $lastFile | sort -n -k5 | tail -10 | awk '/CAPS/ { print }'
	echo " "

	awk '{ print }' $lastFile | sort -n -k5 | tail -21 | awk ' { sum+=$5 } END { print "Average CAPS: ",sum/NR }'

	rm -r ../tmp
	else 
    echo "ERROR: The '$filename' does not exist."
fi
