#!/bin/bash

client=$1

for D in /home/*; do
	if [ "${D}" != "/home/tech" ] && [ "${D}" != "/home/tagent" ]; then
		name=${D}
		echo $name
	fi
done

function CopyShortcut()
{
	sudo cp /usr/src/IT_Files/Linux/xfce-uni/cpxe/$client/web$web/CallProXE.desktop $name/Desktop
}

function Main()
{
	read -p "Enter web server: " web

	if [[ "$client" == "TLS" ]]; then
		if [[ "$web" == "1" ]]; then
			CopyShortcut $name			
		elif [[ "$web" == "2" ]]; then
			CopyShortcut $name
		elif [[ "$web" == "3" ]]; then
			CopyShortcut $name
		else
			echo "Web server $web isn't available."
			Main
		fi
	fi
}

Main
