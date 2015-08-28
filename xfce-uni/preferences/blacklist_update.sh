#!/bin/bash
# blacklist_update.sh
# Updates hostname in /etc/hosts and /etc/hostname

#Include Header
source /usr/src/IT_Files/Linux/config/main/header_colorpaths.sh


function ProductionCheck()
{
	echo ""
	echo -e "$COL_RED No environment flags found! Not suitable for production or training! $COL_RESET"
	echo ""
	read -p "Is this computer [p]roduction, [t]raining or [n]either? " environment
	if [[ "$environment" == "p" ]]; then
		read -p "Type 'a' for aet or 'w' for wlp: " client
		if [[ "$client" == "a" ]]; then
			touch /var/log/aet.flag
			WriteHost "C"
		elif [[ "$client" == "w" ]]; then
			touch /var/log/wlp.flag
			WriteHost "C"
		else
			clear
			echo "$client: Not a valid choice!"
			ProductionCheck
		fi
	elif [[ "$environment" == "t" ]]; then
		touch /var/log/training.flag
		WriteHost "T"
	elif [[ "$environment" == "n" ]]; then
		WriteHost "n"
	else
		clear
		echo "$environment: Not a valid choice!"
		ProductionCheck
	fi
}

function WriteHost()
{
	letter=$1
	/usr/src/IT_Files/Linux/xfce-uni/preferences/rewrite_hosts.sh $(hostname)
	#cp /usr/src/IT_Files/Linux/seeds/blacklist/hosts /etc/
	if [[ "$letter" == "n" ]]; then
		read -p "Enter hostname: " ext
		letter=""
	else
		read -p "Enter extension only: " ext
	fi
	echo "$letter$ext" > /etc/hostname
	sed -i "/127.0.1.1/c\127.0.1.1 $letter$ext" /etc/hosts
}

### Show script header
clear
echo -e "$COL_RED Blacklist / Hostname Updater $COL_RESET"
echo -e "$COL_RED ---------------------------- $COL_RESET"

### Show hostname and logname
echo ""
echo -e "Hostname is: $COL_GREEN $ext $COL_RESET"
echo -e "Username is: $COL_GREEN $usr $COL_RESET"
echo "-----------------------------------"
echo ""

### Check for change and prompt for update
if [[ "$ext" == "tech" ]] || [[ "$ext" == "Ctech" ]]; then
	echo "Default hostname detected"
	read -p "Update hostname? This must be done at least once(y/n) " answer
else
	echo "Hostname may have already been updated."
	read -p "Update hostname?(y/n) " answer
fi

if [[ "$answer" == "y" ]]; then
	if [ -f /var/log/training.flag ]; then
		WriteHost "T"
	elif [ -f /var/log/wlp.flag ] || [ -f /var/log/aet.flag ]; then
		WriteHost "C"
	else
		ProductionCheck
	fi	
fi

### Ask to reboot
if [[ "$answer" == "y" ]]; then
	clear
	echo "Don't forgot to update Univention if necessary."
	read -p "System must be rebooted for changes to take effect. Reboot? (y/n) " rebootAnswer
	if [[ "$rebootAnswer" == "y" ]]; then	
		echo ""	
		echo "### Rebooting system..."
		sleep 3
		reboot
	else
		exit 0
	fi
fi
