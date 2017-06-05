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
# Es necesario crear directorios omitidos:
# sudo mkdir /home /media /mnt /proc /run/log /run/media /sys /tmp /usr/src /var/log /var/tmp
# sudo chmod 755 /tmp && sudo chmod 777 -R /tmp/*

############################
##        VARIABLES       ##
############################
USERNAME="$(whoami)"
NOMBRE_BACKUP="Backup-$(date +%Y%m%d).tar"
DIR_EXCLUIDOS=("/Backup" "/home" "/media" "/mnt" "/proc" "/run/log" "/run/media" "/sys" "/tmp" "/usr/src" "/var/log" "/var/tmp")
ARCHIVOS_EXCLUIDOS=("Backup*" ".cache" "cache" "lost+found" "Trash" "Cache" ".trash" "trash")
PASSWORD="none"
TMP=""
RUTA_DESTINO=""

clear

read -p "Introduce donde guardar el Backup --> " RUTA_DESTINO

# Comprobar que está ejecutándose como root
if [ $USERNAME != "root" ]; then
	echo "Un backup para la raíz del sistema requiere ser usuario \"root\""
	exit 1
fi 2> /dev/null

# Pedir contraseña de cifrado
echo "Introduce la contraseña de cifrado con números y letras"
read -p "Contraseña para cifrar --> " PASSWORD
read -p "Repite la Contraseña --> " TMP

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

echo "Comenzará en cuanto pulses intro"
read TMP

# Empaquetar en tar guardándolo dentro de /tmp
tar -cpf /Backup/$NOMBRE_BACKUP -C /* $DIR_EXCLUIDOS $ARCHIVOS_EXCLUIDOS

# Comprimir y cifrar en 7z (-mhe=on activa cifrado de encabezado, más seguridad)
7z a $RUTA_DESTINO/$NOMBRE_BACKUP.7z -mhe=on -p$PASSWORD /Backup/$NOMBRE_BACKUP

# Borrar empaquetado TAR de /tmp
#rm /tmp/$NOMBRE_BACKUP

exit 0
