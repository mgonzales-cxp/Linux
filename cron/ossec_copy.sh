#!/bin/bash
# ossec_copy.sh
# Copies over site-specific ossec.conf

### Associative arrays
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

declare -A sites
sites=(
	[0]="hq"
	[1]="hq"
	[8]="provo"
	[9]="provo"
	[17]="roy"
	[19]="roy"
	[104]="tower"
	[105]="tower"
	[208]="sat"
	[209]="sat"
	)

### Loop through sensors array and get site string from sites array	
for i in ${!sensors[@]}; do
	#echo $i
	hostname -I | grep "192.168.$i"
	if [[ "$?" == "0" ]]; then
		location=$i
		echo "You are here: ${sites[$location]}"
		cp /usr/src/IT_Files/Linux/ossec/${sites[$location]}/ossec.conf /var/ossec/etc
		break
	fi
done