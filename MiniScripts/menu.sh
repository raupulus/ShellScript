#!/bin/bash
function MiniScripts_menu() {
	echo -e "$rojo Menú principal de Mini Scripts$gris"
	sleep 1s
	cd $DIR_TRABAJO/MiniScripts

	while true :
		do
			echo ""
			echo -e "$rojo <1>$verde Ver Temperatura del Equipo$gris"
			echo -e "$rojo <0>$verde Volver$gris"
			echo ""


			read -p "Opción elegida + [ENTER]: " MiniScripts_opcion
			case $MiniScripts_opcion in
				1) sh Temperatura.sh&;;
				0) break;;
				*) echo -e "$amarillo Opción inválida elegida";;
			esac
	done
}
