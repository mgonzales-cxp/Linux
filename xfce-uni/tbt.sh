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
		
		echo "User is: tbt"
		echo "To finish setup: "
		echo -e "Launch both Chrome and Zoiper then click OK or YES to any pop-up windows."
		echo "Are you ready to proceed? Type 'yes' if ready."
		read proceed
		if [[ "$proceed" == "yes" ]]; then
			pkill zoiper
			pkill google-chrome-stable
			sleep 2
			MountDrives
		else
			Proceed
		fi
	}

	function MountDrives()
	{
		# Create directories for mount locations	
		mkdir /usr/src/Aetna_Training_Files
		
		
		# Credentials
		cp /usr/src/IT_Files/Linux/xfce-uni/creds/aet_train/.smbcredentials /home/tbt/
		chmod 600 /home/tbt/.smbcredentials

		# Prevent writing extra fstab entries
		sed -i '/WLP/d' /etc/fstab
		sed -i '/PDF/d' /etc/fstab
		sed -i '/Aetna/d' /etc/fstab
		sed -i '/Coventry/d' /etc/fstab

		# Write client-specific fstab entries
		echo "//hal2.connexionpoint.com/Aetna_Training_Files /usr/src/Aetna_Training_Files cifs credentials=/home/tbt/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0" >> /etc/fstab
		
		
		mount -a

		# Create desktop links for Aetna / Coventry Files
		ln -s /usr/src/Aetna_Training_Files /home/tbt/Desktop/Aetna_Training_Files
		
	}

	function Settings()
	{
		# Function to configure desktop environment for user

		# Create startup directory
		mkdir /home/tbt/.config/autostart

		# Copy shortcuts and seeds from HAL
		cp -a /usr/src/IT_Files/Linux/xfce-uni/shortcuts/. /home/tbt/Desktop
		cp -a /usr/src/IT_Files/Linux/xfce-uni/seeds/Zoiper/Training/AET/Sip1/* /home/tbt/.Zoiper/
		cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/tbt/.config/autostart
		cp /home/tbt/Desktop/Zoiper.desktop /home/tbt/.config/autostart/
		
		# Write Zoiper settings
		read -p "Enter extension: " ext
		
		/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-train-zoiper.sh "tbt" $ext

		# Call preference scripts
		/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-train-chrome-prefs.sh "tbt" 
		/usr/src/IT_Files/Linux/xfce-uni/preferences/screensaver.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/theme.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/compositing.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/lockscreen.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/mimelist.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/chrome-pref.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/pointers.sh "tbt"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
		cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/aet/training/Default /home/tbt/.config/google-chrome/
		sleep 3
		xdg-mime default wfica.desktop application/x-ica
		
		# Remove home directory folders
		rm -r /home/tbt/Documents
		rm -r /home/tbt/Downloads
		rm -r /home/tbt/Music
		rm -r /home/tbt/Pictures
		rm -r /home/tbt/Public
		rm -r /home/tbt/Templates
		rm -r /home/tbt/Videos
		
		# User permissions
		#chmod 300 /home/tbt
		
		rm /usr/share/xfce4/backdrops/*
		rm -r /usr/share/wallpapers/
		rm /usr/share/backgrounds/xfce/xfce-blue.jpg
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_aetna_3.png /usr/share/xfce4/backdrops/linuxmint.png
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_aetna_3.jpg /usr/share/backgrounds/xfce/xfce-blue.jpg
		
		# Opera seed
		#cp -r /usr/src/IT_Files/Linux/seeds/.opera /home/$(logname)/
		apt-get purge opera -y
		
		
		touch /var/log/tbt.flag
	}

	### Updates ###
	#apt-get update
	#DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

	### Function Calls ###
	user=tbt
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
