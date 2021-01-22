#!/bin/bash
if [ $1 ]; then
	VAR=$1
	while [ $VAR -ge 0 ]
	do
		echo $VAR
		VAR=`expr $VAR - 1`
		sleep 1
	done
else
	echo "Parametro nao informado"
fi
