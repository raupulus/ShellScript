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

# Enjaular en la ruta indicada
function enjaular() {
    while [ $jaula == '' ]
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
