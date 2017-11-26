#!/bin/bash
# Como primer argumento toma el dispositivo de bloques o el 
# archivo montable que se va a usar, como segundo el punto
# de montaje, el tercer argumento es la shell del chroot
# DEBE USARSE COMO ROOT

echo 'Desea montar la particion en el script? (y/n)';
read a ;
if [ $a = "y"];
then
    echo 'Que particion desea montar?' ;
    read blockdevice ;
fi;
echo 'En que directorio va a ubicar el chroot?';
read mountpoint;
if ["$mountpoint" = ""];
then
    exit 1;
fi;
if ["$a" = "y"];
then
    mount $blockdevice $mountpoint || exit 2;
fi;
a="";
echo 'Desea usar alguna shell especial? (y/n)';
read a;
if [ $a = "y" ];
then
    read shell;
fi;
if [ "$shell" = "" ]
then
    shell = "/bin/bash"; #estandar de facto.
fi
chroot "$mountpoint" "$shell" || exit 3;
    
