#!/bin/bash
# training_pictures.sh
# Move training pictures from home folder to file server

function Main()
{
	### Create local directory to store PNG backups
	if [ ! -d "/var/.pngcopy" ]; then
		mkdir /var/.pngcopy/
		echo "Local PNG copy folder created."
	else
		echo "Local PNG copy directory exists!"
	fi
	
	### Create folder where agent saves pictures
	for D in /home/*; do
		if [ ! -d "${D}/Pictures/" ]; then
			mkdir ${D}/Pictures/
			chmod 777 ${D}/Pictures/
			echo "New Pictures Directory created for ${D}"
		elif [ -d "/var/.copy" ]; then
			echo "Directory exists for ${D}"
		fi
	done

	### Fix capital PDF extension
	for i in /home/*/Pictures/*.PNG; do
		mv "$i" "${i%.PNG}.png"
	done

	### Correct any files without .png extension
	FILES=/home/*/Pictures/*
	for i in $FILES*; do
		if [[ $i =~ \.png$ ]]; then
			echo "$i is a png"
		else
			mv "$i" "$i.png"
			echo "$i corrected to $i.png"
		fi
	done


	### Copy all PNGs in /home/* to file server and move to local directory
	for i in /home/*/Pictures; do
		FILE="${i}/*.png"
		FS="/usr/src/IT_Files/Linux/screenshots/$1/"
		LOCAL="/var/.pngcopy/"

		cp $FILE $FS
		mv $FILE $LOCAL
	done
}

### Associative array
### -Key is the 3rd octet in IP address
### -Value is the name of the folder
declare -A sites=(
	[8]="provo_training_screenshots"
	[19]="roy_training_screenshots"
	[106]="slc_training_screenshots"
	[107]="slc_training_screenshots"
	[210]="sat_training_screenshots"
	[211]="sat_training_screenshots"
	)

### Check IP. Loop through array until IP is found.
### If IP is found pass the value of the $i (array key)
### to Main() function
for i in ${!sites[@]}; do
	hostname -I | grep "192.168.$i"
	if [[ "$?" == "0" ]] && [ -f /var/log/training.flag ]; then
		Main "${sites[$i]}"
	fi
done