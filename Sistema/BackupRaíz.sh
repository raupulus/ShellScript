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
DIR_EXCLUIDOS=("/home" "/usr/src" "/tmp" "/var/log" "/mnt" "/media" "/proc")
ARCHIVOS_EXCLUIDOS=("lost+found" "Trash" "Cache")
PASSWORD=""
TMP=""
NOMBRE_BACKUP="Backup-$(date +%Y%m%d).tar"

# Comprobar que está ejecutándose como root
if [ ! $USERNAME == "root" ]; then
	echo "Un backup para la raíz del sistema requiere ser usuario \"root\""
	exit 1
fi

# Rellenar lista de exclusiones para directorios
for i in ${DIR_EXCLUIDOS[*]}
do
	TMP="$TMP --exclude=$i"
done

# Añade los valores de TMP de nuevo a DIR_EXCLUIDOS en forma de cadena bien formada
DIR_EXCLUIDOS=$TMP
TMP="" # Resetea la variable temporal

# Rellenar lista de exclusiones para archivos
for i in ${ARCHIVOS_EXCLUIDOS[*]}
do
	TMP="$TMP --exclude=$i"
done

echo
echo "Archivos --> $TMP"
echo
echo "Directorios --> $DIR_EXCLUIDOS"
