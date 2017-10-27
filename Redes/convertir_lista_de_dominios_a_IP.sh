#!/bin/bash
# -*- ENCODING: UFT-8 -*-

# Recibe un fichero con urls y las evalúa línea por línea
# para sacar las IP. Que posteriormente guarda en
# el archivo resultado.txt. 
# 
# Será BORRADO el archivo resultado.txt en caso de existir.

function obtener_IPs() {
    clear
    read -p 'Introduce el nombre del archivo → ' input
    if [ -f $input ]
    then
        echo "Resultados de $input"
        if [ -f 'resultado.txt' ]
        then
            rm resultado.txt
        fi
        for y in $(cat $input | cut -d'/' -f3)
        do
            resultado=$(nslookup $y | tail -n2 | head -n1 | cut -d' ' -f2)
            echo "$y → $resultado"
            echo $resultado >> resultado.txt 2>> /dev/null
        done
    fi
}

obtener_IPs
