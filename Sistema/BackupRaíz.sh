#!/bin/bash

#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

# Recuperar --> 7z x backup-*.tar.7z && tar xf backup-*.tar

# Directorios excluidos:
# /home
# /usr/src
# /tmp
# /var/log
# /mnt
# /media
# /proc
# "lost+found"
# "Trash"
# "Cache"

############################
##        VARIABLES       ##
############################
DIR_EXCLUIDOS=""
ARCHIVOS_EXCLUIDOS=""

