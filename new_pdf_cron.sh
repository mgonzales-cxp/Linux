#!/bin/bash

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
		echo "New PDF Directory created for ${D}"
	elif [ -d "/var/.copy" ]; then
		echo "Directory exists for ${D}"
	fi
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
