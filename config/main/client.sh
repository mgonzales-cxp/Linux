#!/bin/bash

function Client()
{
	# Include header
	source /usr/src/IT_Files/Linux/config/main/header.sh
	
	# Messages
	if [[ "$1" != "" ]]; then
		echo ""
		echo -e "Message:$COL_RED $1 $COL_RESET"
	fi
	
	echo ""
	echo -e "$COL_BLUE Client Scripts $COL_RESET"
	echo -e "$COL_BLUE -------------- $COL_RESET"
	echo -e "$COL_YELLOW 1. $COL_RESET Aetna $COL_RED root $COL_RESET"
	echo -e "$COL_YELLOW 2. $COL_RESET Anthem $COL_RED root $COL_RESET"
	echo -e "$COL_YELLOW 9. $COL_RESET Back to Main Menu"
	echo -e "$COL_YELLOW 0. $COL_RESET Exit"
	echo -e "$COL_BLUE -------------- $COL_RESET"
	read -p "Enter selection: " selection
	
	if [[ "$selection" == "1" ]]; then
		if [[ "$EUID" != "0" ]]; then
			Client "Operation failed! You are not root!"
		else
			sudo /usr/src/IT_Files/Linux/xfce-uni/aet.sh $(logname)
			Client "Aetna configuration complete."
		fi
	elif [[ "$selection" == "2" ]]; then
		if [[ "$EUID" != "0" ]]; then
			Client "Operation failed! You are not root!"
		else
			sudo /usr/src/IT_Files/Linux/xfce-uni/wlp.sh $(logname)
			Client "Anthem configuration complete."
		fi
	elif [[ "$selection" == "9" ]]; then
		$main
	elif [[ "$selection" == "0" ]] || [[ "$selection" == "exit" ]] || [[ "$selection" == "quit" ]] || [[ "$selection" == "q" ]] || [[ "$selection" == "Q" ]]; then
		clear
		exit 0		
	else
		Client "$selection: Unrecognized command."
	fi		
}

### FUNCTION CALL ######################################################
Client
########################################################################
