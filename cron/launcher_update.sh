##!/bin/bash

#### UNCOMMENT AND COMMENT OUT FOR LOOPS AS NEEDED ######################

# SAT - AET - WEB 3
if [ ! -f /var/log/drx_scraper.flag ]; then
	if [ -f /var/log/aet.flag ]; then
		for D in /home/*; do
			#if [ "${D}" != "/home/tech" ] && [ "${D}" != "/home/tagent" ]; then
				name=${D}
				echo $name
				hostname -I | grep "192.168.209."
				if [[ "$?" == "0" ]]; then
					cp -r /usr/src/IT_Files/Linux/new_defaults/aet/web3/Default $name/.config/google-chrome/
					sleep 5
					/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
					echo "Chrome seed copied."
					touch /var/log/sat.flag
					touch /var/log/aet.flag
					touch /var/log/web3.flag
					touch /var/log/drx_scraper.flag
				else
					echo "!"
				fi
			#fi
		done
	fi
fi

# SAT - AET - WEB 3
if [ ! -f /var/log/drx_scraper.flag ]; then
	if [ -f /var/log/aet.flag ]; then
		for D in /home/*; do
			#if [ "${D}" != "/home/tech" ] && [ "${D}" != "/home/tagent" ]; then
				name=${D}
				echo $name
				hostname -I | grep "192.168.210."
				if [[ "$?" == "0" ]]; then
					cp -r /usr/src/IT_Files/Linux/new_defaults/aet/web3/Default $name/.config/google-chrome/
					sleep 5
					/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
					echo "Chrome seed copied."
					touch /var/log/sat.flag
					touch /var/log/aet.flag
					touch /var/log/web3.flag
					touch /var/log/drx_scraper.flag
				else
					echo "!"
				fi
			#fi
		done
	fi
fi

## SAT - WLP - WEB 3
##for D in /home/*; do
##		name=${D}
##		echo $name
##		hostname -I | grep "192.168.208."
##		if [[ "$?" == "0" ]]; then
##			cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/wlp/web3/* $name/.config/google-chrome/Default/
##			sleep 5
##			/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
##			echo "Chrome seed copied."
##			touch /var/log/5-20-15.log
##			touch /var/log/sat-wlp-web3.flag
##		else
##			echo "!"
##		fi
##done

## ROY - WLP - DHCP WEB 2
##for D in /home/*; do
##		name=${D}
##		echo $name
##		hostname -I | grep "192.168.19."
##		if [[ "$?" == "0" ]]; then
##			cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/wlp/web2/* $name/.config/google-chrome/Default/
##			sleep 5
##			/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
##			echo "Chrome seed copied."
##			touch /var/log/5-20-15.log
##			touch /var/log/roy-wlp-web2.flag
##		else
##			echo "!"
##		fi
##done

## ROY - WLP - STATIC WEB 2
##for D in /home/*; do
##		name=${D}
##		echo $name
##		hostname -I | grep "192.168.17."
##		if [[ "$?" == "0" ]]; then
##			cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/chrome/wlp/web2/* $name/.config/google-chrome/Default/
##			sleep 5
##			/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
##			echo "Chrome seed copied."
##			touch /var/log/5-20-15.log
##			touch /var/log/roy-wlp-web2.flag
##		else
##			echo "!"
##		fi
##done

# PROVO - AET - WEB 2
if [ ! -f /var/log/drx_scraper.flag ]; then
	if [ -f /var/log/aet.flag ]; then
		for D in /home/*; do
			#if [ "${D}" != "/home/tech" ] && [ "${D}" != "/home/tagent" ]; then
				name=${D}
				echo $name
				hostname -I | grep "192.168.9."
				if [[ "$?" == "0" ]]; then
					cp -r /usr/src/IT_Files/Linux/new_defaults/aet/web2/Default $name/.config/google-chrome/
					sleep 5
					/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
					echo "Chrome seed copied."
					touch /var/log/provo.flag
					touch /var/log/aet.flag
					touch /var/log/web2.flag
					touch /var/log/drx_scraper.flag
				else
					echo "!"
				fi
			#fi
		done
	fi
fi

# SLC - AET - WEB 1
if [ ! -f /var/log/drx_scraper.flag ] && [ -f /var/log/aet.flag ]; then
	for D in /home/*; do
		#if [ "${D}" != "/home/tech" ]; then
			name=${D}
			echo $name
			hostname -I | grep "192.168.105."
			if [[ "$?" == "0" ]]; then
				cp -r /usr/src/IT_Files/Linux/new_defaults/aet/web1/Default $name/.config/google-chrome/
				sleep 5
				/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
				echo "Chrome seed copied."
				touch /var/log/slc.flag
				touch /var/log/aet.flag
				touch /var/log/web1.flag
				touch /var/log/drx_scraper.flag
			else
				echo "SLC. Aet. Web 1. Did not run."
			fi
		#fi
	done
fi

# SLC - AET - WEB 1
for D in /home/*; do
	#if [ "${D}" != "/home/tech" ]; then
		name=${D}
		echo $name
		hostname -I | grep "192.168.105."
		if [[ "$?" == "0" ]]; then
			cp -r /usr/src/IT_Files/Linux/new_defaults/aet/web1/Default $name/.config/google-chrome/
			sleep 5
			/usr/src/IT_Files/Linux/xfce-uni/preferences/panel-test.sh $name
			echo "Chrome seed copied."
			touch /var/log/slc.flag
			touch /var/log/aet.flag
			touch /var/log/web1.flag
			touch /var/log/drx_scraper.flag
		else
			echo "SLC. Aet. Web 1. Did not run."
		fi
	#fi
done