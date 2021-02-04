#!/bin/bash
# Version: 1.0
# Get the CPU and IO by sar.
# Lucas Quintanilha

if [ $# == 2 ]; then
	echo "-> sar $1 $2"
	sleep 2
	echo "Obtendo dados de CPU e IO. Aguarde..."

	touch tmp.log
	LINES=$(expr $2 + 1)
	sar $1 $2 | tail -n $LINES >> tmp.log

	CPUVALUE=$(cat tmp.log | sort -nk 3 | tail -1 | awk '{print $3}')
	IOVALUE=$(cat tmp.log | sort -nk 6 | tail -1 | awk '{print $6}')

	echo -e "Finalizando...\n"
	sleep 2

	echo -e "Top CPU: \t$CPUVALUE%\n"
	echo -e "Top IO: \t$IOVALUE%\n"

	rm tmp.log

else
	echo -e "Parametros fornecidos invalidos.\n"
fi
