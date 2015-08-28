#!/bin/bash

# Live Person Install

	function LivePerson()
	{	
		apt-get install wine1.7
		
		/usr/src/IT_Files/Linux/xfce-uni/preferences/wine-addons.sh
		
		# Install LivePerson
		#wine /usr/src/IT_Files/Linux/xfce-uni/software/LPAC_WIN.exe
		echo ""
		echo "### Install LivePerson by entering into a new terminal WITHOUT superuser privileges: "
		echo ""
		echo "wine /usr/src/IT_Files/Linux/xfce-uni/software/LPAC_WIN.exe"
		echo ""
		echo "# CANCEL ANY WINE PACKAGE INSTALLATIONS THAT POP UP"
		echo ""
		echo "Uncheck ""Run LivePerson Agent Console"" at the end of the installation. Click Finish"
		echo ""
		echo "### Remember to configure LivePerson by going to:"
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

		echo '[Desktop Entry]
Version=1.0
Type=Application
Name=LivePerson
Comment=Launch LivePerson
Exec=wine "/home/'$(logname)'/.wine/drive_c/Program Files (x86)/LivePersonAgent/LivePerson.exe"
Icon=/usr/src/IT_Files/Linux/xfce-uni/preferences/DesktopShortcut.png
Path=/home/'$(logname)'/.wine/dosdevices/c:/Program Files (x86)/LivePersonAgent/
Terminal=false
StartupNotify=true' > /home/$(logname)/Desktop/LivePerson.desktop
		chmod +x /home/$(logname)/Desktop/LivePerson.desktop
		read -n1 -r -p "Press any key to continue..." key
		echo "### LivePerson installation complete."
	}

LivePerson
