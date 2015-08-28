#!/bin/bash

### CRON Updates ### Runs at 3 AM ###
	
	# apt-get update
	# TEMP UPDATE: install xclip and opera
	# Update time
	# Copy bash.bashrc for aliases
	# TEMP: copy PDFs
	# Turn on firewall
	# Add rule 5901 to firewall
	# Add rule 22 to firewall
	# Turn off USB access
	# Write auth.log to log on file server
	# Update ClamAV
	# Scan / recursively, only show infected, and write to log. Excludes HAL mounts.
	# Stream editor to remove scan summary
	# Silent dist-upgrade
	# Pause 30 seconds
	# Reboot

	(apt-get update;
	apt-get install opera xclip;  
	ntpdate time.nist.gov; 
	cp /usr/src/IT_Files/Linux/xfce-uni/preferences/bash.bashrc /etc/;
	/usr/src/IT_Files/Linux/cron/pdf_copy.sh;
	ufw enable;
	ufw allow 5901;
	usf allow 22;
	/usr/src/IT_Files/Linux/usb_off.sh "- nightly"; 
	less /var/log/auth.log > /usr/src/IT_Files/Linux/logs/auth/$(hostname).txt;
	freshclam;
	echo "$(hostname) - $(logname) - $(date) $(ifconfig | grep "inet addr:192.168")" >> /usr/src/IT_Files/Linux/logs/clamav.log;
	clamscan -ri --exclude-dir=/usr/src/IT_Files --exclude-dir=/usr/src/Aetna_Files --exclude-dir=/usr/src/Coventry_Files --exclude-dir=/usr/src/WLP_Info --exclude-dir=/usr/src/AnthemExtrasWritablePDFFiles --exclude-dir=/usr/src/CompletedAnthemExtrasPDFFiles / >> /usr/src/IT_Files/Linux/logs/clamav.log;
	/usr/src/IT_Files/Linux/cron/seds.sh;
	DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade;
	sleep 30;
	reboot)
