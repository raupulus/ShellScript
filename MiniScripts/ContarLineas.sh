#!/bin/bash

#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

# Este script contará las líneas de todos los archivos del directorio

TOTAL=0

#Cuenta todas las líneas y las agrego a un array
TMP=`find  -type f -exec wc -l {} \; | cut -d " " -f 1`

#Bucle para recorrer todos los valores de $TMP
for i in $TMP; do
	TOTAL=$(( $TOTAL + $i ))
done
