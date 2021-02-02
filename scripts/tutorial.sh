#!/bin/bash
## This is a simple script.

if [ -e teste ]; then
	echo "The folder already exists."
else
	mkdir ./teste
	touch ./teste/teste2.txt
	echo "The loop was successfully." >> ./teste/teste2.txt
fi
