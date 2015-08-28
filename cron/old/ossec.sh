#!/bin/bash

ext=$(hostname)
user=$(logname)

#FILE=/usr/src/IT_Files/Linux/logs/ossec_test.txt
## read $FILE using the file descriptors
#exec 3<&0
#exec 0<$FILE
#while read line
#do
#	#use $line variable to process line
#	if [[ "$ext" == $line ]]; then
#		/usr/src/IT_Files/Linux/install_ossec.sh
#		touch /var/log/ossec-installed-towersensor.flag
#		echo "$ext ossec installed" >> /usr/src/IT_Files/Linux/logs/test.log
#	else
#		echo "$line No agents within range found."
#	fi
#done
#exec 0<&3

hostname -I | grep "192.168.209"
if [ $? -eq 0 ]; then
	/usr/src/IT_Files/Linux/install_ossec.sh
	touch /var/log/ossec-installed-towersensor.flag
	echo "$ext ossec installed" >> /usr/src/IT_Files/Linux/logs/test.log
fi
