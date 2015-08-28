#!/bin/bash
# deploy_ossec.sh
#   Script has an error writing to ossec.conf.
#   Correct ossec.conf file is copied over 
#   via ossec_copy.sh during nightly.

ext=$(hostname)

if [[ "$1" == "rmv" ]]; then
	echo "Removing OSSEC agent..."
	echo ""
	sleep 1
	apt-get purge ossec-hids-agent -y
	echo ""
	echo "Removing /var/ossec..."
	echo ""
	sleep 1
	rm -r /var/ossec
	exit 0
fi

function OSSEC()
{
	# Declare associative array for AlienVault sensors and assign keys and values
		
	declare -A sensors
	sensors=(
		[0]=192.168.1.9 
		[1]=192.168.1.9 
		[9]=192.168.8.9 
		[17]=192.168.16.9 
		[104]=192.168.106.16 
		[105]=192.168.106.16 
		[208]=192.168.210.9 
		[209]=192.168.210.9
		)

	# Loop through each key in sensors array, check if IP matches then break loop
		
	for i in ${!sensors[@]}; do
		#echo $i
		hostname -I | grep "192.168.$i"
		if [[ "$?" == "0" ]]; then
			location=$i
			break
		fi
	done

	# Echo output and store location in variable
		
	echo "Location is: $location"
	usm_sensor_ip=${sensors[$location]}
	#echo $usm_sensor_ip
	echo "USM Sensor IP: $usm_sensor_ip"
	echo ""
	sleep 2
		
	### Main Script ####################################################

	apt-key adv --fetch-keys http://ossec.wazuh.com/repos/apt/conf/ossec-key.gpg.key
	echo "apt-get key added successfully"

	repo_added=0
	while read line
	do
	  if [[ $line =~ wazuh ]]; then
		repo_added=1
		echo "apt-get wazuh repository already existed"
	  fi
	done < /etc/apt/sources.list

	if [ "$repo_added" -eq "0" ]; then
	  echo 'deb http://ossec.wazuh.com/repos/apt/ubuntu trusty main' >> /etc/apt/sources.list
	  echo "wazuh repository added successfully"
	fi

	apt-get update
	#DEBIAN_FRONTEND=noninteractive apt-get -y install ossec-hids-agent
	#DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install ossec-hids-agent
	DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" install ossec-hids-agent

	sed -i "s/<server-ip>127.0.0.1<\/server-ip>/<server-ip>${usm_sensor_ip}<\/server-ip>/" /var/ossec/etc/ossec.conf

	if [ ! -f /var/ossec/etc/client.keys ]; then
	  /var/ossec/bin/agent-auth -m ${usm_sensor_ip}
	fi
	/var/ossec/bin/ossec-control restart
	echo "agent installed and running"
}

### FUNCTION CALL ######################################################
if [ ! -d /var/ossec/ ]; then
	echo "OSSEC not installed. Running now..."
	OSSEC
	echo "$ext $(hostname -I) OSSEC" >> /usr/src/IT_Files/Linux/logs/ossec.log
elif [[ "$1" == "force" ]]; then
	OSSEC
	echo "$ext $(hostname -I) OSSEC" >> /usr/src/IT_Files/Linux/logs/ossec.log
	exit 0
else
	echo "OSSEC folder already exists."
	#echo "$ext OSSEC already installed." >> /usr/src/IT_Files/Linux/logs/test.log
fi
########################################################################
	
