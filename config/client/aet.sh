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

### XFCE AetnaXE SETUP ###

	function Proceed()
	{
		# Function to allow tech to launch Chrome and Zoiper
		# so that programs may establish file structure
		
		echo "User is: $1"
		echo "To finish setup: "
		echo -e "Launch both Chrome, Zoiper $COL_RED -AND OPERA- $COL_RESET then click OK or YES to any pop-up windows."
		echo "Are you ready to proceed? Type 'yes' if ready."
		read proceed
		if [[ "$proceed" == "yes" ]]; then
			pkill zoiper
			pkill google-chrome-stable
			sleep 2
			MountDrives $1
		else
			Proceed $1
		fi
	}

	function MountDrives()
	{
		# Create directories for mount locations	
		mkdir /usr/src/Aetna_Files
		mkdir /usr/src/Coventry_Files
		
		# Credentials
		cp /usr/src/IT_Files/Linux/xfce-uni/creds/aet/.smbcredentials /home/$1/.smbcredentials
		chmod 600 /home/$1/.smbcredentials

		# Prevent writing extra fstab entries
		sed -i '/WLP/d' /etc/fstab
		sed -i '/PDF/d' /etc/fstab
		sed -i '/Aetna/d' /etc/fstab
		sed -i '/Coventry/d' /etc/fstab

		# Write client-specific fstab entries
		echo "//hal2.connexionpoint.com/Aetna_Files /usr/src/Aetna_Files cifs credentials=/home/$1/.smbcredentials,iocharset=utf8,sec=ntlm 0 0" >> /etc/fstab
		echo "//hal2.connexionpoint.com/Coventry_Files /usr/src/Coventry_Files cifs credentials=/home/$1/.smbcredentials,iocharset=utf8,sec=ntlm 0 0" >> /etc/fstab
		
		mount -a

		# Create desktop links for Aetna / Coventry Files
		ln -s /usr/src/Aetna_Files /home/$1/Desktop/Aetna_Files
		ln -s /usr/src/Coventry_Files /home/$1/Desktop/Coventry_Files
	}

	function Settings()
	{
		# Function to configure desktop environment for user

		# Create startup directory
		mkdir /home/$1/.config/autostart

		# Copy shortcuts and seeds from HAL
		cp -a /usr/src/IT_Files/Linux/xfce-uni/shortcuts/. /home/$1/Desktop
		cp -a /usr/src/IT_Files/Linux/xfce-uni/seeds/Zoiper/Production/AetnaXE/Sip1/* /home/$1/.Zoiper/
		cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/$1/.config/autostart
		cp /home/$1/Desktop/Zoiper.desktop /home/$1/.config/autostart/
		
		# Write Zoiper settings
		read -p "Enter extension: " ext
		read -p "Enter sip: " sip
		/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-zoip.sh "$1" $ext $sip

		# Call preference scripts
		/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-chrome-prefs.sh "$1"	
		/usr/src/IT_Files/Linux/xfce-uni/preferences/screensaver.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/theme.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/compositing.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/lockscreen.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/mimelist.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/chrome-pref.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/pointers.sh "$1"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
		cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/aet/* /home/$1/.config/google-chrome/Default/
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
		
		# User permissions
		#chmod 300 /home/$1
		
		rm /usr/share/xfce4/backdrops/*
		rm -r /usr/share/wallpapers/
		rm /usr/share/backgrounds/xfce/xfce-blue.jpg
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_aetna_3.png /usr/share/xfce4/backdrops/linuxmint.png
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_aetna_3.jpg /usr/share/backgrounds/xfce/xfce-blue.jpg
		
		# Opera seed
		cp -r /usr/src/IT_Files/Linux/seeds/.opera /home/$(logname)/
		
		#LivePerson $1
		#read -p "Install LivePerson?(y/n) " answer
		#if [[ "$answer" == "y" ]]; then
		#	LivePerson $1
		#fi
	}

	### Updates ###
	#apt-get update
	#DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

	### Function Calls ###
	user=$1
	Proceed $user
	Settings $user
	/usr/src/IT_Files/Linux/xfce-uni/preferences/start_menu.sh "$user"
	######################

	read -p "System must be rebooted for DESKTOP changes to take effect. Reboot? (y/n) " answer
	if [[ "$answer" == "y" ]]; then	
		echo ""	
		echo "### Rebooting system..."
		sleep 3
		reboot
	else
		exit 0
	fi
