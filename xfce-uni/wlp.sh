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

### LDAP WLP-TLS SETUP - Updated 3/16/2015 ###

	function Proceed()
	{
		# Function to allow tech to launch Chrome and Zoiper
		# so that programs may establish file structure
		
		echo "User is: $1"
		echo "To finish setup: "
		echo -e "Launch both Chrome and Zoiper then click OK or YES to any pop-up windows."
		echo "Are you ready to proceed? Type 'yes' if ready."
		read proceed
		if [[ "$proceed" == "yes" ]]; then
			pkill zoiper
			pkill google-chrome
			sleep 2
			MountDrives $1
		else
			Proceed $1
		fi
	}

	# function Proceed()
	# {
	# 	su $user -c google-chrome </dev/null &>/dev/null &
	# 	sleep 2
	# 	su $user -c zoiper </dev/null &>/dev/null &
	# 	sleep 5

	# 	pkill google-chrome
	# 	pkill google-chrome-stable
	# 	pkill chrome
	# 	pkill zoiper

	# 	MountDrives $1
	# }


	function MountDrives()
	{
		# Create directories for mount locations	
		mkdir /usr/src/WLP_Info
		mkdir /usr/src/AnthemExtrasWritablePDFFiles
		mkdir /usr/src/CompletedAnthemExtrasPDFFiles
		
		# Credentials
		cp /usr/src/IT_Files/Linux/xfce-uni/creds/wlp/.smbcredentials /home/$1/.smbcredentials
		chmod 600 /home/$1/.smbcredentials

		#Prevents writing extra fstab entries
		sed -i '/WLP/d' /etc/fstab
		sed -i '/PDF/d' /etc/fstab
		sed -i '/Aetna/d' /etc/fstab
		sed -i '/Coventry/d' /etc/fstab

		#Write client-specific fstab entries
		echo "//hal2.connexionpoint.com/WLP_Info /usr/src/WLP_Info cifs credentials=/home/$1/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0" >> /etc/fstab
		echo "//hal2.connexionpoint.com/AnthemExtrasWritablePDFFiles /usr/src/AnthemExtrasWritablePDFFiles cifs credentials=/home/$1/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0" >> /etc/fstab
		echo "//hal2.connexionpoint.com/CompletedAnthemExtrasPDFFiles /usr/src/CompletedAnthemExtrasPDFFiles cifs credentials=/home/$1/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0" >> /etc/fstab
		
		umount -a
		mount -a

		# Create desktop links for WLP
		ln -s /usr/src/WLP_Info /home/$1/Desktop/WLP_Info
		ln -s /usr/src/AnthemExtrasWritablePDFFiles /home/$1/Desktop/AnthemExtrasWritablePDFFiles
		ln -s /usr/src/CompletedAnthemExtrasPDFFiles /home/$1/Desktop/CompletedAnthemExtrasPDFFiles
		rm /home/*/Desktop/Aetna_Files
		rm /home/*/Desktop/Coventry_Files

		rm -r /usr/src/Aetna_Files
		rm -r /usr/src/Coventry_Files
	}

	function Settings()
	{
		# Function to configure desktop environment for user

		# Create directories
		mkdir /home/$1/.config/autostart
		mkdir /home/$1/PDF/
		mkdir /var/.copy/
		
		# Copy shortcuts and seeds from HAL
		cp -a /usr/src/IT_Files/Linux/xfce-uni/shortcuts/. /home/$1/Desktop
		cp -a /usr/src/IT_Files/Linux/xfce-uni/seeds/Zoiper/Production/WLP-TLS/Sip1/* /home/$1/.Zoiper/
		cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/$1/.config/autostart
		cp /home/$1/Desktop/Zoiper.desktop /home/$1/.config/autostart/
		
		# Write Zoiper settings
		clear
		read -p "Enter extension: " ext
		read -p "Enter sip: " sip
		/usr/src/IT_Files/Linux/xfce-uni/preferences/wlp-zoip.sh "$1" $ext $sip
		cp /usr/src/IT_Files/Linux/xfce-uni/cpxe/TLS/web$sip/CallProXE.desktop /home/$user/Desktop

		# Call script to write Chrome bookmarks and preferences
		/usr/src/IT_Files/Linux/xfce-uni/preferences/wlp-chrome-prefs.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/screensaver.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/theme.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/start_menu.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/compositing.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/lockscreen.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh "$1"
		sleep 2
		/usr/src/IT_Files/Linux/xfce-uni/preferences/mimelist.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/chrome-pref.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/pointers.sh "$1"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
		sleep 1
		cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/wlp/web$sip/* /home/$1/.config/google-chrome/Default/
		sleep 3
		xdg-mime default wfica.desktop application/x-ica
		
		# Remove home directory folders
		rm -r /home/$1/Documents
		rm -r /home/$1/Downloads
		rm -r /home/$1/Music
		rm -r /home/$1/Pictures		
		rm -r /home/$1/Public
		rm -r /home/$1/Templates
		rm -r /home/$1/Videos
		
		rm /home/$1/Desktop/Aetna_Files
		rm /home/$1/Desktop/Coventry_Files
		
		rm /usr/share/xfce4/backdrops/*
		rm -r /usr/share/wallpapers/
		rm /usr/share/backgrounds/xfce/xfce-blue.jpg
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_anthem_3b.png /usr/share/xfce4/backdrops/linuxmint.png
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_anthem_3b.jpg /usr/share/backgrounds/xfce/xfce-blue.jpg
		
		touch /var/log/wlp.flag
		rm /var/log/aet.flag
		
	}

	### Function Calls ###
	user=$1
	Proceed $user
	Settings $user
	######################

	clear
	echo ""
	echo "### You must manually add siebelprd1.wellpoint.com to Incognito Regex! ###"
	echo ""

	read -p "System must be rebooted for DESKTOP changes to take effect. Reboot? (y/n) " answer
	if [[ "$answer" == "y" ]]; then	
		echo ""	
		echo "### Rebooting system..."
		sleep 2
		reboot
	else
		exit 0
	fi
