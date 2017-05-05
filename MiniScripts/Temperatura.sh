#!/bin/bash
#Monitor de temperatura
clear
while [ 0 -le 1 ]
do
	time sensors
	sleep 3s
	echo -e "Tiempo encendido --> " ${uptime}
	clear
done
