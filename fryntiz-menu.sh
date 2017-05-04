#!/bin/bash

#VARIABLES
DIR_TRABAJO="/home/fryntiz/1_GIT/3-Fryntiz/ShellScript"


#Entrar en la ruta de trabajo
cd $DIR_TRABAJO

echo ""
echo -e "<1> Entrar al modo edición de este script"
echo -e "<2> Envía commitea los cambios en este repositorio"
echo -e "<3> Subir cambios al repositorio"
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

	*)
		echo "bye"
		;;
esac
