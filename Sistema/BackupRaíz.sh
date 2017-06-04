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
USERNAME="$(whoami)"
DIR_EXCLUIDOS=""
ARCHIVOS_EXCLUIDOS=""
PASSWORD=""
TMP=""
NOMBRE_BACKUP="Backup-$(date +%Y%m%d).tar"

# Comprobar que está ejecutándose como root
if [ ! $USERNAME == "root" ]; then
	echo "Un backup para la raíz del sistema requiere ser usuario \"root\""
	exit 1
fi
