#!/bin/bash

### NAME UPDATE / BLACKLIST UPDATE ###

echo ""
echo "Hostname is: "$(hostname)
echo "Username is: "$(logname)
echo "-----------------------------------"
echo ""
read -p "Update hostname? This must be done at least once(y/n) " answer

if [[ "$answer" == "y" ]]; then
	cp /usr/src/IT_Files/Linux/seeds/blacklist/hosts /etc/
	read -p "Enter extension only: " ext
	echo "C$ext" > /etc/hostname
	sed -i "/127.0.1.1	tech/c\127.0.1.1 C$ext" /etc/hosts
	echo "Name change will take effect after logging out and back in."
	sleep 3
fi
