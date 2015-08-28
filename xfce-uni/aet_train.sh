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
		
		echo "User is: aetna-training"
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
		cp /usr/src/IT_Files/Linux/xfce-uni/creds/aet_train/.smbcredentials /home/aetna-training/
		chmod 600 /home/aetna-training/.smbcredentials

		# Prevent writing extra fstab entries
		sed -i '/WLP/d' /etc/fstab
		sed -i '/PDF/d' /etc/fstab
		sed -i '/Aetna/d' /etc/fstab
		sed -i '/Coventry/d' /etc/fstab

		# Write client-specific fstab entries
		echo "//hal2.connexionpoint.com/Aetna_Training_Files /usr/src/Aetna_Training_Files cifs credentials=/home/aetna-training/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0" >> /etc/fstab
		
		
		mount -a

		# Create desktop links for Aetna / Coventry Files
		ln -s /usr/src/Aetna_Training_Files /home/aetna-training/Desktop/Aetna_Training_Files
		
	}

	function Settings()
	{
		# Function to configure desktop environment for user

		# Create startup directory
		mkdir /home/aetna-training/.config/autostart

		# Copy shortcuts and seeds from HAL
		cp -a /usr/src/IT_Files/Linux/xfce-uni/shortcuts/. /home/aetna-training/Desktop
		cp -a /usr/src/IT_Files/Linux/xfce-uni/seeds/Zoiper/Training/AET/Sip1/* /home/aetna-training/.Zoiper/
		cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/aetna-training/.config/autostart
		cp /home/aetna-training/Desktop/Zoiper.desktop /home/aetna-training/.config/autostart/
		
		# Write Zoiper settings
		read -p "Enter extension: " ext
		
		/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-train-zoiper.sh "aetna-training" $ext

		# Call preference scripts
		/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-train-chrome-prefs.sh "aetna-training" 
		/usr/src/IT_Files/Linux/xfce-uni/preferences/screensaver.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/theme.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/compositing.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/lockscreen.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/mimelist.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/chrome-pref.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/pointers.sh "aetna-training"
		/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
		cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/aet/training/Default /home/aetna-training/.config/google-chrome/
		sleep 3
		xdg-mime default wfica.desktop application/x-ica
		
		# Remove home directory folders
		rm -r /home/aetna-training/Documents
		rm -r /home/aetna-training/Downloads
		rm -r /home/aetna-training/Music
		rm -r /home/aetna-training/Pictures
		rm -r /home/aetna-training/Public
		rm -r /home/aetna-training/Templates
		rm -r /home/aetna-training/Videos
		
		# User permissions
		#chmod 300 /home/aetna-training
		
		rm /usr/share/xfce4/backdrops/*
		rm -r /usr/share/wallpapers/
		rm /usr/share/backgrounds/xfce/xfce-blue.jpg
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_aetna_3.png /usr/share/xfce4/backdrops/linuxmint.png
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_aetna_3.jpg /usr/share/backgrounds/xfce/xfce-blue.jpg
		
		# Opera seed
		cp -r /usr/src/IT_Files/Linux/seeds/.opera /home/$(logname)/
		
		#LivePerson aetna-training
		#read -p "Install LivePerson?(y/n) " answer
		#if [[ "$answer" == "y" ]]; then
		#	LivePerson aetna-training
		#fi
		
		#sudo /usr/src/IT_File/Linux/fixfstab.sh
		
		touch /var/log/aet.log
		touch /var/log/aetna.flag
		touch /var/log/training.flag
	}

	### Updates ###
	#apt-get update
	#DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

	### Function Calls ###
	user=aetna-training
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
