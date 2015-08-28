#!/bin/bash

ext=$(hostname)
user=$(logname)
ip=$(hostname -I)

function HQ() {

	declare -A HQExtensions=(
							[192.168.0.107]="tech-VirtualBox-HQ"
							[192.168.0.106]="tech-2"
							[192.168.0.105]="tech-3"
							[192.168.0.104]="tech-4"
							[192.168.0.110]="tech-5"
							)

	for i in ${!HQExtensions[@]}; do
		if [[ $ip =~ $i ]]; then
			return_hostname=${HQExtensions[$i]}
			echo -e "$COL_GREEN Success!$COL_RESET $COL_MAGENTA$i$COL_RESET found in HQExtensions array"
			echo -e "$COL_GREEN Hostname is:$COL_RESET $COL_MAGENTA$return_hostname$COL_RESET"
			break
		else
			echo "Error."
		fi
	done
}

hostname -I | grep "192.168.0." &>/dev/null
if [[ "$?" == "0" ]]; then
	HQ
fi


#tech-VirtualBox-HQ
