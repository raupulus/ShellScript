#!/bin/bash

#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

# Este script permite realizar una copia de seguridad de nuestro directorio home
# Este Backup resultará en un archivo cifrado para cada usuario
# Al tener una copia de seguirdad para cada usuario es más cómodo recuperar un dato
# para ese usuario sin que tenga que ver los datos del resto de usuarios
# Al empaquetar primero en TAR se mantienen permisos y privilegios de usuario:grupo
# Al cifrar en 7z se logra impedir que se vea que contiene y por su puesto el acceso no autorizado

# El funcionamiento del script comienza por introducir donde guardar el backup
# se recomienda guardar el backup en almacenamiento externo a los directorios de usuario (HDD-USB por ejemplo)
# Después se pedirá introducir 2 veces la contraseña de cifrado

############################
##        VARIABLES       ##
############################
USERNAME="$(whoami)"
USUARIOS=`ls /home`
NOMBRE_BACKUP="Backup_HOME-$(date +%Y%m%d).tar"

# Nombres de directorios excluidos dentro del home, ruta relativa dentro del home de usuario
DIR_EXCLUIDOS=("0-MOUNT" "1_GIT" "1-MOUNT" "2_Bases_de_Datos" "3_Librerías" "4_Programas" "5_Entornos_de_Trabajo" "6_Máquinas_Virtuales" "7_Mis_Proyectos" "8_Backups" "9_Dropbox" "10_GoogleDrive" "11_CloudStation" "12_Pentesting" "13_Compartido_Smartphone" "14_CloudStation_Compartido" "Descargas" "NHCK" "PlayOnLinux's\ virtual\ drives" "RastroArtesanal" "repositorio" "TEMPORAL" "temporal" "tmp" "Vídeos" ".cache" ".local/share/Trash" ".PlayOnLinux" ".thumbnails")

# Archivos o directorios excluidos mientras coincida el nombre, estando en cualquier ruta del usuario
ARCHIVOS_EXCLUIDOS=("Backup_HOME-*" ".cache" "cache" "lost+found" "Trash" "Cache" ".trash" "trash" ".Trash-1000")

PASSWORD=""
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

clear

TMP="" # Resetea la variable temporal

# Rellenar lista de exclusiones para archivos
for i in ${ARCHIVOS_EXCLUIDOS[*]}
do
	TMP="$TMP --exclude=\"$i\""
done

# Añadir valores a una cadena
ARCHIVOS_EXCLUIDOS=$TMP
TMP="" # Resetea la variable temporal

# Bucle para añadir cada directorio excluido de cada usuario
for SOY_EL_USUARIO in ${USUARIOS[*]}; do
	# Rellenar lista de exclusiones para directorios
	for i in ${DIR_EXCLUIDOS[*]}
	do
		TMP="$TMP --exclude=\"./$i\""
	done

	# Añade los valores de TMP de nuevo a DIR_EXCLUIDOS en forma de cadena bien formada
	DIR_EXCLUIDOS=$TMP
	TMP="" # Resetea la variable temporal

echo $DIR_EXCLUIDOS
read 

cd "/home/$SOY_EL_USUARIO"

	# Empaquetar en tar
	tar -cvf $RUTA_DESTINO/$SOY_EL_USUARIO$NOMBRE_BACKUP -C /home/$SOY_EL_USUARIO . $DIR_EXCLUIDOS $ARCHIVOS_EXCLUIDOS

	# Comprimir y cifrar en 7z (-mhe=on activa cifrado de encabezado, más seguridad)
	7z a $RUTA_DESTINO/$SOY_EL_USUARIO$NOMBRE_BACKUP.7z -mhe=on -p$PASSWORD $RUTA_DESTINO/$SOY_EL_USUARIO$NOMBRE_BACKUP

	# Borrar empaquetado TAR
	rm $RUTA_DESTINO/$SOY_EL_USUARIO$NOMBRE_BACKUP
done

exit 0
