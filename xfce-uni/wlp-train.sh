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
		
		echo "User is: anthem-training"
		echo "To finish setup: "
		echo -e "Launch both Chrome and Zoiper then click OK or YES to any pop-up windows."
		echo "Are you ready to proceed? Type 'yes' if ready."
		read proceed
		if [[ "$proceed" == "yes" ]]; then
			pkill zoiper
			pkill google-chrome
			sleep 2
			MountDrives 
		else
			Proceed 
		fi
	}

	function MountDrives()
	{
		# Create directories for mount locations	
		mkdir /usr/src/WellPoint_Training_Files
		
		# Credentials
		cp /usr/src/IT_Files/Linux/xfce-uni/creds/wlp_train/.smbcredentials /home/anthem-training/
		chmod 600 /home/anthem-training/.smbcredentials

		#Prevents writing extra fstab entries
		sed -i '/WLP/d' /etc/fstab
		sed -i '/PDF/d' /etc/fstab
		sed -i '/Aetna/d' /etc/fstab
		sed -i '/Coventry/d' /etc/fstab

		#Write client-specific fstab entries
		echo "//hal2.connexionpoint.com/WellPoint_Training_Files /usr/src/WellPoint_Training_Files cifs credentials=/home/anthem-training/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0" >> /etc/fstab
		
		mount -a

		# Create desktop links for WLP
		ln -s /usr/src/WellPoint_Training_Files /home/anthem-training/Desktop/Anthem_Training_Files
	}

	function Settings()
	{
		# Function to configure desktop environment for user

		# Create directories
		mkdir /home/anthem-training/.config/autostart
		mkdir /var/.copy/
		
		# Copy shortcuts and seeds from HAL
		cp -a /usr/src/IT_Files/Linux/xfce-uni/shortcuts/. /home/anthem-training/Desktop
		cp -a /usr/src/IT_Files/Linux/xfce-uni/seeds/Zoiper/Training/WLP-TLS/Sip1/* /home/anthem-training/.Zoiper/
		cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/anthem-training/.config/autostart
		cp /home/anthem-training/Desktop/Zoiper.desktop /home/anthem-training/.config/autostart/
		
		# Write Zoiper settings
		read -p "Enter extension: " ext
		/usr/src/IT_Files/Linux/xfce-uni/preferences/wlp-train-zoiper.sh "anthem-training" $ext

		# Call script to write Chrome bookmarks and preferences
		/usr/src/IT_Files/Linux/xfce-uni/preferences/wlp-train-chrome-prefs.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/screensaver.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/theme.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/start_menu.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/compositing.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/lockscreen.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh "anthem-training"
		sleep 2
		/usr/src/IT_Files/Linux/xfce-uni/preferences/mimelist.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/chrome-pref.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/pointers.sh "anthem-training"
		sleep 1
		/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
		sleep 1
		cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/wlp/training/* /home/anthem-training/.config/google-chrome/Default/
		echo ""
		echo "### You must manually add siebelprd1.wellpoint.com to Incognito Regex! ###"
		echo ""
		sleep 3
		xdg-mime default wfica.desktop application/x-ica
		
		# Remove home directory folders
		rm -r /home/anthem-training/Documents
		rm -r /home/anthem-training/Downloads
		rm -r /home/anthem-training/Music
		rm -r /home/anthem-training/Pictures		
		rm -r /home/anthem-training/Public
		rm -r /home/anthem-training/Templates
		rm -r /home/anthem-training/Videos
		
		rm /usr/share/xfce4/backdrops/*
		rm -r /usr/share/wallpapers/
		rm /usr/share/backgrounds/xfce/xfce-blue.jpg
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_anthem_3b.png /usr/share/xfce4/backdrops/linuxmint.png
		cp /usr/src/IT_Files/Linux/wallpaper/agent_background_anthem_3b.jpg /usr/share/backgrounds/xfce/xfce-blue.jpg
		
		# Opera seed
		#cp -r /usr/src/IT_Files/Linux/seeds/.opera /home/$(logname)/

		touch /var/log/wlp.log
		touch /var/log/anthem.flag
		touch /var/log/training.flag
		
		#sudo /usr/src/IT_Files/Linux/fixfstab.sh
		
		# User permissions
		#chmod 300 /home/anthem-training
	}

	### Updates ###
	#apt-get update
	#DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

	### Function Calls ###
	user=anthem-training
	Proceed $user
	Settings $user
	######################

	read -p "System must be rebooted for DESKTOP changes to take effect. Reboot? (y/n) " answer
	if [[ "$answer" == "y" ]]; then	
		echo ""	
		echo "### Rebooting system..."
		sleep 2
		reboot
	else
		exit 0
	fi
