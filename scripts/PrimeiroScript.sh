#!/bin/bash
clear
echo "Meu primeiro Script!" 
echo ""
echo "O script $0 possui $# parametros."
echo ""
LINHAS=$(wc -l $0 |cut -f1 -d ' ')
echo "O arquivo $0 possui $LINHAS linhas."
CONTA=$(expr $LINHAS - 1)
echo "O valor de CONTA e $CONTA"

