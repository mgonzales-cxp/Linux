#!/bin/bash 

if [ ! -f /home/$(logname)/.aet_profiled.flag ] && [ -f /var/log/aet.flag ]; then
	/usr/src/IT_Files/Linux/xfce-uni/aet_test.sh
	cp /usr/src/IT_Files/Linux/cron/profile_setup.sh /usr/bin/
elif  [ ! -f /home/$(logname)/.wlp_profiled.flag ] && [ -f /var/log/wlp.flag ]; then
	echo "WLP coming soon."
fi
