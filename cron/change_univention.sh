#!/bin/bash

ext=$(hostname)
user=$(logname)

# Read extensions by file

	# FILE=/usr/src/IT_Files/Linux/cron/univention_ext_list.txt
	# # read $FILE using the file descriptors
	# exec 3<&0
	# exec 0<$FILE
	# while read line
	# do
	# 	#use $line variable to process line
	# 	if [[ "$ext" == $line ]]; then
	# 		/usr/src/IT_Files/Linux/local_ldap_config_2.sh
	# 		echo "$ext" >> /usr/src/IT_Files/Linux/logs/test.log
	# 	else
	# 		message="Not in valid IP range!"
	# 	fi
	# done
	# exec 0<&3
	
	# echo $message

# Deploy by IP
	
	### Provo - Static
	hostname -I | grep "192.168.9."
	if [[ "$?" == "0" ]]; then
		cat /etc/resolvconf/resolv.conf.d/head | grep "192.168.8.19"
		if [[ "$?" != "0" ]]; then
			echo "Provo static disabled"
			/usr/src/IT_Files/Linux/local_ldap_config_2.sh
			echo "$ext" >> /usr/src/IT_Files/Linux/logs/test.log
		else
			echo "DNS already added to /etc/resolvconf/resolv.conf.d/head"
			exit 0
		fi
	else
		message="Not in valid IP range!"
	fi

	### Roy - Static
	hostname -I | grep "192.168.17."
	if [[ "$?" == "0" ]]; then
		cat /etc/resolvconf/resolv.conf.d/head | grep "192.168.16.19"
		if [[ "$?" != "0" ]]; then
			#echo "Roy static disabled"
			/usr/src/IT_Files/Linux/local_ldap_config_2.sh
			echo "$ext" >> /usr/src/IT_Files/Linux/logs/test.log
		else
			echo "DNS already added to /etc/resolvconf/resolv.conf.d/head"
			exit 0
		fi
	else
		message="Not in valid IP range!"
	fi
	
	### Roy - DHCP
	hostname -I | grep "192.168.19."
	if [[ "$?" == "0" ]]; then
		cat /etc/resolvconf/resolv.conf.d/head | grep "192.168.16.19"
		if [[ "$?" != "0" ]]; then
			#echo "Roy DHCP disabled."
			/usr/src/IT_Files/Linux/local_ldap_config_2.sh
			echo "$ext" >> /usr/src/IT_Files/Linux/logs/test.log
		else
			echo "DNS already added to /etc/resolvconf/resolv.conf.d/head"
			exit 0
		fi
	else
		message="Not in valid IP range!"
	fi
	
	
	### SLC - 104 
	hostname -I | grep "192.168.104."
	if [[ "$?" == "0" ]]; then
		cat /etc/resolvconf/resolv.conf.d/head | grep "192.168.106.19"
		if [[ "$?" != "0" ]]; then
			#echo "SLC 104 disabled"
			/usr/src/IT_Files/Linux/local_ldap_config_2.sh
			echo "$ext" >> /usr/src/IT_Files/Linux/logs/test.log
		else
			echo "DNS already added to /etc/resolvconf/resolv.conf.d/head"
			exit 0
		fi
	else
		message="Not in valid IP range!"
	fi


	### SLC - 105
	hostname -I | grep "192.168.105."
	if [[ "$?" == "0" ]]; then
		cat /etc/resolvconf/resolv.conf.d/head | grep "192.168.106.19"
		if [[ "$?" != "0" ]]; then
			#echo "SLC 105 disabled"
			/usr/src/IT_Files/Linux/local_ldap_config_2.sh
			echo "$ext" >> /usr/src/IT_Files/Linux/logs/test.log
		else
			echo "DNS already added to /etc/resolvconf/resolv.conf.d/head"
			exit 0
		fi
	else
		message="Not in valid IP range!"
	fi
