#!/bin/bash
#Monitor de temperatura
clear
while true :
do
	time sensors
	echo ""
	echo -e "Tiempo encendido --> " $(uptime)
	echo ""
	sleep 7s
	clear
done
