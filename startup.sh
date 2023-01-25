#!/bin/bash

#Thanks to ich777 for a lot of the content in this script

echo "---Ensuring UID: 99 matches user---"
usermod -u 99 steam
echo "---Ensuring GID: 100 matches user---"
groupmod -g 100 steam > /dev/null 2>&1 ||:
usermod -g 100 steam
echo "---Setting umask to 000---"
umask 000

echo "---Taking ownership of data...---"
chown -R 99:100 /servers/geserver

su steam -c "/server.sh"