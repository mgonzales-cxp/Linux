#!/bin/bash

function Shortcuts()
{
	# Include header
	source /usr/src/IT_Files/Linux/config/main/header.sh

	# Messages
	if [[ "$1" != "" ]]; then
		echo ""
		echo -e "Message:$COL_RED $1 $COL_RESET"
	fi
	
	echo ""
	echo -e "$COL_BLUE Add Shortcuts Menu $COL_RESET"
	echo -e "$COL_BLUE ------------------ $COL_RESET"
	echo -e "$COL_YELLOW 1. $COL_RESET Add CallProXE shortcuts for TLS"
	echo -e "$COL_YELLOW 8. $COL_RESET Back to Tasks"
	echo -e "$COL_YELLOW 9. $COL_RESET Back to Main Menu"
	echo -e "$COL_YELLOW 0. $COL_RESET Exit"
	echo -e "$COL_BLUE -------------------- $COL_RESET"
	read -p "Enter selection: " selection
	
	if [[ "$selection" == "1" ]]; then
		/usr/src/IT_Files/Linux/xfce-uni/preferences/cpxe_shortcuts.sh "TLS"
		UserCheck
		if [ -f $name/Desktop/CallProXE.desktop ]; then
			Shortcuts "CallProXE shortcuts added."
			echo $name
		else
			Shortcuts "Shortcut copy failed. Scroll up to check log."
		fi
	elif [[ "$selection" == "9" ]]; then
		$main
	elif [[ "$selection" == "0" ]]; then
		exit 0
	else
		Shortcuts "$selection: Unrecognized command."
	fi
}

### FUNCTION CALL ######################################################
Shortcuts
########################################################################
