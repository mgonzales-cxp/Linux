#!/bin/bash
# update_hostname.sh

# Include header
source /usr/src/IT_Files/Linux/config/main/header_colorpaths.sh

# Read exts from text file
FILE=/usr/src/IT_Files/Linux/logs/hostname_update_exts.txt
exec 3<&0
exec 0<$FILE
while read line
do
	if [[ "$ext" == "$line" ]] && [ ! -f /var/log/hostname_update.flag ]; then
		echo "Be sure to remove updated extensions from Univention."
		sleep 3
		cp /usr/src/IT_Files/Linux/seeds/blacklist/hosts /etc/
		echo "C$ext" > /etc/hostname
		sed -i "/127.0.1.1	tech/c\127.0.1.1 C$ext" /etc/hosts
		touch /var/log/aet.flag
		touch /var/log/install_univention.flag
		# RUN UNIVENTION FLAG SCRIPT
		break
	fi
done
exec 0<&3
