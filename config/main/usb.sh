#!/bin/bash

function USB()
{
	# Include header
	source /usr/src/IT_Files/Linux/config/main/header.sh

	# Messages
	if [[ "$1" != "" ]]; then
		echo ""
		echo -e "Message:$COL_RED $1 $COL_RESET"
	fi
	
	echo ""
	echo -e "$COL_BLUE USB Control Menu $COL_RESET"
	echo -e "$COL_BLUE ---------------- $COL_RESET"
	echo -e "$COL_YELLOW 1. $COL_RESET Turn USB Off"
	echo -e "$COL_YELLOW 2. $COL_RESET Turn USB On"
	echo -e "$COL_YELLOW 8. $COL_RESET Back to Settings"
	echo -e "$COL_YELLOW 9. $COL_RESET Back to Main Menu"
	echo -e "$COL_YELLOW 0. $COL_RESET Exit"
	echo -e "$COL_BLUE -------------------- $COL_RESET"
	read -p "Enter selection: " selection
	
	if [[ "$selection" == "1" ]]; then
		sudo /usr/src/IT_Files/Linux/usb_off.sh "- Linux Config Menu"
		USB "USB mount access disabled."
	elif [[ "$selection" == "2" ]]; then
		sudo /usr/src/IT_Files/Linux/usb_on.sh "- Linux Config Menu"
		USB "USB mount access enabled."
	elif [[ "$selection" == "8" ]]; then
		$settings
	elif [[ "$selection" == "9" ]]; then
		$main
	elif [[ "$selection" == "0" ]] || [[ "$selection" == "exit" ]] || [[ "$selection" == "quit" ]] || [[ "$selection" == "q" ]] || [[ "$selection" == "Q" ]]; then
		clear
		exit 0		
	else
		USB "$selection: Unrecognized command."
	fi
}

### FUNCTION CALL ######################################################
USB
########################################################################
