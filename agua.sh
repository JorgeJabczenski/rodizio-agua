#!/bin/bash

GRUPO="Grupo 3 SAIC - Novo"

# Baixa os dados
wget -q http://site.sanepar.com.br/grupos-rodizio

# Separa bonitinho
cat grupos-rodizio | grep "$GRUPO" -m2 -B4 | grep 'date-display' | cut -d'"' -f5 | sed 's/[<>]//g' | sed 's/\/span//g' | cut -d'p' -f1 | sed 's/.$//g' > .dias

i=0

while IFS= read -r line; do
    if [ $((i%2)) == 0 ]
    then
        echo "Começa : $line";
    else
        echo "Acaba  : $line";
    fi
    i=($i+1)
done < .dias

rm grupos-rodizio
