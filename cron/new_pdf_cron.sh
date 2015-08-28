#!/bin/bash

ext=$(hostname)

function PDF()
{
	# Create local directory to store PDFs on machine
	if [ ! -d "/var/.copy" ]; then
		mkdir /var/.copy
		echo "Local copy directory created."
	elif [ -d "/var/.copy" ]; then
		echo "Local copy directory exists!"
	fi

	# Create PDF folder in every folder in /home
	for D in /home/*; do
		if [ ! -d "${D}/PDF/" ]; then
			mkdir ${D}/PDF/
			chmod 777 ${D}/PDF/
			echo "New PDF Directory created for ${D}"
		elif [ -d "/var/.copy" ]; then
			echo "Directory exists for ${D}"
		fi
	done
	
	# Correct permissions on PDF folders
	for D in /home/*; do
		if [ -d "${D}/PDF/" ]; then
			chmod 777 ${D}/PDF/
			echo "Permissions updated for ${D}"
		elif [ ! -d "${D}/PDF/" ]; then
			echo "No PDF folder found."
		fi
	done

	# Fix capital PDF extension
	for f in /home/*/PDF/*.PDF
	do
		mv "$f" "${f%.PDF}.pdf"
		#echo $f
		#mv "$f" "`basename $f .PDF`.pdf"
		#echo "$f changed from capital PDF extension."
	done

	# Correct any files without .pdf extension
	FILES=/home/*/PDF/*
	for f in $FILES
	do
		if [[ $f =~ \.pdf$ ]]; then
			echo "$f is a pdf"
			#cp /home/tech/Desktop/
		else
			mv "$f" "$f.pdf"
			echo "$f corrected to $f.pdf"
		fi
	done

	# Copy all PDFs in /home/*/PDF/ to file server and move to local directory
	for D in /home/*/PDF; do
		FILE="${D}/*.pdf"
		FS="/usr/src/CompletedAnthemExtrasPDFFiles/ToBeReviewed/"
		LOCAL="/var/.copy/"
	
		cp $FILE $FS
		mv $FILE $LOCAL
	done
}

# Call function based on location

### SAT #########################
hostname -I | grep "192.168.208"
if [ "$?" == "0" ]; then
	PDF
fi
#################################



### ROY - STATIC ################
hostname -I | grep "192.168.17"
if [ "$?" == "0" ]; then
	PDF
fi
#################################



### ROY - DHCP ##################
hostname -I | grep "192.168.19"
if [ "$?" == "0" ]; then
	PDF
fi
#################################



### SLC #####################################
FILE=/usr/src/IT_Files/Linux/logs/slc-wlp.txt
# read $FILE using the file descriptors
exec 3<&0
exec 0<$FILE
while read line
do
	#use $line variable to process line
	if [[ "$ext" == $line ]]; then
		PDF
	fi
done
exec 0<&3
#############################################
