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

#Escanea los puertos internos de la red
echo "Puertos en Local"
nmap -p 1-65535 localhost


#Escanear según la ip del propio equipo
#Esto devuelve los puertos que son visibles desde fuera
#Los puertos desde fuera pueden ser distintos a los de localhost
echo "Puertos desde la red"
#nmap -p 1-65535 $ip




