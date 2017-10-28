#!/bin/bash

# Recibe un fichero y lo ordena alfabéticamente (por líneas).
# Lo guarda en un fichero a parte.


function ordenar() {
    clear
    read -p 'Introduce el nombre del archivo → ' input
    if [ -f $input ]
    then
        sort $input > resultado_ordenado.txt
    fi
}

ordenar
