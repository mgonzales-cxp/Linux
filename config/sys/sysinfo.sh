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


### System Info ########################################################

# Get Distro
cat /etc/issue | grep "Rebecca" &>/dev/null
if [[ "$?" == "0" ]]; then
	distro="Linux Mint 17.1 Rebecca"
else
	distro="$(cat /etc/issue)"
fi

# User Status
clear
if [[ "$EUID" == "0" ]]; then
	echo -e "Status: $COL_RED root $COL_RESET"
	echo ""
elif [[ "$EUID" != "0" ]]; then
	echo -e "Status: $COL_GREEN   Not root $COL_RESET"
	echo ""
fi

# SysInfo Menu
echo -e "$COL_BLUE System Info $COL_RESET"
echo -e "$COL_BLUE ----------- $COL_RESET"
echo -e "$COL_CYAN Distro:         $COL_RESET $distro"
echo -e "$COL_CYAN Kernel version: $COL_RESET $(uname -r)"
file /sbin/init | grep "64-bit" &>/dev/null
if [[ "$?" == "0" ]]; then
	echo -e "$COL_CYAN OS Bit Version: $COL_RESET 64-Bit"
else
	echo -e "$COL_CYAN OS Bit Version: $COL_RESET 32-Bit"
fi
echo -e "$COL_CYAN Computer name:  $COL_RESET $(hostname)"
echo -e "$COL_CYAN Last shutdown: $COL_RESET  $(last -x | grep shutdown | head -n 1 | cut -c 40-)"
if [ -f /var/log/cron_duration.log ]; then
	echo -e "$COL_CYAN Cron duration: $COL_RESET  $(cat /var/log/cron_duration.log)"
else
	echo -e "$COL_CYAN Cron duration: $COL_RESET  cron_duration.log doesn't exist!"
fi

# Check if static or dynamic
cat /etc/network/interfaces | grep "static" &>/dev/null
if [[ "$?" == "0" ]]; then
	status="static"
else
	status="dynamic"
fi	
if [[ "$1" != "" ]]; then
	echo ""
	echo -e "Message:$COL_RED $1 $COL_RESET"
fi
echo -e "$COL_CYAN IP Address:     $COL_RESET $(hostname -I) ($status)"
echo -e "$COL_CYAN Current user:   $COL_RESET $(logname)"
echo ""

### Mount Info #########################################################

# Local Disk Space
echo -e "$COL_BLUE Local Disk Space $COL_RESET"
echo -e "$COL_BLUE ---------------- $COL_RESET"
echo -e "$COL_CYAN $(df -h | grep "Use%")"
echo -e "$COL_YELLOW $(df -h | grep "root") $COL_RESET"
echo ""
echo -e "$COL_BLUE Memory Usage $COL_RESET"
echo -e "$COL_BLUE ------------ $COL_RESET"
echo -e "$COL_YELLOW  $(free -mh | grep "total") $COL_RESET"
echo -e "$COL_YELLOW  $(free -mh | grep "Mem:") $COL_RESET"
echo ""

read -n1 -p "Press 'm' for mount info or any other key to exit." keyPress
if [[ "$keyPress" == "m" ]]; then
	clear
else
	exit 0
fi

echo -e "$COL_BLUE Mount Info $COL_RESET"
echo -e "$COL_BLUE ---------- $COL_RESET"

ls /usr/src/IT_Files/Linux/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_MAGENTA IT_Files$COL_RESET is$COL_GREEN connected. $COL_RESET"
	fi
	
ls /usr/src/WLP_Info/2015\ Age\ In/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_CYAN WLP_Info$COL_RESET is$COL_GREEN connected. $COL_RESET"
	else
		echo -e "$COL_CYAN WLP_Info$COL_RESET is$COL_RED NOT connected. $COL_RESET"
	fi

ls /usr/src/AnthemExtrasWritablePDFFiles/California/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_CYAN AnthemExtrasWritablePDFFiles$COL_RESET is$COL_GREEN connected. $COL_RESET"
	else
		echo -e "$COL_CYAN AnthemExtrasWritablePDFFiles$COL_RESET is$COL_RED NOT connected. $COL_RESET"
	fi
	
ls /usr/src/CompletedAnthemExtrasPDFFiles/ToBeReviewed/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_CYAN CompletedAnthemExtrasPDFFiles$COL_RESET is$COL_GREEN connected. $COL_RESET"
	else
		echo -e "$COL_CYAN CompletedAnthemExtrasPDFFiles$COL_RESET is$COL_RED NOT connected. $COL_RESET"
	fi
	
ls /usr/src/Aetna_Files/Scripts/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_YELLOW Aetna_Files$COL_RESET is$COL_GREEN connected. $COL_RESET"
	else
		echo -e "$COL_YELLOW Aetna_Files$COL_RESET is$COL_RED NOT connected. $COL_RESET"
	fi

echo ""

read -n1 -r -p "Press any key to continue..." key
/usr/src/IT_Files/Linux/config/sys/sysinfo.sh
