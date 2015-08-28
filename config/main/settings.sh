#!/bin/bash


function Settings()
{	
	# Include Header
	source /usr/src/IT_Files/Linux/config/main/header.sh

	# Messages
	if [[ "$1" != "" ]]; then
		echo ""
		echo -e "Message:$COL_RED $1 $COL_RESET"
	fi
	
	echo ""
	echo -e "$COL_BLUE System Settings $COL_RESET"
	echo -e "$COL_BLUE --------------- $COL_RESET"
	echo -e "$COL_YELLOW 1.  $COL_RESET Update hostname and apply blacklist"
	echo -e "$COL_YELLOW 2.  $COL_RESET Run DNS fix"
	echo -e "$COL_YELLOW 3.  $COL_RESET SSL Fix"
	echo -e "$COL_YELLOW 4.  $COL_RESET Enable/Disable USB"
	echo -e "$COL_YELLOW 5.  $COL_RESET Restart VNC service $COL_RED root $COL_RESET"
	echo -e "$COL_YELLOW 6.  $COL_RESET Network Manager"
	echo -e "$COL_YELLOW 7.  $COL_RESET Reset Environment"
	echo -e "$COL_YELLOW 8.  $COL_RESET Configure AlienVault"
	echo -e "$COL_YELLOW 10. $COL_RESET Update BASH (Latest 8/21/2015)"
	echo -e "$COL_YELLOW 11. $COL_RESET Fix Packages/Dependencies (testing)"
	echo -e "$COL_YELLOW 12. $COL_RESET Fix fstab"
	echo -e "$COL_YELLOW 9.  $COL_RESET Back to Main Manu"
	echo -e "$COL_YELLOW 0.  $COL_RESET Exit"
	echo -e "$COL_BLUE -------------------------------------- $COL_RESET"
	read -p "Enter selection: " selection
	# Settings - Option 1 - Blacklist/Name Update
	if [[ "$selection" == "1" ]]; then
		sudo /usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
		clear
		Settings
	# Settings - Option 2 - DNS Fix
	elif [[ "$selection" == "2" ]]; then
		sudo /usr/src/IT_Files/Linux/satdns.sh
		Settings "DNS fix complete."
	# Settings - Option 3 - SSL Fix	
	elif [[ "$selection" == "3" ]]; then
		sudo ln -s /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts
		Settings "SSL Fix applied."
	# Settings - Option 4 - Enable/Disable USB
	elif [[ "$selection" == "4" ]]; then
		$usb
	# Settings - Option 5 - VNC Reset
	elif [[ "$selection" == "5" ]]; then
		if [[ "$EUID" != "0" ]]; then
			Settings "Operation failed! You are not root!"
		else
			sudo /usr/src/IT_Files/Linux/cron/reboot.sh
			Settings "VNC service reset."
		fi
	# Settings - Option 6 - Network Manager
	elif [[ "$selection" == "6" ]]; then
		# AKA 'IP'
		/usr/src/IT_Files/Linux/config/main/network_manager.sh
	# Settings - Option 7 - Reset Environment
	elif [[ "$selection" == "7" ]]; then
		Settings "This feature isn't finished. Sorry!"
	# Settings - Option 8 - AlienVault config
	elif [[ "$selection" == "8" ]]; then
		sudo /var/ossec/bin/manage_agents
		sudo /var/ossec/bin/ossec-control restart
		Settings "AlienVault configuration complete."
	elif [[ "$selection" == "9698" ]]; then
		$noc
	# Settings - Option 10 - BASH Update
	elif [[ "$selection" == "10" ]]; then
		sudo cp /usr/src/IT_Files/Linux/xfce-uni/preferences/bash.bashrc /etc/
		Settings "BASH updated. Enter bash in terminal to restart Bash."
	# Settings - Option 11 - Fix Packages/Dependencies
	elif [[ "$selection" == "11" ]]; then
		sudo apt-get install -f
		dpkg --configure -a
		Settings "Dependencies/packages (maybe) fixed!"
	elif [[ "$selection" == "12" ]]; then
		clear
		sudo /usr/src/IT_Files/Linux/fixfstab.sh
		read -n1 -r -p "Press any key to continue..." key
		Settings "Fstab fix complete."
	# Settings - Option 9 - Main Menu
	elif [[ "$selection" == "9" ]]; then
		/usr/src/IT_Files/Linux/config/main/main.sh
	# Settings - Option 10 - Exit
	elif [[ "$selection" == "0" ]]; then
		clear
		exit 0
	else
		Settings "$selection: Unrecognized command."
	fi
}

### FUNCTION CALL ######################################################
Settings
########################################################################
