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
## Preparar jaula y puntos de montajes, este script contempla que siempre
## será una partición de que se compone el sistema
##
## Si recibe "-d" o "--desmontar" se desmonta toda la jaula

############################
##       CONSTANTES       ##
############################
WORKSCRIPT=$PWD  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script
VERSION='0.0.1'  ## Primera versión del script
LOGERROR='/tmp/chrooterrores.log'  ## Archivo donde almacenar errores

###########################
##       VARIABLES       ##
###########################
## Punto de montaje, directorio en el que montar la jaula
JAULA='/mnt'

## Partición con el sistema para /
RAIZ='/dev/sda2'

##
## Construye la jaula con los datos dados
##
montarJaula() {
    sudo umount $RAIZ

    ## Montar estructura de la jaula
    sudo mount $RAIZ $JAULA
}

## Enjaular en la ruta indicada
enjaular() {
    if [[ $JAULA = '' ]]; then
        return
    fi

    sudo mount -t proc   proc  ${JAULA}/proc/
    sudo mount -t sysfs  sys   ${JAULA}/sys/
    sudo mount -o bind   /dev/ ${JAULA}/dev
    sudo mount -t devpts pts   ${JAULA}/dev/pts

    sudo chroot $JAULA /bin/bash
    #export PS1="Enjaulado → (chroot) $PS1"
}

##
## Desmonta la jaula
##
desmontar() {
    sudo umount ${JAULA}/proc/
    sudo umount ${JAULA}/sys/
    sudo umount ${JAULA}/dev/pts
    sudo umount ${JAULA}/dev
    sudo umount ${JAULA}
}

if [[ "$1" = '-d' ]] || [[ "$1" = '--desmontar' ]]; then
    desmontar
    exit 0
else
    montarJaula
    enjaular
    exit 0
fi

exit 1
