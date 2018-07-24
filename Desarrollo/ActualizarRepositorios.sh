#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        www.fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Menú principal para instalar aplicaciones desde el que se permite
## elegir entre los tipos de aplicaciones a instalar desde un menú
## interactivo seleccionando el número que le corresponda

###########################
##       CONSTANTES       ##
############################
WORKSCRIPT=$PWD  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script
VERSION='0.0.1'  ## Primera versión del script
LOGERROR='/tmp/chrooterrores.log'  ## Archivo donde almacenar errores

###########################
##       VARIABLES       ##
###########################
DIRGIT=''  ## Directorio con los repositorios

############################
##       FUNCIONES        ##
############################
##
## Comprueba que se ha indicado un directorio, si no es así lo pedirá y después
## comprobará que existe antes de contirnuar.
##
inputDir() {
    if [[ "$1" != '' ]]; then
        DIRGIT="$1"
    elif [[ "$DIRGIT" = '' ]]; then
        echo -e "Introduce el directorio GIT"
        read -p '  → ' input
        DIRGIT="$input"
    fi

    if [[ "$DIRGIT" = '' ]]; then
        echo -e "No se ha introducido un directorio"
        exit 1
    fi

    if [[ ! -d "$DIRGIT" ]]; then
        echo -e "No existe el directorio indicado"
        exit 1
    fi

    echo -e "El directorio con los repositorios es:"
    echo -e "$DIRGIT"
    echo ''

    return 0
}

inputDir "$1"
exit 0
