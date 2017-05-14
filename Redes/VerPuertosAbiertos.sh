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
PUERTO_INICIAL=21
PUERTO_FINAL=22
IP=localhost

#function escanear($i) {
#	PUERTO="nmap -p $i -A -v $IP | grep Discovered | tr -s ' ' | cut -d ' ' -f4 | grep ^[0-9]*"
#}

#Escanea los puertos internos de la red
echo -e "Buscando puertos abiertos en modo Local"
for (( i = PUERTO_INICIAL; i<=$PUERTO_FINAL; i++))
do
	PUERTO="nmap -p $i -A -v $IP | grep Discovered | tr -s ' ' | cut -d ' ' -f4 | grep ^[0-9]*"
	echo "Puerto abierto --> `eval $PUERTO`"
done

#Muestra el número de puerto abierto
#PUERTO=`nmap -p $PUERTO_INICIAL'-'$PUERTO_FINAL -A -v $IP | grep Discovered | tr -s ' ' | cut -d ' ' -f4 | grep ^[0-9]* | cut -d '/' -f1 | tr -s ' '`

#Muestra el tipo de puerto UTP o TCP
#TIPO=`nmap -p $PUERTO_INICIAL'-'$PUERTO_FINAL -A -v $IP | grep Discovered | tr -s ' ' | cut -d ' ' -f4 | grep ^[0-9]* | cut -d '/' -f2`

#echo $PUERTO

#echo "El puerto es ${PUERTO[0]} y el tipo es ${TIPO[0]}"




#Escanear según la ip del propio equipo
#Esto devuelve los puertos que son visibles desde fuera
#Los puertos desde fuera pueden ser distintos a los de localhost
echo "Puertos desde la red"
echo -e "Buscando puertos abiertos en modo Local"
for (( i = PUERTO_INICIAL; i<=$PUERTO_FINAL; i++))
do
	PUERTO="nmap -p $i -A -v $IP | grep Discovered | tr -s ' ' | cut -d ' ' -f4 | grep ^[0-9]*"
	echo "Puerto abierto --> `eval $PUERTO`"
done



################## IDEAS DE FUTURO ########################
<<COMMENT
Mostrar tabla con información clara tanto desde punto de vista local como remoto
Mostrar de forma clara cada puerto abierto
Mostrar de forma clara el sistema operativo
COMMENT

