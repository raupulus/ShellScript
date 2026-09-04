#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      public@raupulus.dev
## @web        https://raupulus.dev
## @github     https://github.com/raupulus
## @gitlab     https://gitlab.com/raupulus
## @twitter    https://twitter.com/raupulus
##
##             Guía de estilos aplicada:
## @style      https://github.com/raupulus/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Mostrar temperatura cada un tiempo determinado

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

ESPERA='7s'

clear
while true :
do
    time sensors
    echo ""
    echo -e "Tiempo encendido --> " $(uptime)
    echo ""
    sleep "$ESPERA"
    clear
done
