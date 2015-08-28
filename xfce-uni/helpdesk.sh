#!/bin/bash

echo ""

function Client()
{
	read -p "Is this for [w]lp or [a]et: " client
	
	if [[ "$client" == "a" ]]; then
		client="aet"
	elif [[ "$client" == "w" ]]; then
		client="wlp"
	else
		Client
	fi
}

Client

read -p "Enter web server: " web

for D in /home/*; do
	#if [ "${D}" != "/home/tech" ] && [ "${D}" != "/home/tagent" ]; then
		name=${D}
		echo $name
		#hostname -I | grep "192.168.16."
		#if [[ "$?" == "0" ]]; then
			cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/$client/web$web/* $name/.config/google-chrome/Default/
			sleep 1
			/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh "$name"
			echo "Chrome seed copied."
		#else
		#	echo "Not in Provo!"
		#fi
	#fi
done