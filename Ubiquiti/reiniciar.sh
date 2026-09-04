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

echo -e "$RO Conectando a la IP:$AM $IP"
echo -e "$VE Espere un momento mientras conecta."
sleep 1
clear
echo -e "$RO Conectando a la IP:$AM $IP"
echo -e "$VE Espere un momento mientras conecta.."
sleep 1
clear
echo -e "$RO Conectando a la IP:$AM $IP"
echo -e "$VE Espere un momento mientras conecta..."
sleep 1
clear
echo -e "$RO Conectando a la IP:$AM $IP"
echo -e "$VE Espere un momento mientras conecta...."
clear
echo -e "$RO Conectando a la IP:$AM $IP"
ssh $ubiquiti reboot
echo -e "$VE Se ha enviado la petición de reinicio"
echo -e "$VE Comando ejecutado: ssh $AM $ubiquiti reboot $CL"
