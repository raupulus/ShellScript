#!/bin/bash

#VARIABLES
DIR_TRABAJO="/home/fryntiz/1_GIT/3-Fryntiz/ShellScript"
rojo="\033[1;31m"
verde="\033[1;32m"
magenta="\033[1;35m"
azul="\033[1;34m"
blanco="\033[1;37m"
gris="\033[0;37m"


#Entrar en la ruta de trabajo
cd $DIR_TRABAJO

while :
	do

		echo ""
		echo -e "$rojo <1>$verde Entrar al modo edición de este script$gris"
		echo -e "$rojo <2>$verde Envía commitea los cambios en este repositorio$gris"
		echo -e "$rojo <3>$verde Subir cambios al repositorio$gris"
		echo -e "$rojo <0>$verde Salir del programa$gris"
		echo ""

		read opcion
		case $opcion in
			1)
				nano fryntiz-menu.sh
				;;

			2)
				echo "Introduce el comentario para el commit"
				read comentario
				git add *
				git commit -m "$comentario"
				;;

			3)
				time git push
				;;

			0)
				exit 1
				;;

			*)
				echo -e "La opción introducida no es correcta"
				;;
		esac
done
