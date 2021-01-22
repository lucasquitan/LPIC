#!/bin/bash
clear
echo "========== CAPS =========="

ls -l
echo -n "-> Enter the filename: "
read FILENAME

# Verifica se o arquivo passado realmente existe
if [ -f $FILENAME ]; then
	sleep 1
	echo "-> Analyzing $FILENAME"
	sleep 1 ; echo "." ; sleep 1 ; echo "." ; sleep 1

	csplit -n 1 -f tmp/ $filename '/00:00:/' '{*}'
	eval  "cd tmp"
	NFILES=`ls -l |wc -l`
	NFILES=`expr NFILES - 1`
	
	ls -l
	echo  ""
	LASTFILE=`expr NFILES - 1`
	echo  "-> Checking $LASTFILE"
else
	echo "ERROR: \"$FILENAME\" is invalid."
fi
