#!/bin/bash

#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

# El objetivo de este script es crear una copia de seguridad de todo el sistema
# menos del directorio home que contiene a los usuarios ya que es común que se
# realice más a menudo el backup de usuarios (o al revés) además este script
# empaqueta primero en formato "tar" y luego comprime y cifra en formato "7z"
# garantizando privilegios, permisos de usuario y grupo además de garantizar
# una enorme seguridad en el archivo final resultante cifrado.

# Para recuperar un backup previo --> 7z x Backup-*.tar.7z && tar xf Backup-*.tar

############################
##        VARIABLES       ##
############################
USERNAME="$(whoami)"
DIR_EXCLUIDOS=("/home" "/usr/src" "/tmp" "/var/log" "/mnt" "/media" "/proc")
ARCHIVOS_EXCLUIDOS=("lost+found" "Trash" "Cache" "cache" "trash")
PASSWORD="1"
TMP="1"
NOMBRE_BACKUP="Backup-$(date +%Y%m%d).tar"
RUTA_DESTINO="/tmp"

clear

# Comprobar que está ejecutándose como root
if [ ! $USERNAME == "root" ]; then
	echo "Un backup para la raíz del sistema requiere ser usuario \"root\""
	exit 1
fi

# Pedir contraseña de cifrado
echo "Introduce la contraseña para cifrar el Backup"
# read PASSWORD

# Volver a introducir contraseña de cifrado
echo "Vuelve a introducir la contraseña de cifrado"
# read TMP

# Comprobar que PASSWORD y TMP son iguales
if [ $PASSWORD != $TMP ]; then
	echo "Las contraseñas introducidas no coinciden"
	exit 1
fi

TMP="" # Resetea la variable temporal

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
	TMP="$TMP --exclude=\"$i\""
done

# Añadir valores a una cadena
ARCHIVOS_EXCLUIDOS=$TMP
TMP="" # Resetea la variable temporal

echo
echo "Archivos --> $ARCHIVOS_EXCLUIDOS"
echo
echo "Directorios --> $DIR_EXCLUIDOS"
echo

#Empaquetar en tar guardándolo dentro de /tmp
echo "tar -cf /tmp/$NOMBRE_BACKUP -C / $DIR_EXCLUIDOS $ARCHIVOS_EXCLUIDOS"

#Comprimir y cifrar en 7z (-mhe=on activa cifrado de encabezado)
echo "7z a /tmp/$NOMBRE_BACKUP.7z -mhe=on -p$PASSWORD $RUTA_DESTINO/$NOMBRE_BACKUP.7z"
