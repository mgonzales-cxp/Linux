#!/bin/bash

ext=$(hostname)

## Provo - DHCP
#hostname -I | grep "192.168.8."
#if [[ "$?" == "0" ]]; then
	#if [ ! -f /var/log/aet.flag ]; then
		#sudo touch /var/log/aet.flag
	#fi
	
	#if [ ! -f /var/log/drx_scraper.flag ]; then
		#echo "$(hostname) - $(hostname -I)" >> /usr/src/IT_Files/Linux/logs/test.log
	#fi
#fi

## Provo - Static
#hostname -I | grep "192.168.9."
#if [[ "$?" == "0" ]]; then
	#if [ ! -f /var/log/aet.flag ]; then
		#sudo touch /var/log/aet.flag
	#fi
	
	#if [ ! -f /var/log/drx_scraper.flag ]; then
		#echo "$(hostname) - $(hostname -I)" >> /usr/src/IT_Files/Linux/logs/test.log
	#fi
#fi

## SLC - 105
#hostname -I | grep "192.168.105."
#if [[ "$?" == "0" ]]; then
	#if [ ! -f /var/log/aet.flag ]; then
		#sudo touch /var/log/aet.flag
	#fi
	
	#if [ ! -f /var/log/drx_scraper.flag ]; then
		#echo "$(hostname) - $(hostname -I)" >> /usr/src/IT_Files/Linux/logs/test.log
	#fi
#fi

## SAT - 209
#hostname -I | grep "192.168.209."
#if [[ "$?" == "0" ]]; then
	#if [ ! -f /var/log/aet.flag ]; then
		#sudo touch /var/log/aet.flag
	#fi
	
	#if [ ! -f /var/log/drx_scraper.flag ]; then
		#echo "$(hostname) - $(hostname -I)" >> /usr/src/IT_Files/Linux/logs/test.log
	#fi
#fi

#hostname -I | grep "192.168.104."
#if [[ "$?" == "0" ]]; then
	#if [ ! -f /var/log/drx_scraper.flag ]; then
		#echo "$(hostname)" >> /usr/src/IT_Files/Linux/logs/test.log
	#fi
#fi

#if [ -f /var/log/aet.flag ] && [ ! -f /var/log/wlp.log ] && [ ! -f /var/log/drx_scraper.log ]; then
	#echo "$(hostname) is missing scraper." >> /usr/src/IT_Files/Linux/logs/test.log
#fi

#if [ ! -f /var/log/wlp.flag ] && [ ! -f /var/log/drx_scraper.flag ]; then
	#echo "$(hostname) is missing scraper." >> /usr/src/IT_Files/Linux/logs/test.log
#fi

for D in /home/*; do
	if [ "${D}" != "/home/tech" ] && [ "${D}" != "/home/tagent" ] && [ "${D}" != "/home/msabin" ]; then
		if [ ! -d "${D}/.config/google-chrome/Default/Extensions/inpppfgkabokpmklgokcllmjhmejpieo" ] && [ -f /var/log/aet.flag ]; then
			echo ${D}
			echo "$(hostname) - $(hostname -I)" > /usr/src/IT_Files/Linux/logs/scraper/$ext
		else
			echo "IT'S ELSE!"
		fi
	fi
done
