#!/bin/bash

#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

# Este script permite realizar una copia de seguridad de nuestro sistema completo
# El resultado será un archivo comprimido y empaquetado en .tar.bz2

############################
##        VARIABLES       ##
############################
USERNAME="$(whoami)"
NOMBRE_BACKUP="Backup_$(date +%Y%m%d).tar"

# Nombres de directorios excluidos dentro del home, ruta relativa dentro del home de usuario
DIR_EXCLUIDOS=("proc" "mnt" "sys" "media" "tmp" "var/log" "TEMPORAL" "temporal" "tmp" ".cache" ".local/share/Trash" ".PlayOnLinux" ".thumbnails")

# Archivos o directorios excluidos mientras coincida el nombre, estando en cualquier ruta del usuario
ARCHIVOS_EXCLUIDOS=("Backup_*" ".cache" "cache" "lost+found" "Trash" "Cache" ".trash" "trash" ".Trash-1000")

TMP=""
RUTA_DESTINO=""

clear

read -p "Introduce donde guardar el Backup --> " RUTA_DESTINO

# Rellenar lista de exclusiones para archivos
for i in ${ARCHIVOS_EXCLUIDOS[*]}
do
	TMP="$TMP --exclude=\"$i\""
done

# Añadir valores a una cadena
ARCHIVOS_EXCLUIDOS=$TMP
TMP="" # Resetea la variable temporal

# Bucle para añadir cada directorio excluido de cada usuario
# Rellenar lista de exclusiones para directorios
for i in ${DIR_EXCLUIDOS[*]}
do
	TMP="$TMP --exclude=\"./$i\""
done

# Añade los valores de TMP de nuevo a DIR_EXCLUIDOS en forma de cadena bien formada
DIR_EXCLUIDOS=$TMP
echo $DIR_EXCLUIDOS
read -p "Pulsa Intro para Iniciar"

# Empaquetar en tar.bz2
tar -cvpjf $RUTA_DESTINO/$NOMBRE_BACKUP $DIR_EXCLUIDOS $ARCHIVOS_EXCLUIDOS /

exit 0
