#!/bin/bash
# -*- ENCODING: UFT-8 -*-

# Recibe un fichero con urls y las evalúa línea por línea
# para sacar las IP. Que posteriormente guarda en
# el archivo resultado.txt.
#
# Será BORRADO el archivo resultado.txt en caso de existir.

function obtener_IPs() {
    clear
    if [ $# = 0 ]
    then
        read -p 'Introduce el nombre del archivo → ' input
        generar_resultado $input
    fi

    if [ -f $1 ]
    then
        generar_resultado $1
    else
            var=$(echo $1 | cut -d'/' -f3)
            resultado=$(nslookup $var | tail -n2 | head -n1 | cut -d' ' -f2)
            return "$1 → $resultado"
    fi

}

function generar_resultado() {
    if [ -f $1 ]
    then
        if [ -f 'resultado.txt' ]
        then
            rm resultado.txt
        fi
        for y in $(cat $1 | cut -d'/' -f3)
        do
            resultado=$(nslookup $y | tail -n2 | head -n1 | cut -d' ' -f2)
            echo "$y → $resultado"
            echo $resultado >> resultado.txt 2>> /dev/null
        done
    fi
}

var=$(obtener_IPs "https://www.google.es/")

echo $var
