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
        echo -e "             $amarillo Programar Apagado o Reinicio $rojo   $version"
        echo ""
        echo -e "   $rojo 1)  $verde Apagar el equipo a una hora concreta"
        echo -e "   $rojo 2)  $verde Reiniciar el equipo a una hora concreta"
        echo -e "   $rojo 3)  $verde Apagar el equipo en XX minutos"
        echo -e "   $rojo 4)  $verde Reiniciar el equipo en XX minutos"
        echo -e "   $rojo 5)  $verde Cancelar cualquier apagado/reinicio que esté programado"
        echo -e "   $rojo 0)  $verde Volver atrás$gris"
        echo ""

    read -p "  → " OPCION
    case $OPCION in

        1)  # Apagar el equipo a una hora concreta
            clear
            read -p "Introduce la hora de apagado (HH:MM) → " $hora
            sudo shutdown -h $hora
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        2)  # Reiniciar el equipo a una hora concreta
            clear
            read -p "Introduce la hora de apagado (HH:MM) → " $hora
            sudo shutdown -r $hora
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        3)  # Apagar el equipo en XX minutos
            clear
            read -p "Introduce la hora de apagado (HH:MM) → " $minutos
            sudo shutdown -h $minutos
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        4)  # Reiniciar el equipo en XX minutos
            clear
            read -p "Introduce la hora de apagado (HH:MM) → " $minutos
            sudo shutdown -r $minutos
            read -p "Pulsa una tecla para continuar" foo
            continue;;

        5)  # Cancelar cualquier apagado/reinicio que esté programado
            clear
            sudo shutdown -c
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
