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
azul="\033[1;34m"
blanco="\033[1;37m"
cyan="\033[1;36m"
gris="\033[0;37m"
magenta="\033[1;35m"
rojo="\033[1;31m"
verde="\033[1;32m"

#############################
##   Variables Generales   ##
#############################
PUERTO_INICIAL=0
PUERTO_FINAL=65535
IP=localhost

#Escanea los puertos internos de la red
echo -e "Buscando puertos abiertos en modo Local"
for (( i = $PUERTO_INICIAL; i<=$PUERTO_FINAL; i++))
do
	PUERTO="nmap -p $i -A -v $IP | grep Discovered | tr -s ' ' | cut -d ' ' -f4 | grep ^[0-9]*"
	x=`eval $PUERTO 2>/dev/null`
	y=`echo $x | cut -d '/' -f2`
	x=`echo $x | cut -d '/' -f1`
	if [ $x -eq $i 2>/dev/null ]; then
		echo "Puerto abierto --> $x protocolo --> $y"
	fi
done

#Estoy limitando a la primera, que es la correspondiente a eth0
IP=`ifconfig | grep -e 'eth' -e 'wlan' -e 'inet ' | tr -s ' ' | cut -d ' ' -f3 | cut -d ':' -f2 | grep -e "^[0-9]*.[0-9]*.[0-9]*.[0-9]*$"  | grep -v -e ^127.0.0.1$ -e ^0.0.0.0$ -e ^127.0.0.1$ -e ^255.255.255.255$ | head -n 1`

#Los puertos desde fuera pueden ser distintos a los de localhost
echo "Puertos desde la red"
echo -e "Buscando puertos abiertos en modo Local"
for (( i = $PUERTO_INICIAL; i<=$PUERTO_FINAL; i++))
do
	PUERTO="nmap -p $i -A -v $IP | grep Discovered | tr -s ' ' | cut -d ' ' -f4 | grep ^[0-9]*"
	x=`eval $PUERTO`
	y=`echo $x | cut -d '/' -f2`
	x=`echo $x | cut -d '/' -f1`
	if [ $x -eq $i 2>/dev/null ]; then
		echo "Puerto abierto --> $x protocolo --> $y"
	fi
done


################## IDEAS DE FUTURO ########################
<<COMMENT
Redirigir errores a 2>/dev/null para no mostrar salidas feas
Contador para avisar cada 100 direcciones comprobadas
Contador que almacena la cantidad de puertos abiertos
Sacar el sistema operativo
Sacar la dirección mac
COMMENT
