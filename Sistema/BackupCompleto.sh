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
NOMBRE_BACKUP="Backup_$(date +%Y%m%d).tar.bz2"

# Nombres de directorios excluidos. Se comienza desde la raíz (/)
DIR_EXCLUIDOS=("proc" "mnt" "sys" "media" "tmp" "var/log" ".cache" "root/.cache" "root/.local/share/Trash")

# Archivos o directorios excluidos mientras coincida el nombre
ARCHIVOS_EXCLUIDOS=("Backup_*" ".cache" "lost+found" "Trash" "Cache" ".trash" ".Trash-1000" ".Trash-1001" ".thumbnails" "TEMPORAL" "temporal" "tmp")

TMP=""
RUTA_DESTINO=""

clear

# Comprobar que está ejecutándose como root
if [ $USERNAME != "root" ]; then
	echo "Un backup para la raíz del sistema requiere ser usuario \"root\""
	exit 1
fi 2> /dev/null

read -p "Introduce donde guardar el Backup --> " RUTA_DESTINO

# Rellenar lista de exclusiones para archivos
for i in ${ARCHIVOS_EXCLUIDOS[*]}
do
	TMP="$TMP --exclude=$i"
done

# Añadir valores a una cadena
ARCHIVOS_EXCLUIDOS=$TMP
TMP="" # Resetea la variable temporal

# Bucle para añadir cada directorio excluido de cada usuario
# Rellenar lista de exclusiones para directorios
for i in ${DIR_EXCLUIDOS[*]}
do
	TMP="$TMP --exclude=/$i"
done

# Añade los valores de TMP de nuevo a DIR_EXCLUIDOS en forma de cadena bien formada
DIR_EXCLUIDOS=$TMP
echo "Los directorios excluidos son: $DIR_EXCLUIDOS"
echo "Los archivos excluidos son: $ARCHIVOS_EXCLUIDOS"
echo ""
echo "El comando a ejecutar es el siguiente:"
echo "tar -cvpjf $RUTA_DESTINO/$NOMBRE_BACKUP $DIR_EXCLUIDOS $ARCHIVOS_EXCLUIDOS /"
echo ""
read -p "Pulsa Intro para Iniciar"

# Empaquetar en tar.bz2
tar -cvpjf $RUTA_DESTINO/$NOMBRE_BACKUP $DIR_EXCLUIDOS $ARCHIVOS_EXCLUIDOS /

exit 0
