#!/bin/bash

ext=$(hostname)
user=$(logname)

#SLC - AET - WEB1
FILE=/usr/src/IT_Files/Linux/logs/exts.txt
exec 3<&0
exec 0<$FILE
while read line
do
if [[ "$ext" == $line ]]; then
	 for D in /home/*; do
			 name=${D}
			 echo $name
				 cp -r /usr/src/IT_Files/Linux/new_defaults/aet/web1/Default $name/.config/google-chrome/
				 sleep 5
				 /usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
				 echo "Chrome seed copied."
	 done
		 touch /var/log/slc.flag
		 touch /var/log/aet.flag
		 touch /var/log/web1.flag
		 touch /var/log/drx_scraper.flag
	 echo $ext >> /usr/src/IT_Files/Linux/logs/test.log
fi
done
exec 0<&3

# SLC - AET - WEB2
FILE=/usr/src/IT_Files/Linux/logs/exts2.txt
exec 3<&0
exec 0<$FILE
while read line
do
	if [[ "$ext" == $line ]]; then
		for D in /home/*; do
				name=${D}
				echo $name
				cp -r /usr/src/IT_Files/Linux/new_defaults/aet/web2/Default $name/.config/google-chrome/
				sleep 5
				/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
		done
			touch /var/log/slc.flag
			touch /var/log/aet.flag
			touch /var/log/web2.flag
			touch /var/log/drx_scraper.flag
		echo $ext >> /usr/src/IT_Files/Linux/logs/test.log
	fi
done
exec 0<&3
