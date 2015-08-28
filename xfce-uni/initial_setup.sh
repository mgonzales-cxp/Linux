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

if [ ! -d "/usr/src/IT_Files" ]; then
	echo -e "$COL_RED IT_Files mount doesn't exist. Attempting to create... $COL_RESET"
	sleep 2
	sudo mkdir /usr/src/IT_Files
	sudo sed -i '/IT_Files/d' /etc/fstab #Prevents writing extra fstab entries
	sudo echo "//hal2.connexionpoint.com/IT_Files /usr/src/IT_Files cifs guest,uid=1000,iocharset=utf8,nobootwait  0  0" >> /etc/fstab

	sudo mount -a
	sleep 2

	clear
elif [ -d "/usr/src/IT_Files" ]; then
	echo -e "$COL_GREEN IT_Files mount exists! $COL_RESET"
	sleep 2
fi

# Desktop Permissions
	
	echo "### Changing tech desktop permissions..."
	chown tech:tech /home/tech/Desktop
	chown tech:tech /home/tech/Desktop/*

# Repositories
	
	echo ""
	echo "### Adding respositories..."
	echo ""
	
	#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
	#sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	#add-apt-repository ppa:savoirfairelinux ### FOR SFL PHONE
	#add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
	#add-apt-repository "deb http://archive.canonical.com/ precise partner"
	add-apt-repository "ppa:ubuntu-wine/ppa" -y
	#add-apt-repository "ppa:yubico/stable"
	
# Update Mint
	
	echo ""
	echo -e "### $COL_GREEN Updating Mint. This takes a while..."
	echo ""
	
	echo ""
	echo -e "### $COL_GREEN apt-get update... $COL_RESET"
	echo ""
	apt-get update &>/dev/null
	
	echo ""
	echo -e "### $COL_GREEN Removing software... $COL_RESET"
	apt-get purge firefox gimp gthumb hexchat libreoffice-draw thunderbird transmission-* pidgin banshee brasero totem -y &>/dev/null
	#apt-get dist-upgrade -y #(when prompted, enter 'y' for the new package)
	
	# dist-upgrade with no prompts
	echo -e "### $COL_RED dist-upgrade. This can take 20-30 minutes. $COL_RESET"
	DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade &>/dev/null

# Mounts

	echo ""
	echo "### Creating Directory/Mount"
	echo ""

	mkdir /usr/src/IT_Files
	sed -i '/IT_Files/d' /etc/fstab #Prevents writing extra fstab entries
	echo "//hal2.connexionpoint.com/IT_Files /usr/src/IT_Files cifs guest,uid=1000,iocharset=utf8,nobootwait  0  0" >> /etc/fstab

	mount -a

# Installs
	
	echo ""
	echo "### Installing software..."
	echo ""	
	
	apt-get install vim openssh-server build-essential clamav x11vnc libxerces-c3.1 qpdfview wine1.7 xclip -y &>/dev/null #sflphone-gnome google-chrome-stable 
	
	# Install Zoiper and remove skins, tech icon
	gdebi -n /usr/src/IT_Files/Linux/software/google-chrome.deb &>/dev/null
	/usr/src/IT_Files/Linux/software/Zoiper_3.3_Linux_Free_32Bit.run --mode unattended --unattendedmodeui minimal &>/dev/null
	rm /usr/share/Zoiper/SkinRoundV2.zss /usr/share/Zoiper/SkinSilver.zss /usr/share/Zoiper/SkinSleek.zss &>/dev/null
	rm /home/tech/Desktop/Zoiper.desktop &>/dev/null

	# Install Citrix packages for 64-Bit or 32-Bit
	file /sbin/init | grep "64-bit"
	if [[ "$?" == "0" ]]; then
		gdebi -n /usr/src/IT_Files/Linux/software/icaclient_13.1.0.285639_amd64.deb  &>/dev/null
		gdebi -n /usr/src/IT_Files/Linux/software/ctxusb_2.4.285639_amd64.deb &>/dev/null
	elif [[ "$?" == "1" ]]; then
		gdebi -n /usr/src/IT_Files/Linux/software/ctxusb_2.4.285639_i386.deb &>/dev/null
		gdebi -n /usr/src/IT_Files/Linux/software/icaclient_13.1.0.285639_i386.deb &>/dev/null
	fi

	#cp -a /usr/src/IT_Files/Linux/software/* /home/tech/Downloads &>/dev/null
	#gdebi -n /home/tech/Downloads/google-chrome-stable_41.0.2272.101-1_i386.deb &>/dev/null
	#file /sbin/init | grep "64-bit" &>/dev/null
	#if [[ "$?" == "0" ]]; then
		#gdebi -n /home/tech/Downloads/opera-stable_28.0.1750.51_amd64.deb
	#	gdebi -n /home/tech/Downloads/icaclient_13.1.0.285639_amd64.deb &>/dev/null
	#	gdebi -n /home/tech/Downloads/ctxusb_2.4.285639_amd64.deb &>/dev/null
	#elif [[ "$?" == "1" ]]; then
	#	echo "blank"
	#fi
	#chmod a+x /home/tech/Downloads/Zoiper_3.3_Linux_Free_32Bit.run &>/dev/null
	#/home/tech/Downloads/Zoiper_3.3_Linux_Free_32Bit.run --mode unattended --unattendedmodeui minimal &>/dev/null

### SYSTEM PREFERENCES ###

# Yubikey Rules
	touch /etc/udev/rules.d/70-u2f.rules &>/dev/null

	echo 'ACTION!="add|change", GOTO="u2f_end"

KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1050", ATTRS{idProduct}=="0113|0114|0115|0116|0120|0402|0403|0406|0407|0410", TAG+="uaccess"

LABEL="u2f_end"' > /etc/udev/rules.d/70-u2f.rules

# Launcher Script

	#cp /usr/src/IT_Files/Linux/HelpDesk/launcher/hd.sh /usr/bin/

# Wine Gecko and Mono packages

	echo ""
	echo "### Installing Wine add-ons. This one'll take a while..."
	echo ""
	 
	/usr/src/IT_Files/Linux/xfce-uni/preferences/wine-addons.sh &>/dev/null

# x11vnc

	echo ""
	echo "!!! Please enter tech password for VNC !!!"
	echo ""

	x11vnc -storepasswd
	
# Crontab

	echo ""
	echo "Please paste line from text at the BOTTOM of on the file. When done, close notepad, press CTRL+O in terminal to save, and CTRL+X to exit."
	echo ""

	sleep 1
	gedit /usr/src/IT_Files/Linux/documents/crontab.txt
	crontab -e

# Network Update
	
	echo ""		
	echo "### Installing network update..."
	echo ""
	
	mkdir /home/tech/.config/autostart
	cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/tech/.config/autostart &>/dev/null

# Change MDM login theme

	echo ""
	echo "### Changing login theme..."
	echo ""	
	
	cp -p /usr/src/IT_Files/Linux/xfce-uni/preferences/mdm/mdm-arc-wine.conf /etc/mdm/mdm.conf &>/dev/null
	cp /usr/src/IT_Files/Linux/xfce-uni/preferences/mdm/bg.png /usr/share/mdm/themes/Arc-Wine/ &>/dev/null

# Wallpaper for tech

	echo ""	
	echo "### Updating wallpaper..."
	echo ""
	
	#mv /usr/share/backgrounds/linuxmint/default_background.jpg /usr/share/backgrounds/linuxmint/default_backgroundBAK.jpg
	#cp /usr/src/IT_Files/Linux/xfce-uni/preferences/mdm/bg.png /usr/share/backgrounds/linuxmint/default_background.jpg
	#/usr/src/IT_Files/Linux/xfce-uni/preferences/set_wallpaper.sh

	rm /usr/share/xfce4/backdrops/* &>/dev/null
	rm -r /usr/share/wallpapers/ &>/dev/null
	rm /usr/share/backgrounds/xfce/xfce-blue.jpg &>/dev/null
	cp /usr/src/IT_Files/Linux/wallpaper/agent_background_cXp_1.png /usr/share/xfce4/backdrops/linuxmint.png &>/dev/null
	cp /usr/src/IT_Files/Linux/wallpaper/agent_background_cXp_1.jpg /usr/share/backgrounds/xfce/xfce-blue.jpg &>/dev/null

# Theme

	echo ""
	echo "### Setting up desktop theme..."
	echo ""

	/usr/src/IT_Files/Linux/xfce-uni/preferences/theme.sh "tech" &>/dev/null

# Tech Symbolic Links

	echo ""	
	echo "### Creating symbolic links..."
	echo ""

	ln -s /usr/src/IT_Files/ /home/tech/Desktop/IT_Files &>/dev/null
	ln -s /usr/src/IT_Files/Linux /home/tech/Desktop/Linux &>/dev/null

# Chrome Default

	echo ""
	echo "### Set Chrome as default..."
	echo ""

	/usr/src/IT_Files/Linux/xfce-uni/preferences/chrome_default.sh &>/dev/null

# CRON

	echo ""	
	echo "### Creating CRON jobs..."
	echo ""
	
	echo '00 03 * * * root /usr/src/IT_Files/Linux/cron/nightly.sh' >> /etc/crontab
	echo '*/5 * * * * root /usr/src/IT_Files/Linux/cron/nao.sh' >> /etc/crontab
	#echo '@reboot /usr/src/IT_Files/Linux/cron/reboot.sh' >> /etc/crontab

# Start button

	echo ""
	echo "### Setting start button..."
	echo ""
	
	/usr/src/IT_Files/Linux/xfce-uni/preferences/start_menu.sh "tech" &>/dev/null

# Screensaver

	echo ""
	echo "### Adjusting screensaver..."
	echo ""
	
	/usr/src/IT_Files/Linux/xfce-uni/preferences/screensaver.sh "tech" &>/dev/null
	
# Lockscreen

	echo ""
	echo "### Configuring lockscreen..."
	echo ""
	
	/usr/src/IT_Files/Linux/xfce-uni/preferences/lockscreen.sh "tech" &>/dev/null

# Tech shortcuts

	echo ""
	echo "### Placing shortcuts..."
	echo ""
	
	cp /usr/src/IT_Files/Linux/xfce-uni/shortcuts/google-chrome.desktop /home/tech/Desktop &>/dev/null
	cp /usr/src/IT_Files/Linux/xfce-uni/shortcuts/Notepad.desktop /home/tech/Desktop &>/dev/null

# Turn USB off

	echo ""
	echo "### Turning USB drive access off..."
	echo ""
	
	/usr/src/IT_Files/Linux/usb_off.sh "- initial setup" &>/dev/null

### TESTING ######################

# ICA File Association

	xdg-mime default wfica.desktop application/x-ica &>/dev/null

##################################

# Blacklist

	echo ""
	echo "### Calling blacklist/name update script..."
	echo ""
	
	/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
	
# Firewall

	echo ""
	echo "### Setting up firewall..."
	echo ""
	
	ufw enable &>/dev/null
	ufw allow 5901 &>/dev/null
	ufw allow 22 &>/dev/null
	
# SAT DNS fix

#	read -p "Apply DNS?(y/n) " sat
#	if [[ "$sat" == "y" ]]; then
#		echo "### Fixing DNS"
	#/usr/src/IT_Files/Linux/satdns.sh &>/dev/null
#	fi
	
# Update BASH

	cp /usr/src/IT_Files/Linux/xfce-uni/preferences/bash.bashrc /etc/ &>/dev/null

# Panel

	/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh "tech"
	
# Remove initial_setup.sh from desktop

	echo ""
	echo "### Removing setup script..."
	echo ""
	
	rm /home/tech/Desktop/initial_setup.sh &>/dev/null
	rm /home/tech/Desktop/config.sh &>/dev/null
	
	echo ""
	
# Fix fstab

	#sudo /usr/src/IT_Files/Linux/fixfstab.sh
	
# Set IP

	read -p "Set IP address as [s]tatic or [d]ynamic?: " IP
	
	if [[ "$IP" == "s" ]]; then
		/usr/src/IT_Files/Linux/xfce-uni/preferences/static.sh
	elif [[ "$IP" == "d" ]]; then
		/usr/src/IT_Files/Linux/xfce-uni/preferences/dhcp.sh
	fi
	
# Screensaver Settings

	/usr/src/IT_Files/Linux/cron/screensaver_cron.sh "/home/tech"
	/usr/src/IT_Files/Linux/cron/ss_be_gone.sh

# Initial setup flag

	touch /var/log/initial_setup.flag

# Restart Desktop Environment

	read -p "System must be rebooted for DESKTOP changes to take effect. Reboot? (y/n) " answer
	if [[ "$answer" == "y" ]]; then	
		echo ""	
		echo "### Rebooting system..."
		sleep 3
		reboot
	else
		exit 0
	fi
