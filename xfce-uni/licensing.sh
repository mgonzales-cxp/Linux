#!/bin/bash

### XFCE Licensing SETUP ###

# Check if profile exists
if id -u "licensing" >/dev/null 2>&1; then
    echo "Licensing profiles exists."
else
	sudo adduser myuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
	echo "myuser:password" | sudo chpasswd
	touch /var/log/licensing.flag
fi

function Settings()
{
	# Function to configure desktop environment for user

	# Create startup directory
	mkdir /home/licensing/.config/autostart

	# Copy shortcuts and seeds from HAL
	cp -a /usr/src/IT_Files/Linux/xfce-uni/shortcuts/google-chrome.desktop /home/licensing/Desktop
	cp -a /usr/src/IT_Files/Linux/xfce-uni/shortcuts/Notepad.desktop /home/licensing/Desktop
	cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/licensing/.config/autostart
	
	# Write Zoiper settings
	#read -p "Enter extension: " ext
	#read -p "Enter sip: " sip
	#/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-zoip.sh "licensing" $ext $sip

	# Call preference scripts
	/usr/src/IT_Files/Linux/xfce-uni/preferences/screensaver.sh "licensing"
	/usr/src/IT_Files/Linux/xfce-uni/preferences/theme.sh "licensing"
	/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "licensing"
	/usr/src/IT_Files/Linux/xfce-uni/preferences/compositing.sh "licensing"
	/usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "licensing"
	/usr/src/IT_Files/Linux/xfce-uni/preferences/lockscreen.sh "licensing"
	/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh "licensing"
	/usr/src/IT_Files/Linux/xfce-uni/preferences/mimelist.sh "licensing"
	/usr/src/IT_Files/Linux/xfce-uni/preferences/pointers.sh "licensing"
	sleep 3
	
	# Remove home directory folders
	rm -r /home/licensing/Documents
	rm -r /home/licensing/Music
	rm -r /home/licensing/Pictures
	rm -r /home/licensing/Public
	rm -r /home/licensing/Templates
	rm -r /home/licensing/Videos
	
	/usr/src/IT_Files/Linux/xfce-uni/preferences/start_menu.sh "licensing"
	
	reboot
}

### FUNCTION CALL ######################################################
if [ -f /var/log/training.flag ] && [ -f /var/log/licensing.flag ]; then
	Settings
else
	echo "Error. Function didn't run."
fi
########################################################################


