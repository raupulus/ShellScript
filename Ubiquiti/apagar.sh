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
## 

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
IP=$(cat ./ip.config)
ubiquiti="root@$IP"

###########################
##       FUNCIONES       ##
###########################
clear


echo -e "$RO Conectando para apagar el dispositivo$AM UBIQUITI"
echo -e "$RO Apagando:$CL"
sleep 1
echo -e "$(ssh $ubiquiti halt) $CL"
echo ""
clear
echo -e "$RO Conectando para apagar el dispositivo$AM UBIQUITI"
echo -e "$AM APAGANDO"
sleep 1
clear
echo -e "$RO Conectando para apagar el dispositivo$AM UBIQUITI"
echo -e "$AM APAGANDO."
sleep 1
clear
echo -e "$RO Conectando para apagar el dispositivo$AM UBIQUITI"
echo -e "$AM APAGANDO..$CL"
sleep 1
clear
echo -e "$RO Conectando para apagar el dispositivo$AM UBIQUITI"
echo -e "$AM APAGANDO...$CL"
sleep 1
