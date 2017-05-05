#!/bin/bash

#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

############################
##   Constantes Colores   ##
############################
amarillo="\033[1;33m"
rojo="\033[1;31m"
verde="\033[1;32m"
magenta="\033[1;35m"
azul="\033[1;34m"
blanco="\033[1;37m"
gris="\033[0;37m"

#############################
##   Variables Generales   ##
#############################
DIR_TRABAJO="/home/fryntiz/1_GIT/3-Fryntiz/ShellScript"

#############################
##    ARCHIVOS EXTERNOS    ##
#############################
source $DIR_TRABAJO/Apuntes/menu.sh
source $DIR_TRABAJO/MiniScripts/menu.sh
source $DIR_TRABAJO/Pentesting/menu.sh
source $DIR_TRABAJO/Ubiquiti/menu.sh

#############################
##         VERSIÓN         ##
#############################
#Limpia pantalla para mostrar la versión un instante
clear
VERSION=$(cat $DIR_TRABAJO/version)
echo -e "
$rojo
            #############################
            ## $amarillo$VERSION$rojo ##
            #############################
$gris
"
sleep 4

############################
##     EDITAR SCRIPTS     ##
############################
# Esta función permite editar el script principal
# Incluye hacer commit y subir a los repositorios
function editar() {
	while true :
		do
			clear
			echo ""
			echo -e "$azul ############# MENÚ EDITAR #############"
			echo -e "$rojo <1>$verde Commit con los cambios en este repositorio$gris"
			echo -e "$rojo <2>$verde Subir cambios al repositorio$gris"
			echo -e "$rojo <3>$verde Editar este script$gris"
			echo -e "$rojo <4>$verde Editar menú Apuntes$gris"
			echo -e "$rojo <5>$verde Editar menú Mini Scripts$gris"
			echo -e "$rojo <6>$verde Editar menú Pentesting$gris"
			echo -e "$rojo <7>$verde Editar menú Ubiquiti$gris"
			echo -e "$rojo <x>$amarillo Posiciona en la raíz del repositorio$gris"
			echo -e "$rojo <0>$verde Volver al menú Principal$gris"
			echo ""

			read -p "Opción elegida + [ENTER]: " opcion
			case $opcion in
				1) echo "Introduce el comentario para el commit"
				   read comentario
				   cd $DIR_TRABAJO
				   git add *
				   git commit -m "$comentario"
				   ;;
				2) time git push;;
				3) nano -w $DIR_TRABAJO/fryntiz-menu.sh;;
				4) nano -w $DIR_TRABAJO/Apuntes/menu.sh;;
				5) nano -w $DIR_TRABAJO/MiniScripts/menu.sh;;
				6) nano -w $DIR_TRABAJO/Pentesting/menu.sh;;
				7) nano -w $DIR_TRABAJO/Ubiquiti/menu.sh;;
				x) cd $DIR_TRABAJO
				   clear
				   pwd
				   ls -Al
				   exit 1;;
				0) break;;
				*) echo -e "La opción introducida no es correcta";;
			esac
	done
}

############################
##     MENÚ PRINCIPAL     ##
############################
while true; do
	clear
	echo ""
	echo -e "$azul ############# MENÚ PRINCIPAL #############"
	echo -e "$rojo <1>$verde Editar scripts$gris"
	echo -e "$rojo <2>$verde Menú Apuntes$gris"
	echo -e "$rojo <3>$verde Menú Mini Scripts$gris"
	echo -e "$rojo <4>$verde Menú Pentesting$gris"
	echo -e "$rojo <5>$verde Menú Ubiquiti$gris"
	echo -e "$rojo <0>$verde Salir del programa$gris"

	read principal

	case $principal in
		1) editar;; #Llama a la función que contiene el menú para editar, especificada justo arriba
		2) Apuntes_menu;; #Abre el menú Apuntes
		3) MiniScripts_menu;; #Abre el menú Mini Scripts
		4) Pentesting_menu;; #Abre el menú Pentesting
		5) Ubiquiti_menu;; #Abre el menú Ubiquiti
		0) exit 1;; #Salir del programa
		*) echo -e "$amarillo Entrada no válida$gris";;
	esac
done

