#!/bin/bash

#Thanks to ich777 for this Wine config
export WINEARCH=win64
export WINEPREFIX=/servers/geserver/WINE64
echo "---Checking if WINE workdirectory is present---"
if [ ! -d /servers/geserver/WINE64 ]; then
	echo "---WINE workdirectory not found, creating please wait...---"
    mkdir /servers/geserver/WINE64
else
	echo "---WINE workdirectory found---"
fi
echo "---Checking if WINE is properly installed---"
if [ ! -d /servers/geserver/WINE64/drive_c/windows ]; then
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
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' wine64 ./srcds.exe -console -game gesource +map ${MAP}