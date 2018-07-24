#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      dev@fryntiz.es
## @web        https://fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Este script contará las líneas de todos los archivos del directorio

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ## Limpiar colores

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################
TOTAL=0

## TODO → Solo contar archivos con extensiones válidas a partir de una lista

## Cuenta todas las líneas y las agrego a un array
TMP=`find  -type f -exec wc -l {} \; | cut -d " " -f 1`

## Bucle para recorrer todos los valores de $TMP
for i in $TMP; do
    TOTAL=$(( $TOTAL + $i ))
done

## Mostrar resultado
echo "El total es $TOTAL"

exit 0
