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
			
			sed -i '/profile_update/d' /etc/crontab
			# Replace wallpaper and refresh
			cp /usr/src/IT_Files/Linux/wallpaper/cxp_loading.png /usr/share/xfce4/backdrops/linuxmint.png
			# xfdesktop --reload
			# sleep 10

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
	service mdm force-reload
fi
