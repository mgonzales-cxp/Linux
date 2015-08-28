#!/bin/bash

# Hostname
ext=$(hostname)

# Username
usr=$(logname)

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

# Paths
main=/usr/src/IT_Files/Linux/config/main/main.sh
header=/usr/src/IT_Files/Linux/config/main/header.sh
settings=/usr/src/IT_Files/Linux/config/main/settings.sh
network_manager=/usr/src/IT_Files/Linux/config/main/network_manager.sh
software=/usr/src/IT_Files/Linux/config/main/software.sh
client=/usr/src/IT_Files/Linux/config/main/client.sh
usb=/usr/src/IT_Files/Linux/config/main/usb.sh
tasks=/usr/src/IT_Files/Linux/config/main/tasks.sh
noc=/usr/src/IT_Files/Linux/config/main/noc.sh
config_args=/usr/src/IT_Files/Linux/config/main/args.sh

function Header()
{
	clear
	echo -e "$COL_BLUE hostname: $COL_RESET $(hostname)             $COL_RESET $COL_BLUE IP: $COL_RESET $(hostname -I)"
	if [[ "$EUID" == "0" ]]; then
		echo -e "$COL_BLUE Status: $COL_RED   root $COL_RESET"
	elif [[ "$EUID" != "0" ]]; then
		echo -e "$COL_BLUE Status: $COL_GREEN   Not root $COL_RESET"
	fi
}

### FUNCTION CALL ######################################################
Header
########################################################################
