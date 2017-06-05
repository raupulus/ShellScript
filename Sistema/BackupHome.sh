#!/bin/bash

#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

############################
##        VARIABLES       ##
############################
USERNAME="$(whoami)"
NOMBRE_BACKUP="Backup_HOME-$(date +%Y%m%d).tar"
DIR_EXCLUIDOS=("0-MOUNT" "1_GIT" "1-MOUNT" "2_Bases_de_Datos" "3_Librerías" "4_Programas" "5_Entornos_de_Trabajo" "6_Máquinas_Virtuales" "7_Mis_Proyectos" "8_Backups" "9_Dropbox" "10_GoogleDrive" "11_CloudStation" "12_Pentesting" "13_Compartido_Smartphone" "14_CloudStation_Compartido" "Descargas" "Documentos" "Imágenes" "NHCK" "PlayOnLinux's virtual drives" "RastroArtesanal" "repositorio" "TEMPORAL" "temporal" "tmp" "Vídeos" ".PlayOnLinux" ".local/share/Trash*")
ARCHIVOS_EXCLUIDOS=("Backup_HOME-*" ".cache" "cache" "lost+found" "Trash" "Cache" ".trash" "trash")
PASSWORD="none"
TMP=""
RUTA_DESTINO=""

clear

read -p "Introduce donde guardar el Backup --> " RUTA_DESTINO

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
	TMP="$TMP --exclude=\"$i\""
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
tar -cpf $RUTA_DESTINO/$NOMBRE_BACKUP -C /home/$USERNAME/* $DIR_EXCLUIDOS $ARCHIVOS_EXCLUIDOS

# Comprimir y cifrar en 7z (-mhe=on activa cifrado de encabezado, más seguridad)
7z a $RUTA_DESTINO/$NOMBRE_BACKUP.7z -mhe=on -p$PASSWORD $RUTA_DESTINO/$NOMBRE_BACKUP

# Borrar empaquetado TAR de /tmp
rm $RUTA_DESTINO/$NOMBRE_BACKUP

exit 0
