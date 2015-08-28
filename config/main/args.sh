#!/bin/bash

if [[ "$1" == "init" ]]; then
	sudo mkdir /usr/src/IT_Files
	sudo sed -i '/IT_Files/d' /etc/fstab #Prevents writing extra fstab entries
	sudo echo "//hal2.connexionpoint.com/IT_Files /usr/src/IT_Files cifs guest,uid=1000,iocharset=utf8  0  0" >> /etc/fstab

	sudo mount -a

	/usr/src/IT_Files/Linux/xfce-uni/initial_setup.sh
elif [[ "$1" == "vnc" ]]; then
	/usr/src/IT_Files/Linux/config/sys/vnc.sh
	clear
	echo "VNC service reset."
	exit 0
elif [[ "$1" == "aet" ]]; then
	/usr/src/IT_Files/Linux/xfce-uni/aet.sh $(logname)
	exit 0
elif [[ "$1" == "wlp" ]]; then
	/usr/src/IT_Files/Linux/xfce-uni/wlp.sh $(logname)
	exit 0
elif [[ "$1" == "uni" ]]; then
	/usr/src/IT_Files/Linux/univentionClientScript2.sh
	exit 0
elif [[ "$1" == "pdf" ]]; then
	/usr/src/IT_Files/Linux/pdf.sh
	exit 0
elif [[ "$1" == "dns" ]]; then
	sudo /usr/src/IT_Files/Linux/satdns.sh
	clear
	cat /etc/resolv.conf
	echo ""
	echo "DNS fix applied."
	exit 0
elif [[ "$1" == "fstab" ]]; then
	/usr/src/IT_Files/Linux/fixfstab.sh
	read -n1 -r -p "Press any key to continue..." key
	exit 0
elif [[ "$1" == "roy" ]]; then
	cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/wlp/web2/* /home/$(logname)/.config/google-chrome/Default/
	echo "Bookmarks fixed."
	exit 0
elif [[ "$1" == "chat" ]]; then
	#/usr/src/IT_Files/Linux/xfce-uni/helpdesk.sh
	clear
	echo "config chat is out-of-date. Please try config slc or config launcher. Please ask maintainer about updating for WLP."
	#echo "HelpDesk launcher installed."
	exit 0
elif [[ "$1" == "vga" ]]; then
	--xrandr --output DVI-0 --left-of VGA-0
	clear
	echo "DVI should now be left of VGA"
	exit 0
elif [[ "$1" == "ossec" ]]; then
	/usr/src/IT_Files/Linux/cron/deploy_ossec.sh
	clear
	if [ ! -d /var/ossec ]; then
		echo "Installation failed. Scroll up to check errors."
		exit 1
	else
		echo "OSSEC installed."
		exit 0
	fi
elif [[ "$1" == "ossecrmv" ]]; then
	/usr/src/IT_Files/Linux/cron/deploy_ossec.sh "rmv"
	clear
	if [ ! -d /var/ossec ]; then
		echo "OSSEC successfully removed."
		exit 0
	else
		echo "OSSEC removal failed. Scroll up to check errors."
		exit 1
	fi
elif [[ "$1" == "ossecforce" ]]; then
	/usr/src/IT_Files/Linux/cron/deploy_ossec.sh "force"
	clear
	echo "OSSEC reconfiguration has been forced."
	exit 0
elif [[ "$1" == "rmzoip" ]]; then
	clear
	read -p "WARNING: This will completely remove Zoiper from this computer. Continue? " zoiper
	if [[ "$zoiper" == "y" ]] || [[ "$zoiper" == "yes" ]]; then
		rm -r /usr/bin/zoiper
		rm -r /usr/share/Zoiper
		rm /usr/share/applications/zoiper.desktop
		rm /usr/share/pixmaps/zoiper-*
		rm -r /home/*/.Zoiper
		clear
		echo "Zoiper removed."
		exit 0
	else
		echo "Zoiper removal aborted."
	fi
elif [[ "$1" == "slc" ]]; then
	/usr/src/IT_Files/Linux/cron/launcher_slc.sh
	exit 0
elif [[ "$1" == "launcher" ]]; then
	/usr/src/IT_Files/Linux/cron/launcher_update.sh
	exit 0
elif [[ "$1" == "flag" ]]; then
	/usr/src/IT_Files/Linux/flag_test.sh
	exit 0
elif [[ "$1" == "host" ]]; then
	/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
	exit 0
elif [[ "$1" == "tbt" ]]; then
	/usr/src/IT_Files/Linux/xfce-uni/tbt.sh
	exit 0
fi
