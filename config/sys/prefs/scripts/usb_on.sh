#!/bin/bash

chmod 755 /media

if [ $? -eq 0 ]; then
	gsettings set org.mate.media-handling automount true
	gsettings set org.mate.media-handling automount-open true
	echo "$(hostname) - $(logname) - $(date) - $(ifconfig | grep "inet addr:192.168") - Mount Access Enabled $1" >> /usr/src/IT_Files/Linux/logs/mount_access.log
	less /var/log/auth.log > /usr/src/IT_Files/Linux/logs/auth/$(hostname).txt
	echo "Mount access on"
else
	echo "$(hostname) - $(logname) - $(date) - $(ifconfig | grep "inet addr:192.168") - Permission Denied $1" >> /usr/src/IT_Files/Linux/logs/mount_access.log
fi
