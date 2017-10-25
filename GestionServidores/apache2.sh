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
        echo -e "             $amarillo Apache2 $rojo   $version"
        echo ""
        echo -e "   $rojo 1)  $verde Deshabilitar del inicio"
        echo -e "   $rojo 2)  $verde Habilitar en el inicio"
        echo -e "   $rojo 3)  $verde Apagar"
        echo -e "   $rojo 4)  $verde Encender"
        echo -e "   $rojo 5)  $verde Reiniciar"
        #echo -e "   $rojo 6)  $verde Reinicio Seguro"
        echo -e "   $rojo 0)  $verde Volver atrás$gris"
        echo ""

    read -p "  → " OPCION
    case $OPCION in

        1)  # Deshabilitar del inicio
            clear
            sudo systemctl disable apache2
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        2)  # Habilitar al inicio
            clear
            sudo systemctl enable apache2
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        3)  # Apagar
            clear
            sudo systemctl stop apache2
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        4)  # Encender
            clear
            sudo systemctl start apache2
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        5)  # Reiniciar
            clear
            sudo systemctl restart apache2
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        6)  # Reinicio Seguro
            clear
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
