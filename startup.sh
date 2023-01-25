#!/bin/bash

#Thanks to ich777 for this Wine config
export WINEARCH=win64
export WINEPREFIX=/servers/geserver/WINE
echo "---Checking if WINE workdirectory is present---"
if [ ! -d /servers/geserver/WINE ]; then
	echo "---WINE workdirectory not found, creating please wait...---"
    mkdir /servers/geserver/WINE
else
	echo "---WINE workdirectory found---"
fi
echo "---Checking if WINE is properly installed---"
if [ ! -d /servers/geserver/WINE/drive_c/windows ]; then
	echo "---Setting up WINE---"
    cd /servers/geserver
    winecfg > /dev/null 2>&1
    sleep 15
else
	echo "---WINE properly set up---"
fi
echo "---Checking for old display lock files---"
find /tmp -name ".X99*" -exec rm -f {} \; > /dev/null 2>&1
echo "---Server ready---"

echo "---Start Server---"
cd /servers/geserver
Xvfb :99 & export DISPLAY=:99
wine64 start srcds.exe -console -game gesource +maxplayers ${MAXPLAYERS} +map ${MAP}