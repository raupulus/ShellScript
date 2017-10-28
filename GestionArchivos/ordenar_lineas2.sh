#!/bin/bash

# Recibe un fichero y lo ordena alfabéticamente (por líneas).
# Sobrescribe el fichero que recibe.


function ordenar() {
    clear
    read -p 'Introduce el nombre del archivo → ' input
    if [ -f $input ]
    then
        sort $input > tmp_resultado_ordenado.txt
        rm $input
        cp tmp_resultado_ordenado.txt  $input
        rm tmp_resultado_ordenado.txt
    fi
}

ordenar
