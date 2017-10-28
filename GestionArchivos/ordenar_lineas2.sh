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
        mv tmp_resultado_ordenado.txt  $input
    fi
}

ordenar
