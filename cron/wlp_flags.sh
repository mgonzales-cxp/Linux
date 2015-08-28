#!/bin/bash

ext=$(hostname)
user=$(logname)

# Tower 104
FILE=/usr/src/IT_Files/Linux/logs/wlp_exts_slc.txt
# read $FILE using the file descriptors
exec 3<&0
exec 0<$FILE
while read line
do
	if [[ "$ext" == $line ]]; then
			touch /var/log/wlp.flag
			touch /var/log/web1.flag
	fi
done
exec 0<&3

# Roy - DHCP
hostname -I | grep "192.168.19."
if [[ "$?" == "0" ]]; then
	touch /var/log/wlp.flag
fi

# Roy - Static
hostname -I | grep "192.168.17."
if [[ "$?" == "0" ]]; then
	touch /var/log/wlp.flag
fi

# SAT - DHCP
hostname -I | grep "192.168.208."
if [[ "$?" == "0" ]]; then
	touch /var/log/wlp.flag
fi