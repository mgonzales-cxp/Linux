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

	

	function MountDrives()
	{
		# Create directories for mount locations	
		mkdir /usr/src/Aetna_Training_Files
		
		
		# Credentials
		cp /usr/src/IT_Files/Linux/xfce-uni/creds/aet_train/.smbcredentials /home/mem/
		chmod 600 /home/mem/.smbcredentials

		# Prevent writing extra fstab entries
		sed -i '/WLP/d' /etc/fstab
		sed -i '/PDF/d' /etc/fstab
		sed -i '/Aetna/d' /etc/fstab
		sed -i '/Coventry/d' /etc/fstab

		# Write client-specific fstab entries
		echo "//hal2.connexionpoint.com/Aetna_Training_Files /usr/src/Aetna_Training_Files cifs credentials=/home/mem/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0" >> /etc/fstab
		
		
		mount -a

		# Create desktop links for Aetna / Coventry Files
		ln -s /usr/src/Aetna_Training_Files /home/mem/Desktop/Aetna_Training_Files
		
	}

	function Settings()
	{
		# Function to configure desktop environment for user

		# Create startup directory
		mkdir /home/mem/.config/autostart

		# Copy shortcuts and seeds from HAL
		cp -a /usr/src/IT_Files/Linux/xfce-uni/shortcuts/. /home/mem/Desktop
		cp -a /usr/src/IT_Files/Linux/xfce-uni/seeds/Zoiper/Training/AET/Sip1/* /home/mem/.Zoiper/
		cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/mem/.config/autostart
		cp /home/mem/Desktop/Zoiper.desktop /home/mem/.config/autostart/
		cp -a /usr/src/IT_Files/2015\ DRx\ Training\ Site.desktop /home/mem/Desktop
		
		
		/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-train-zoiper.sh "mem"

		# Call preference scripts
		/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-train-chrome-prefs.sh "mem" 
		/usr/src/IT_Files/Linux/xfce-uni/preferences/screensaver.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/theme.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/compositing.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/lockscreen.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/mimelist.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/chrome-pref.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/pointers.sh "mem"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
		cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/aet/training/Default /home/mem/.config/google-chrome/
		sleep 3
		xdg-mime default wfica.desktop application/x-ica
		
		# Remove home directory folders
		rm -r /home/mem/Documents
		rm -r /home/mem/Downloads
		rm -r /home/mem/Music
		rm -r /home/mem/Pictures
		rm -r /home/mem/Public
		rm -r /home/mem/Templates
		rm -r /home/mem/Videos
		
		# User permissions
		#chmod 300 /home/mem
		
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


	### Function Calls ###
	user=mem
	MountDrives $user
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
