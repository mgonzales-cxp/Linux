#!/bin/bash
ext=$(hostname)
user=$(logname)

# echo "Hostname is: $ext"
# echo "User is: $user"

counter=0
foldersArray=()
for i in /home/*; do
	folder_name=${i:6}
	echo $folder_name
	foldersArray+=("$folder_name")
	#((counter++))
done

for i in ${foldersArray[@]}; do
	who | grep ${foldersArray[$i]}
	if [[ "${foldersArray[$i]}" != "tech" ]] && [[ "$?" == "0" ]]; then

		if [ ! -f /home/$i/.aet_profiled.flag ] && [ -f /var/log/aet.flag ]; then
			/usr/src/IT_Files/Linux/xfce-uni/aet_test.sh $i
			cp /usr/src/IT_Files/Linux/cron/profile_setup.sh /usr/bin/
			new_setup=1
		elif  [ ! -f /home/$folder_name/.wlp_profiled.flag ] && [ -f /var/log/wlp.flag ]; then
		echo "WLP coming soon."
		new_setup=1
		fi	
	fi
done

if [ $new_setup == 1 ]; then
	reboot
	exit 0
fi

# if [ ! -f /home/$user/.aet_profiled.flag ] && [ -f /var/log/aet.flag ]; then
# 	/usr/src/IT_Files/Linux/xfce-uni/aet_test.sh
# 	cp /usr/src/IT_Files/Linux/cron/profile_setup.sh /usr/bin/
# elif  [ ! -f /home/$user/.wlp_profiled.flag ] && [ -f /var/log/wlp.flag ]; then
# 	echo "WLP coming soon."
# fi

#source /usr/src/IT_Files/Linux/cron/check_hostname.sh
    
formatted_ext=$(hostname | tail -c 5)
current_ext=$(cat /home/tagent/.ext)
#echo $current_ext

if [ ! -f /home/tagent/.ext ]; then
    #CheckHostname tagent "No extension flag found. Updating profile."
    echo "1"
elif [[ "$current_ext" != "$ext" ]]; then
    # Check extension range
    #/usr/src/IT_Files/Linux/check_ext_range.sh

    # Close Zoiper for updates
    pkill zoiper
    
    /usr/src/IT_Files/Linux/check_ext_range.sh
    #CheckHostname tagent "Extension has changed. Updating profile."
fi

echo $return_hostname
