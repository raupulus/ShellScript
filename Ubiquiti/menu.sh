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

WORKSCRIPT=$PWD  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script
VERSION='0.8.2'  ## Versión en desarrollo
LOGERROR="$WORKSCRIPT/errores.log"  ## Archivo donde almacenar errores
DEBUG=false      ## Establece si está el script en modo depuración
###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################
function Ubiquiti_menu() {
    echo -e "$RO Menú principal de Ubiquiti$CL"
    sleep 1s
    #cd $WORKSCRIPT/Ubiquiti || exit 1
    
    while true :
        do
            echo ""
            echo -e "$RO <1>$VE Establecer IP sobre la cual actuar$CL"
            echo -e "$RO <2>$VE Apagar$CL"
            echo -e "$RO <3>$VE Encender$CL"
            echo -e "$RO <4>$VE Ping$CL"
            echo -e "$RO <5>$VE Redes Disponibles$CL"
            echo -e "$RO <6>$VE Reiniciar$CL"
            echo -e "$RO <0>$VE Volver$CL"
            echo ""
    
    
            read -p "Opción elegida + [ENTER]: " ubiquiti_opcion
            case $ubiquiti_opcion in
                1) echo -e "$AM Inserta la IP de la antena Ubiquiti:$CL"
                   read ip_ubiquiti
                   echo $ip_ubiquiti > $WORKSCRIPT/Ubiquiti/ip.config;;
                2) sh apagar.sh&;;
                3) sh $WORKSCRIPT/Ubiquiti/encender.sh&;;
                4) sh ping.sh;;
                5) sh $WORKSCRIPT/Ubiquiti/redesDisponibles.sh&;;
                6) sh $WORKSCRIPT/Ubiquiti/reiniciar.sh&;;
                0) break;;
                *) echo -e "$AM Opción inválida elegida";;
            esac
    done
}
