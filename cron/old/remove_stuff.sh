#!/bin/bash

for f in /usr/share/applications/*; do
	if [[ "$f" != "/usr/share/applications/google-chrome.desktop" ]] && [[ "$f" != "/usr/share/applications/gcalctool.desktop" ]] && [[ "$f" != "/usr/share/applications/gedit.desktop" ]] && [[ "$f" != "/usr/share/applications/zoiper.desktop" ]] && [[ "$f" != "/usr/share/applications/libreoffice-calc.desktop" ]] && [[ "$f" != "/usr/share/applications/libreoffice-writer.desktop" ]] && [[ "$f" != "/usr/share/applications/firefox.desktop" ]] && [[ "$f" != "/usr/share/applications/skype.desktop" ]] && [[ "$f" != "/usr/share/applications/qpdfview.desktop" ]] && [[ "$f" != "/usr/share/applications/xfce4-screenshooter.desktop" ]]; then
		rm $f
	fi
done

#FILE=/usr/src/IT_Files/Linux/logs/removals.txt
#exec 3<&0
#exec 0<$FILE
#while read line
#do
#	for f in /usr/share/applications/*; do
#		if [[ "$line" != "$f" ]]; then
#			rm /usr/share/applications/*.desktop
#		fi
#	done
#done
#exec 0<&3

#	for f in /usr/share/applications/*; do
#		#echo $line
#		if [[ "$f" != "$line" ]]; then
#			rm $f
#			#echo $f
#		fi
#	done
