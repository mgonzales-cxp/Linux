#!/bin/bash

google-chrome </dev/null &>/dev/null &
zoiper </dev/null &>/dev/null &

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

ext=$(hostname)
user=$(logname)
ip=$(hostname -I)

# hostname | grep "tech-VirtualBox-HQ"
# if [[ "$?" == "0" ]]; then
# 	cat /home/$user/.smbcredentials | grep "$user"
# 	if [[ "$?" != "0" ]]; then
# 		read -p -s "Please enter your Linux password: " password
# 		if [[ "$password" != "" ]]; then
# 			echo "username=$user" > /home/$user/.smbcredentials
# 			echo "password=$password" >> /home/$user/.smbcredentials
# 		fi
# 	fi
# fi

xrandr --output DVI-1 --left-of DVI-0

hostname -I | grep "192.168.208"
if [[ "$?" == "0" ]]; then
	xrandr --output DVI-0 --left-of VGA-0
fi

chattr +i ~/.config/xfce4/desktop/icons*

### Startup Commands

# Try and set Plantronics as default

	pacmd list-sinks | grep "DA45"
	if [ $? -eq 0 ]; then
		pacmd set-default-sink alsa_output.usb-Plantronics_Plantronics_DA45-00-DA45.analog-mono
		pacmd set-default-source alsa_output.usb-Plantronics_Plantronics_DA45-00-DA45.analog-mono
	else
		pacmd set-default-sink alsa_output.usb-Plantronics_Plantronics_DA40-00-DA40.analog-mono
		pacmd set-default-source alsa_input.usb-Plantronics_Plantronics_DA40-00-DA40.analog-mono	
	fi
	
# Check for DRx Scraper

	if [ ! -f /var/log/drx_scraper.flag ] && [ -f /var/log/aet.flag ] && [ ! -f /var/log/wlp.flag ] && [ ! -f /var/log/training.flag ]; then
		clear
		echo -e "$COL_RED PLEASE READ! MISSING DRX SCRAPER! $COL_RESET"
		echo "This computer is missing an essential update that must be installed immediately."
		echo "Please notify a tech ASAP as this station will log off momentarily!"
		echo "DRx Scraper is missing." > $HOME/.scraper.log
		echo "$ext" > $HOME/.scraper.log
		sleep 300
		service mdm force-reload
	fi	

# Check for install_univention.flag

	if [ -f /var/log/install_univention.flag ]; then
		clear
		echo -e "$COL_RED IMPORTANT UPDATE IS BEING INSTALLED.$COL_RESET"
		echo "Please wait while the update is installed."
		echo "Your computer will reboot momentarily."
		sleep 300
	fi

# Check for bad hostname

	FILE=/usr/src/IT_Files/Linux/logs/bad_names.txt
	# read $FILE using the file descriptors
	exec 3<&0
	exec 0<$FILE
	while read line
	do
		#use $line variable to process line
		if [[ "$ext" == $line ]]; then
			clear
			echo "Computer name: $ext"
			echo "It looks like the computer name is incorrect and needs to be fixed. Please call for a tech."
			sleep 30
		fi
		#echo $line
	done
	exec 0<&3


	test_ip=192.168.0.107
	if [[ $ip =~ $test_ip ]]; then
		clear
		echo "Test IP assigned successfully"
		sleep 1
		current_ext=$(cat /home/tagent/.ext)
		echo $current_ext
		echo $ext
		if [[ $current_ext != $ext ]]; then
			clear
			seconds=60
			for (( i=$seconds; i > 0; i--))
			do
				clear
				echo -e "Updating your profile on this computer. Please$COL_RED don't$COL_RESET launch any programs until complete. "
			    echo -e "$COL_YELLOW$i$COL_RESET seconds"
			    sleep 1
			done
		fi
	fi

