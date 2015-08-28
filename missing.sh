#!/bin/bash

#Missing
#-------
#Updates
#Name Update
#Installs
#Firewall
#VNC config
#BASH Update
#AlienVault
#Setup CRON
#Install Univention
#DNS Fix
#Restart

# Updates

	sudo apt-get update

	DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

# Installs

	apt-get install openssh-server vim xclip qpdfview x11vnc google-chrome-stable

# Firewall

	ufw enable
	ufw allow 5901
	usf allow 22
	
# VNC config

	#x11vnc -storepasswd
	
# BASH Update
	
	sudo cp /usr/src/IT_Files/Linux/xfce-uni/preferences/bash.bashrc /etc/
	
# NAO cron

	sed -i '/nao/d' /etc/crontab;
	echo '*/5 * * * * root /usr/src/IT_Files/Linux/cron/nao.sh' >> /etc/crontab
	
# Install AlienVault

#	if [ ! -f /var/log/uni.log ]; then
#		echo ""
#		echo "### Setting up Univention..."
#		echo ""
#		sleep 1
#
#		/usr/src/IT_Files/Linux/univentionClientScript2.sh
#		sleep 1
#	fi
	
# Setup CRON

	gedit /usr/src/IT_Files/Linux/documents/crontab.txt
	sleep 1
	crontab -e

# Install Univention

#	if [ ! -f /var/log/uni.log ]; then
#		echo ""
#		echo "### Setting up Univention..."
#		echo ""
#		sleep 1
#
#		/usr/src/IT_Files/Linux/univentionClientScript2.sh
#	fi
	
# DNS fix

	sudo /usr/src/IT_Files/Linux/satdns.sh
	
# QPDFview

	/usr/src/IT_Files/xfce-uni/preferences/mimelist.sh
	
# Name update

	/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
	
# Restart Desktop Environment

	read -p "System must be rebooted for DESKTOP changes to take effect. Reboot? (y/n) " answer
	if [[ "$answer" == "y" ]]; then	
		echo ""	
		echo "### Rebooting system..."
		sleep 3
		reboot
	else
		exit 0
	fi

