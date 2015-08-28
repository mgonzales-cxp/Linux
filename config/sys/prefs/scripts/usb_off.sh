#!/bin/bash

chmod 000 /media

if [ $? -eq 0 ]; then
	gsettings set org.mate.media-handling automount false
	gsettings set org.mate.media-handling automount-open false

	echo "$(hostname) - $(logname) - $(date) - $(ifconfig | grep "inet addr:192.168") - Mount Access Disabled $1" >> /usr/src/IT_Files/Linux/logs/mount_access.log
	less /var/log/auth.log > /usr/src/IT_Files/Linux/logs/auth/$(hostname).txt
	echo "Mount access off"
else
	echo "$(hostname) - $(logname) - $(date) - $(ifconfig | grep "inet addr:192.168") - Permission Denied $1" >> /usr/src/IT_Files/Linux/logs/mount_access.log
fi
