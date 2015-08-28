#!/bin/bash

function IP()
{
	# Include Header
	source /usr/src/IT_Files/Linux/config/main/header.sh

	# Messages
	if [[ "$1" != "" ]]; then
		echo ""
		echo -e "Message:$COL_RED $1 $COL_RESET"
	fi
	
	# Display
	echo ""
	echo -e "$COL_BLUE IP Address Config $COL_RESET"
	echo -e "$COL_BLUE ----------------- $COL_RESET"
	echo ""
	
	# Current Status: Dynamic or Static?
	cat /etc/network/interfaces | grep "static" &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_CYAN  Current Status: $COL_RESET $COL_GREEN Static $COL_RESET"
		status="dynamic"
	else
		echo -e "$COL_CYAN  Current Status: $COL_RESET $COL_RED Dynamic $COL_RESET"
		status="static"
	fi	
		
	echo ""
	echo -e "$COL_YELLOW 1. $COL_RESET Set Static IP $COL_RED root $COL_RESET"
	echo -e "$COL_YELLOW 2. $COL_RESET Return to Dynamic IP $COL_RED root $COL_RESET"
	echo -e "$COL_YELLOW 3. $COL_RESET View Network Interfaces File ('q' to Quit)"
	echo -e "$COL_YELLOW 8. $COL_RESET Back to Settings"
	echo -e "$COL_YELLOW 9. $COL_RESET Back to Main Menu"
	echo -e "$COL_YELLOW 0. $COL_RESET Exit"
	echo -e "$COL_BLUE -------------------- $COL_RESET"
	read -p "Enter selection: " selection
	
	if [[ "$selection" == "1" ]]; then
		if [[ "$EUID" != "0" ]]; then
			IP "Operation failed! You are not root!"
		else
			/usr/src/IT_Files/Linux/xfce-uni/preferences/static.sh
			if [[ "$status" == "dynamic" ]]; then
				IP "Operation failed. Scroll up to check log."
			else
				IP "Static IP set."
			fi				
		fi
	elif [[ "$selection" == "2" ]]; then
		if [[ "$EUID" != "0" ]]; then
			IP "Operation failed! You are not root!"
		else
			/usr/src/IT_Files/Linux/xfce-uni/preferences/dhcp.sh
			if [[ "$status" == "static" ]]; then
				IP "Operation failed. Scroll up to check log."
			else
				IP "Connection restored to dynamic."
			fi		
		fi
	elif [[ "$selection" == "3" ]]; then
		less /etc/network/interfaces
		IP
	elif [[ "$selection" == "8" ]]; then
		$settings
	elif [[ "$selection" == "9" ]]; then
		$main
	elif [[ "$selection" == "0" ]] || [[ "$selection" == "exit" ]] || [[ "$selection" == "quit" ]] || [[ "$selection" == "q" ]] || [[ "$selection" == "Q" ]]; then
		clear
		exit 0		
	else
		IP "$selection: Unrecognized command."
	fi
}	

### FUNCTION CALL ######################################################
IP
########################################################################
