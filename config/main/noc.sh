#!/bin/bash
	
# Include Header
header=/usr/src/IT_Files/Linux/config/main/header.sh
source $header &>/dev/null

function nocPW()
{
	clear
	read -s -p "Need input: " test
	FILE=/usr/src/IT_Files/Linux/logs/.null.txt
	exec 3<&0
	exec 0<$FILE
	
	while read line
	do
		#use $line variable to process line
		if [[ "$test" == $line ]]; then
			status="Cleared"
			echo $status
			#sleep 1
			break
		else
			status="Failed"
			echo $status
			sleep 1
			break
		fi
		#echo $line
	done
	exec 0<&3
	
	if [[ "$status" == "Failed" ]]; then
		$main
	else
		NOC
	fi
}

function NOC()
{
	# Include header
	source $header

	# Messages
	if [[ "$1" != "" ]]; then
		echo ""
		echo -e "Message:$COL_RED $1 $COL_RESET"
	fi

	echo ""
	echo -e "$COL_BLUE NOC Functions $COL_RESET"
	echo -e "$COL_BLUE ------------- $COL_RESET"
	echo -e "$COL_YELLOW 1. $COL_RESET Add Tech Help launcher to user profile $COL_RED root $COL_RESET"
	echo -e "$COL_YELLOW 2. $COL_RESET IP address settings"
	echo -e "$COL_YELLOW 9. $COL_RESET Back to Main Menu"
	echo -e "$COL_YELLOW 0. $COL_RESET Exit"
	echo -e "$COL_BLUE -------------------- $COL_RESET"
	read -p "Enter selection: " selection
	if [[ "$selection" == "1" ]]; then
		if [[ "$EUID" != "0" ]]; then
			NOC "Operation failed! You are not root!"
		else
			cp /usr/src/IT_Files/Linux/HelpDesk/launcher/hd.sh /usr/bin/
			/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh $(logname)
			cp -r /usr/src/IT_Files/Linux/seeds/.opera /home/$(logname)/
			NOC "Added tech launcher. Log out and back in to complete process."
		fi
	elif [[ "$selection" == "2" ]]; then
		$network_manager
	elif [[ "$selection" == "9" ]]; then
		$main
	elif [[ "$selection" == "0" ]]; then
		clear
		exit 0
	else
		NOC "$selection: Unrecognized command."
	fi
}

### FUNCTION CALL ######################################################
nocPW
########################################################################
