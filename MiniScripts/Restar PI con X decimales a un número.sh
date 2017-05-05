#!/bin/bash

#Variables Generales
decimales="100" #Cantidad de decimales máxima permitida
numeroArestar="4" #Número al que se le quiere restar PI

##### CONSTANTES COLORES #####
negro="\033[0;30m"
rojo="\033[0;31m"
verde="\033[0;32m"
marron="\033[0;33m"
azul="\033[0;34m"
magenta="\033[0;35m"
cyan="\033[01;36m"
grisC="\033[0;37m"
gris="\033[1;30m"
rojoC="\033[1;31m"
verdeC="\033[1;32m"
amarillo="\033[1;33m"
azulC="\033[1;34m"
magentaC="\033[1;35m"
cyanC="\033[1;36m"
blanco="\033[1;37m"
subrayar="\E[4m"
parpadeoON="\E[5m"
parpadeoOFF="\E[0m"
resaltar="\E[7m"

clear

# Menu
while :
	do
		echo ""
		echo -e "      $amarillo Introduce la cantidad para los decimales de PI "
		echo ""


#Último Menú para salir:
		echo -e "   $rojoC Pulsa 0 para $magentaC Salir"
		echo ""
		echo ""

#Comentario impreso en pantalla donde muestra opciones disponibles a elegir
		echo -e "                   $azulC Introduce un valor:"
		echo ""
		echo ""

	read entrada
	case $entrada in

		0)#Opción 0
			clear
			echo -e "$grisC"
			echo "Nos vemos, ya volverás...."
			echo ""
			exit 1;;

		*)#Cualquier otra opción que no sea las anteriores
			clear;
			if [ $entrada -le $decimales ]; then
				PI=$({ echo -n "scale=$entrada;"; seq 1 2 200 | xargs -n1 -I{} echo '(16*(1/5)^{}/{}-4*(1/239)^{}/{})';} | paste -sd-+ | bc -l)
				echo -e "$azulC El número PI con$rojoC $entrada$azulC decimales:"
				echo -e "$verdeC$PI"
				echo ""
				echo -e "$azulC El número$rojoC $numeroArestar$azulC menos el número PI:"
				echo -e "$rojoC $numeroArestar$azulC -$rojoC $PI"
				echo ""
				RESTA=$(echo $numeroArestar - $PI | bc)
				echo -e "$amarillo RESULTADO =$verdeC 0$RESTA"
				echo ""
				echo -e "$rojoC Pulsa INTRO para volver$gris"
			else
				clear
				echo ""
				echo -e "         $rojoC ERROR - No se ha introducido un valor numérico menor de $decimales"
				echo ""
				echo -e "$rojoC Pulsar $amarillo $entrada  $rojoC no va a conseguir hacer nada porque no es un valor numérico."
				echo ""
				echo ""
				echo -e "          $azulC Pulsa sobre cualquier tecla para volver a probar"
			fi
			echo -e "$grisC"
	read foo;;#Script Realizado por Fryntiz (Raúl Caro Pastorino)
esac
done