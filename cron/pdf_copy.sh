#!/bin/bash

for D in /home/*; do
	if [ "${D}" != "/home/tech" ] && [ "${D}" != "/home/tagent" ]; then
		name=${D}
		#echo $name
	fi
done

#echo "test: $name"
#/usr/src/IT_Files/Linux/cron/fstab.sh $name

for D in /home/*; do
	if [ -d "${D}" ]; then
		mv ${D}/*.pdf /usr/src/CompletedAnthemExtrasPDFFiles/ToBeReviewed
	fi
done

#for D in /home/*; do
#	if [ -d "${D}" ]; then
#		/usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh $D
#	fi
#done

for D in /home/*/Downloads; do
	if [ -d "${D}" ]; then
		mv ${D}/*.pdf /usr/src/CompletedAnthemExtrasPDFFiles/ToBeReviewed
	fi
done

#for D in /home/*; do
#	if [ -d "${D}" ]; then
#		cp ${D}/.smbcredentials /home/tech/
#	fi
#done

for D in /home/*; do
	if [ -d "${D}" ]; then
		rm ${D}/*.txt
	fi
done

for D in /home/*/Downloads; do
	if [ -d "${D}" ]; then
		rm ${D}/*.txt
	fi
done

for D in /home/*/Downloads; do
	if [ -d "${D}" ]; then
		rm ${D}/*.odt
	fi
done

for D in /home/*; do
	if [ -d "${D}" ]; then
		rm ${D}/*.odt
	fi
done

for D in /home/*/Downloads; do
	if [ -d "${D}" ]; then
		rm ${D}/*.ica
	fi
done
