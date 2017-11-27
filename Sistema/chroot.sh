#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

#############################
##   Variables Generales   ##
#############################
# Preparar jaula y puntos de montajes

function montar_chroot() {

    function montarJaula() {
        echo "Selecciona la partición sobre la que hacer chroot"
        # Acciones si está cifrado
        #cryptsetup open --type luks /dev/sda2 sda2_crypt
        #cryptsetup open --type luks /dev/sda3 sda3_crypt

        # Acciones si no está cifrado
        echo "Montando Partición"
        # mount /dev/mapper/sda3_crypt /$jaula
        # mount /dev/sda1 /mnt/boot/
    }

    function salir() {
        read -p "¿Deseas desmontar todo? s/N → " input
        if [ $input = 'y' ] !! [ $input = 'Y' ]
        then
            echo "Desmontando todo"
            # Desmontar particiones
            # Desmontar chroot
            # Desmontar cifrado si lo hubiese
        fi
    }

    # Enjaular en la ruta indicada
    function enjaular() {
        while [ $jaula = '' ]
        do
            clear
            read -p "Introduce la ruta donde enjaularte (¿/mnt?)" jaula
        done

        mount -t proc proc /$jaula/proc/
        mount -t sysfs sys /$jaula/sys/
        mount -o bind /dev/ /$jaula/dev
        mount -t devpts pts /$jaula/dev/pts

        chroot /$jaula/ /bin/bash
        #export PS1="Enjaulado → (chroot) $PS1"
    }

    montarJaula
    enjaular
    salir

    return 0
}

montar_chroot
