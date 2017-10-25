#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

#############################
##   Variables Generales   ##
#############################

# Menu
while :
    do
        clear

        echo ""
        echo -e "             $amarillo Gestion Servicios $rojo   $version"
        echo ""
        echo -e "   $rojo 1)  $verde Apache2"
        echo -e "   $rojo 2)  $verde SSH"
        echo -e "   $rojo 3)  $verde VNC"
        echo -e "   $rojo 0)  $verde Volver atrás$gris"
        echo ""

    read -p "  → " OPCION
    case $OPCION in

        1)  # APACHE 2
            clear
            . apache2.sh
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        2)  # SSH
            clear
            . ssh.sh
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        3)  # VNC
            clear
            . vnc.sh
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        0)  # Volver Atrás
            clear
            break;;

        *)  # Cualquier otra opción que no sea las anteriores
            clear
            echo ""
            echo -e "$rojo La opción elegida no es válida$amarillo introduce otra"
            read -p "Pulsa una tecla para continuar" foo;;
    esac
done
