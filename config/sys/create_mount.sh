#!/bin/bash

# Create IT_Files Mount
if [ ! -d /usr/src/IT_Files ]; then
	echo -e "IT_Files mount doesn't exist. Attempting to create..."
	sleep 2
	sudo mkdir /usr/src/IT_Files
	sudo sed -i '/IT_Files/d' /etc/fstab #Prevents writing extra fstab entries
	sudo echo "//hal2.connexionpoint.com/IT_Files /usr/src/IT_Files cifs guest,uid=1000,iocharset=utf8,nobootwait  0  0" >> /etc/fstab

	sudo mount -a
	sleep 2
	if [ -d /usr/src/IT_Files/Linux ]; then
		clear
		echo "IT_Files mount successfully created."
		sleep 2
	fi
fi	
