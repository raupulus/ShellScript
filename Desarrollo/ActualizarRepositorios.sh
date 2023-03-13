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
##
## No se contemplan subdirectorios (En principio no lo veo necesario)
## En la ruta de directorio GIT se indica la "ruta" hacia el directorio padre:
## /ruta/repo/.git
## ya que se buscará en esa ruta si cada directorio en su interior es un repo.

############################
##       CONSTANTES       ##
############################
WORKSCRIPT=$PWD  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script
VERSION='0.0.1'  ## Primera versión del script
LOGERROR='/tmp/chrooterrores.log'  ## Archivo donde almacenar errores

## MODO
# if MODE = relax → solo hace git pull
# if MODE = interactive → pregunta si hacer git pull o descartar cambios
# if MODE = agresive → descarta todos los cambios y luego actualiza
MODE='relax'  ## relax|interactive|agresive

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

##
## Recibe la ruta de un repositorio y lo actualiza
##
updateRepo() {
    dir="$1"
    cd $dir || exit 1

    # if MODE = relax → solo hace git pull
    if [[ $MODE = 'relax' ]]; then
        git pull || echo "Error al actualizar $dir" >> "$LOGERROR"
    fi

    # if MODE = interactive → pregunta si hacer git pull o descartar cambios
    ## No implementado modo
    if [[ $MODE = 'interactive' ]]; then
        git pull ## Detectar si hay fallos y preguntar:
        fallos='false'
        if [[ "$fallos" = 'true' ]]; then
            echo -e "¿Descartar Cambios?"
        fi
    fi

    # if MODE = agresive → descarta todos los cambios y luego actualiza
    if [[ $MODE = 'agresive' ]]; then
        git checkout -- .
        git checkout HEAD
        git pull
    fi

    cd $DIRGIT || exit 1
}

##
## Recorre todos los directorios comprobando si dentro exite un directorio .git
## ya que en este caso supondrá que es un repositorio y lo actualiza.
##
comenzar() {
    cd $DIRGIT || exit

    for dir in *; do
        echo -e "Comprobando si ${dir} es un repositorio"
        if [[ -d "$dir" ]] && [[ -d "${dir}/.git" ]]; then
            echo -e "Actualizando $dir"
            updateRepo "$dir"
        fi
    done

    cd $WORKSCRIPT
}

inputDir "$1"
comenzar

echo -e "Script completado"
exit 0
