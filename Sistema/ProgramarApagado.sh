#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      dev@fryntiz.es
## @web        https://fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
##

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ## Limpiar colores

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################
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
