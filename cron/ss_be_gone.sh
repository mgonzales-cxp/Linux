#!/bin/bash

ext=$(hostname)
user=$(logname)

sudo rm /usr/share/applications/xscreensaver-properties.desktop
touch /var/log/ss_be_gone.log

#ext=$(hostname)
#user=$(logname)

#FILE=/usr/src/IT_Files/Linux/logs/ss.txt
# read $FILE using the file descriptors
#exec 3<&0
#exec 0<$FILE
#while read line
#do
#	#use $line variable to process line
#	if [[ "$ext" == $line ]]; then
#		sudo rm /usr/share/applications/xscreensaver-properties.desktop
#		touch /var/log/ss_be_gone.log
#		echo "$ext ss gone!" >> /usr/src/IT_Files/Linux/logs/test.log
#	else
#		echo "$line No agents within range found."
#	fi
#done
#exec 0<&3

#echo '[Desktop Entry]
#Exec=xscreensaver-demo
#Icon=xscreensaver
#Terminal=false
#Name=Screensaver
#Comment=Change screensaver properties
#Type=Application
#Categories=Settings;DesktopSettings;Security;X-XFCE;
#X-Ubuntu-Gettext-Domain=xscreensaver' >
