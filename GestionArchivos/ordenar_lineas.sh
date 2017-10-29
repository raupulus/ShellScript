#!/bin/bash

# Recibe un fichero y lo ordena alfabéticamente (por líneas).
# Lo guarda en un fichero a parte.


function ordenar() {
    clear
    
    read -p 'Introduce el nombre del archivo → ' input
    
    if [ -f $input ]
    then
        sort $input > resultado_ordenado.txt
    elif [ -z $input ]
    then
        echo 'No se ha insertado ningún archivo'
        exit 1
    else
        echo 'No es un archivo de texto plano válido'
        exit 1
    fi
}

ordenar

exit 0
