#!/bin/bash
pgrep clamscan && echo Running
if [[ "$?" != "0" ]]; then
	echo "Process not found. Starting AV scan..."
	sleep 2
	sudo clamscan -ri --exclude-dir=/usr/src/IT_Files --exclude-dir=/usr/src/Aetna_Files --exclude-dir=/usr/src/WLP_Info --exclude-dir=/usr/src/AnthemExtrasWritablePDFFiles --exclude-dir=/usr/src/CompletedAnthemExtrasPDFFiles --remove / >> /usr/src/IT_Files/Linux/logs/clamav.log
else
	echo "ClamAV process already running"
	exit 0
fi
