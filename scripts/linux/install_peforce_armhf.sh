#!/bin/bash

mkdir ~/Downloads
cd ~/Downloads
wget ftp://ftp.perforce.com/perforce/r16.1/bin.linux26armhf/p4d
wget ftp://ftp.perforce.com/perforce/r16.1/bin.linux26armhf/p4
chmod +x p4d p4
if [ $EUID != 0 ]; then
	sudo mv p4d p4 /usr/local/bin/ -v
fi
