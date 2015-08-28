#!/bin/bash

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

clear
if [[ "$EUID" == "0" ]]; then
	echo -e "Status: $COL_RED root $COL_RESET"
	echo ""
elif [[ "$EUID" != "0" ]]; then
	echo -e "Status: $COL_GREEN   Not root $COL_RESET"
	echo ""
fi

echo -e "$COL_BLUE System Info $COL_RESET"
echo -e "$COL_BLUE ----------- $COL_RESET"
echo -e "$COL_CYAN Distro: $COL_RESET $(cat /etc/issue)"
echo -e "$COL_CYAN Kernel version: $COL_RESET $(uname -r)"
file /sbin/init | grep "64-bit" &>/dev/null
if [[ "$?" == "0" ]]; then
	echo -e "$COL_CYAN OS Bit Version: $COL_RESET 64-Bit"
else
	echo -e "$COL_CYAN OS Bit Version: $COL_RESET 32-Bit"
fi
echo -e "$COL_CYAN Computer name:  $COL_RESET $(hostname)"
echo -e "$COL_CYAN IP Address:     $COL_RESET $(hostname -I)"
echo -e "$COL_CYAN Current user:   $COL_RESET $(logname)"
echo ""
read -n1 -r -p "Press any key to continue..." key
