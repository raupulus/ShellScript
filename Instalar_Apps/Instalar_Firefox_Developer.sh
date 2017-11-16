#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

# Este instalador descarga la última versión de Firefox Quantum
# Posteriormente descomprime e instala
# Como pasos adicionales crea entradas para llamarse desde comando y además
# crea archivos .desktop para ser ejecutados como qualquier aplicación

# Debes tener en cuenta que este script está pensado para instalarlo al usuario
# actual con el que estais ejecutándolo.

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


# Preparar directorios, se crean si no existiesen
if [ ! -d ~/.local/opt ]
then
    mkdir -p ~/.local/opt
fi

if [ ! -d ~/.local/bin ]
then
    mkdir -p ~/.local/bin
fi

if [ ! -d ~/.local/share/applications ]
then
    mkdir -p ~/.local/share/applications
fi


# Firefox Developer Edition
function firefox_developer() {

    function instalar() {
        # Desempaquetar Firefox-Developer_amd64.tar.bz2
        mkdir -p /tmp/Firefox-Developer_amd64 2>> /dev/null
        tar -xjvf /tmp/Firefox-Developer_amd64.tar.bz2 -C /tmp/Firefox-Developer_amd64 2>> /dev/null

        # Mover archivo extraido a su ubicación final
        mv /tmp/Firefox-Developer_amd64/firefox ~/.local/opt/Firefox_Developer 2>> /dev/null

        # Crear enlaces de usuario y permisos de ejecución
        echo "$HOME/.local/opt/Firefox_Developer/firefox" > ~/.local/bin/firefox-developer
        # ln -s ~/.local/opt/Firefox_Quantum_Developer/firefox ~/.local/bin/firefox-quantum 2>> /dev/null
        chmod +x ~/.local/bin/firefox-developer
    }

    if [ -f ~/.local/bin/firefox-developer ]
    then
        echo -e "$verde Ya esta$rojo Firefox Quantum Developer Edition$verde instalado en el equipo, omitiendo paso$gris"
    # Comprueba que no está el archivo descargado en este directorio
elif [ ! -f /tmp/Firefox-Developer_amd64.tar.bz2 ]
    then
        REINTENTOS=50
        echo -e "$verde Descargando$rojo Firefox Quantum Developer Edition$gris"
        for (( i=1; i<=$REINTENTOS; i++ ))
        do
            rm -f /tmp/Firefox-Developer_amd64.tar.bz 2>> /dev/null
            wget --show-progress -r -A tar.bz2 'https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=es-ES' -O /tmp/Firefox-Developer_amd64.tar.bz2 && break
        done
        echo -e "$verde Preparando para instalar$rojo Firefox Developer Edition$gris"

        instalar
    else
        instalar
    fi

    function accesos_Directos() {
        # Acceso directo
        desktop='
            [Desktop Entry]
            Name=Firefox Developer
            Name[es]=Firefox Developer
            Comment=Browse the World Wide Web
            Comment[es]=Navegue por la web
            GenericName=Web Browser
            GenericName[es]=Navegador web
            X-GNOME-FullName=Firefox Developer Web Browser
            X-GNOME-FullName[es]=Navegador web Firefox Developer
            Exec=.local/bin/firefox-developer %u
            Terminal=false
            X-MultipleArgs=false
            Type=Application
            Icon=firefox-developer-icon
            Categories=Network;WebBrowser;
            MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
            StartupWMClass=Firefox-Developer
            StartupNotify=true
            Name[es_ES]=firefox-developer
        '
        # Copiar acceso directo
        cat desktop > ~/.local/share/applications/firefox-developer.desktop 2>> /dev/null
    }

    accesos_Directos
}

# Llamada a la función
firefox_developer
