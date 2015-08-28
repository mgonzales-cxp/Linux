#!/bin/bash

# Provo - DHCP
# hostname -I | grep "192.168.8."
# if [[ "$?" == "0" ]]; then
# 	if [ ! -f /var/log/aet.flag ]; then
# 		sudo touch /var/log/aet.flag
# 	fi
# fi

# # Provo - Static
# hostname -I | grep "192.168.9."
# if [[ "$?" == "0" ]]; then
# 	if [ ! -f /var/log/aet.flag ]; then
# 		sudo touch /var/log/aet.flag
# 	fi
# fi

# # SLC - 105
# hostname -I | grep "192.168.105."
# if [[ "$?" == "0" ]]; then
# 	if [ ! -f /var/log/aet.flag ]; then
# 		sudo touch /var/log/aet.flag
# 	fi
# fi

# # SAT - 209
# hostname -I | grep "192.168.209."
# if [[ "$?" == "0" ]]; then
# 	if [ ! -f /var/log/aet.flag ]; then
# 		sudo touch /var/log/aet.flag
# 	fi
# fi

# if [ -f /var/log/aet.flag ] && [ ! -f /var/log/drx_scraper.flag ]; then
# 	touch /usr/src/IT_Files/Linux/logs/scraper/$hostname.log
# fi

# for D in /home/*; do
# 	if [ "${D}" != "/home/tech" ] && [ -f /var/log/aet.flag ] && [ ! -d ${D}/.config/google-chrome/Default/Extensions/inpppfgkabokpmklgokcllmjhmejpieo/ ] && [ ! -f /var/log/scraper_check.flag ]; then
# 		echo "Scraper is missing"
# 		touch /usr/src/IT_Files/Linux/logs/scraper_missing/$hostname.log
# 		echo "$(hostname) - $(hostname -I) - $(date)" > /usr/src/IT_Files/Linux/logs/scraper_missing/$(hostname).log
# 		touch /var/log/scraper_check.flag
# 	fi
# 	if [ "${D}" != "/home/tech" ] && [ -f /var/log/drx_scraper.flag ] && [ -d ${D}/.config/google-chrome/Default/Extensions/inpppfgkabokpmklgokcllmjhmejpieo/ ] && [ ! -f /var/log/scraper_check.flag ]; then
# 		echo "All conditions met!"
# 		touch /usr/src/IT_Files/Linux/logs/scraper/$hostname.log
# 		echo "$(hostname) - $(hostname -I) - $(date)" > /usr/src/IT_Files/Linux/logs/scraper/$(hostname).log
# 		touch /var/log/scraper_check.flag
# 	fi
# done

# rm /var/log/scraper_check.flag