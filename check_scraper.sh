#!/bin/bash

if [ ! -f /var/log/drx_scraper.flag ] && [ -f /var/log/aet.flag ] && [ ! -f /var/log/wlp.flag ]; then
	clear
	echo "This computer is missing an essential update that must be installed immediately."
	echo "Please notify a tech ASAP as this station will log off momentarily!"
	sleep 30
	service mdm force-reload
	echo "DRx Scraper is missing." >> /var/log/scraper.log
fi
