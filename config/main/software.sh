#!/bin/bash

function Software
{
	# Include Header
	source /usr/src/IT_Files/Linux/config/main/header.sh

	# Messages
	if [[ "$1" != "" ]]; then
		echo ""
		echo -e "Message:$COL_RED $1 $COL_RESET"
	fi
	
	echo ""
	echo -e "$COL_BLUE Software Installation $COL_RESET"
	echo -e "$COL_BLUE --------------------- $COL_RESET"
	echo -e "$COL_YELLOW 1. $COL_RESET LivePerson $COL_CYAN (do NOT run config.sh with root or sudo privileges in user profile)$COL_RESET"
	echo -e "$COL_YELLOW 2. $COL_RESET LivePerson Part 2 $COL_CYAN(run as root in user profile)$COL_RESET"
	echo -e "$COL_YELLOW 3. $COL_RESET Univention"
	echo -e "$COL_YELLOW 4. $COL_RESET AlienVault"
	echo -e "$COL_YELLOW 5. $COL_RESET Chrome (Fix) $COL_RED root $COL_RESET"
	echo -e "$COL_YELLOW 6. $COL_RESET Zoiper"
	echo -e "$COL_YELLOW 7. $COL_RESET Citrix $COL_RED root $COL_RESET"
	echo -e "$COL_YELLOW 8. $COL_RESET Wine 1.7"
	echo -e "$COL_YELLOW 9. $COL_RESET Back to Main Menu"
	echo -e "$COL_YELLOW 0. $COL_RESET Exit"
	echo -e "$COL_BLUE --------------------- $COL_RESET"
	read -p "Enter selection: " selection
	# Software - Option 1 - LivePerson Part 1
	if [[ "$selection" == "1" ]]; then
		if [[ "$EUID" == "0" ]]; then
			Software "Operation failed! Must run as standard user!"
		else		
			echo -e "$COL_RED # CANCEL ANY WINE PACKAGE INSTALLATIONS THAT POP UP $COL_RESET"
			echo ""
			echo -e "$COL_RED Uncheck ""Run LivePerson Agent Console"" at the end of the installation. Click Finish $COL_RESET"
			echo ""
			wine /usr/src/IT_Files/Linux/xfce-uni/software/LPAC_WIN.exe &>/dev/null
			if [ ! -d /home/$(logname)/.wine/drive_c/Program\ Files/LivePersonAgent ]; then
				Software "Installation failed. Scroll up to check log."
			else
				Software "LivePerson installed. Continue with part 2 in user profile."
			fi
		fi
	# Software - Option 2 - LiverPerson Part 2
	elif [[ "$selection" == "2" ]]; then
		if [[ "$EUID" != "0" ]]; then
			Software "Operation failed! You are not root!"
		else
			clear 

			echo -e "$COL_RED ### Remember to configure LivePerson by going to: $COL_RESET"
			echo ">> Configure Wine in the Start menu"
			echo ">> Applications tab"
			echo ">> Add Application"
			echo ">> Program Files (x86)"
			echo ">> LivePersonAgent"
			echo ">> LivePerson.exe"
			echo ">> Click OK"
			echo ">> Click LivePerson.exe"
			echo ">> Set to Windows 7 in Windows Version drop-down menu."
			echo ">> Click OK."
			echo "------------------------------------------------------"
			read -n1 -r -p "Press any key to continue..." key
			sudo echo '[Desktop Entry]
Version=1.0
Type=Application
Name=LivePerson
Comment=Launch LivePerson
Exec=wine "/home/'$(logname)'/.wine/drive_c/Program Files (x86)/LivePersonAgent/LivePerson.exe"
Icon=/usr/src/IT_Files/Linux/xfce-uni/preferences/DesktopShortcut.png
Path=/home/'$(logname)'/.wine/dosdevices/c:/Program Files (x86)/LivePersonAgent/
Terminal=false
StartupNotify=true' > /home/$(logname)/Desktop/LivePerson.desktop
			sudo chmod +x /home/$(logname)/Desktop/LivePerson.desktop
			Software "LivePerson installation complete."
	fi
	# Software - Option 3 - Univention
	elif [[ "$selection" == "3" ]]; then
		sudo /usr/src/IT_Files/Linux/univentionClientScript2.sh
		clear
		read -p "System must be rebooted for changes to take effect. Reboot? (y/n) " answer
		if [[ "$answer" == "y" ]]; then	
			echo ""	
			echo "### Rebooting system..."
			sleep 3
			reboot
		else
			exit 0
		fi
		if [ ! -d /etc/univention ]; then
			Software "Installation failed. Scroll up to check log."
		else	
			Software "Univention installation complete. Reboot for changes to take effect."
		fi	
	# Software - Option 4 - AlienVault
	elif [[ "$selection" == "4" ]]; then
		sudo apt-get install build-essential
		sudo /usr/src/IT_Files/Linux/xfce-uni/ossec-hids-2.8.1/install.sh
		if [ ! -d /var/ossec ]; then
			Software "Installation failed. Scroll up to check log."
		else	
			Software "AlienVault setup complete. Finish setup in the System Settings menu."
		fi
	# Software - Option 5 - Chrome Fix
	elif [[ "$selection" == "5" ]]; then
		if [[ "$EUID" != "0" ]]; then
			Software "Operation failed! You are not root!"
		else
			sudo /usr/src/IT_Files/Linux/chrome_fix.sh
			if [ ! -f /usr/bin/google-chrome ]; then
				Software "Installation failed. Scroll up to check log."
			else
				Software "Chrome fix applied."
			fi				
		fi
	# Software - Option 6 - Zoiper
	elif [[ "$selection" == "6" ]]; then
		sudo cp -a /usr/src/IT_Files/Linux/software/* /home/tech/Downloads
		sudo chmod a+x /home/tech/Downloads/Zoiper_3.3_Linux_Free_32Bit.run
		sudo /home/tech/Downloads/Zoiper_3.3_Linux_Free_32Bit.run --mode unattended --unattendedmodeui minimal
		sudo rm /usr/share/Zoiper/SkinRoundV2.zss /usr/share/Zoiper/SkinSilver.zss /usr/share/Zoiper/SkinSleek.zss
		sudo rm /home/tech/Desktop/Zoiper.desktop
		sudo cp /usr/src/IT_Files/Linux/xfce-uni/shortcuts/Zoiper.desktop /home/*/Desktop/Zoiper.desktop
		if [ ! -f /usr/bin/zoiper ]; then
			Software "Installation failed. Scroll up to check log."
		else
			Software "Zoiper installed."
		fi			
	# Software - Option 7 - Citrix
	elif [[ "$selection" == "7" ]]; then
		if [[ "$EUID" != "0" ]]; then
			Software "Operation failed! You are not root!"
		else
			sudo cp -a /usr/src/IT_Files/Linux/software/* /home/tech/Downloads
			file /sbin/init | grep "64-bit"
			if [[ "$?" == "0" ]]; then
				gdebi -n /usr/src/IT_Files/Linux/software/icaclient_13.1.0.285639_amd64.deb
				gdebi -n /usr/src/IT_Files/Linux/software/ctxusb_2.4.285639_amd64.deb
				if [ ! -d /etc/icaclient ]; then
					Software "Installation failed. Scroll up to check log."
				else	
					Software "Citrix 64-bit installation complete."
				fi
			elif [[ "$?" == "1" ]]; then
				gdebi -n /usr/src/IT_Files/Linux/software/ctxusb_2.4.285639_i386.deb
				gdebi -n /usr/src/IT_Files/Linux/software/icaclient_13.1.0.285639_i386.deb
				if [ ! -d /etc/icaclient ]; then
					Software "Installation failed. Scroll up to check log."
				else	
					Software "Citrix 32-bit installation complete."
				fi
			fi
		fi
	# Software - Option 8 - Wine
	elif [[ "$selection" == "8" ]]; then
		sudo apt-get install wine1.7 -y
		sudo /usr/src/IT_Files/Linux/xfce-uni/preferences/wine-addons.sh
		if [ ! -f /usr/bin/wine ]; then
			Software "Installation failed. Scroll up to check log."
		else
			Software "Wine 1.7 installed."
		fi
	elif [[ "$selection" == "9" ]]; then
		$main
	elif [[ "$selection" == "0" ]] || [[ "$selection" == "exit" ]] || [[ "$selection" == "quit" ]] || [[ "$selection" == "q" ]] || [[ "$selection" == "Q" ]]; then
		clear
		exit 0
	else
		Software "$selection: Unrecognized command."
	fi
}

### FUNCTION CALL ######################################################
Software
########################################################################
