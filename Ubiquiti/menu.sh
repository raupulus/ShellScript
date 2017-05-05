#!/bin/bash
function Ubiquiti_menu() {
	echo -e "$rojo Menú principal de Ubiquiti$gris"
	sleep 1s
	cd $DIR_TRABAJO/Ubiquiti

	while true :
		do
			echo ""
			echo -e "$rojo <1>$verde Establecer IP sobre la cual actuar$gris"
			echo -e "$rojo <2>$verde Apagar$gris"
			echo -e "$rojo <3>$verde Encender$gris"
			echo -e "$rojo <4>$verde Ping$gris"
			echo -e "$rojo <5>$verde Redes Disponibles$gris"
			echo -e "$rojo <6>$verde Reiniciar$gris"
			echo -e "$rojo <0>$verde Volver$gris"
			echo ""


			read -p "Opción elegida + [ENTER]: " ubiquiti_opcion
			case $ubiquiti_opcion in
				1) echo -e "$amarillo Inserta la IP de la antena Ubiquiti:$gris"
				   read ip_ubiquiti
				   echo $ip_ubiquiti > $DIR_TRABAJO/Ubiquiti/ip.config;;
				2) sh apagar.sh&;;
				3) sh $DIR_TRABAJO/Ubiquiti/encender.sh&;;
				4) sh ping.sh;;
				5) sh $DIR_TRABAJO/Ubiquiti/redesDisponibles.sh&;;
				6) sh $DIR_TRABAJO/Ubiquiti/reiniciar.sh&;;
				0) break;;
				*) echo -e "$amarillo Opción inválida elegida";;
			esac
	done
}
