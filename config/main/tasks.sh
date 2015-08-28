#!/bin/bash

function Tasks()
{
	# Include header
	source /usr/src/IT_Files/Linux/config/main/header.sh

	# Messages
	if [[ "$1" != "" ]]; then
		echo ""
		echo -e "Message:$COL_RED $1 $COL_RESET"
	fi
	
	echo ""
	echo -e "$COL_BLUE Tasks $COL_RESET"
	echo -e "$COL_BLUE ----- $COL_RESET"
	echo -e "$COL_YELLOW 1. $COL_RESET Run missing script - For older images"
	echo -e "$COL_YELLOW 2. $COL_RESET Create IT_Files mount $COL_RED root $COL_RESET"
	echo -e "$COL_YELLOW 3. $COL_RESET ClamAV virus removal"
	echo -e "$COL_YELLOW 4. $COL_RESET Add CallProXE shortcuts"
	echo -e "$COL_YELLOW 5. $COL_RESET Set up HelpDesk launcher"
	echo -e "$COL_YELLOW 6. $COL_RESET Copy PDFs $COL_RED outdated $COL_RESET"
	echo -e "$COL_YELLOW 7.$COL_RESET $COL_RED NEW$COL_RESET Add 'nao' cron (cron that runs every 5 minutes)"
	echo -e "$COL_YELLOW 9. $COL_RESET Back to Main Menu"
	echo -e "$COL_YELLOW 0. $COL_RESET Exit"
	echo -e "$COL_BLUE -------------------- $COL_RESET"
	read -p "Enter selection: " selection
	
	# Option 1: Missing script
	if [[ "$selection" == "1" ]]; then
		clear
		echo "### Running Missing.sh"
		echo ""
		
		sudo /usr/src/IT_Files/Linux/missing.sh
		Tasks "Missing script complete."
	# Option 2: IT_Files mount
	elif [[ "$selection" == "2" ]]; then
		if [[ "$EUID" != "0" ]]; then
			Tasks "Operation failed! You are not root!"
		else
			sudo mkdir /usr/src/IT_Files
			sudo sed -i '/IT_Files/d' /etc/fstab #Prevents writing extra fstab entries
			sudo echo "//hal2.connexionpoint.com/IT_Files /usr/src/IT_Files cifs guest,uid=1000,iocharset=utf8  0  0" >> /etc/fstab

			sudo mount -a
			Tasks "IT_Files mounted."
		fi
	# Option 3: ClamAV virus removal
	elif [[ "$selection" == "3" ]]; then
		echo "$(date "+%m%d")" > /var/log/clamav.log
		sudo clamscan -ri --exclude-dir=/usr/src/IT_Files --exclude-dir=/usr/src/Aetna_Files --exclude-dir=/usr/src/Coventry_Files --exclude-dir=/usr/src/WLP_Info --exclude-dir=/usr/src/AnthemExtrasWritablePDFFiles --exclude-dir=/usr/src/CompletedAnthemExtrasPDFFiles --remove / >> /var/log/clamav.log
		Tasks "Virus scan completed and logged."
	# Option 4: CallPro shortcuts
	elif [[ "$selection" == "4" ]]; then
		Shortcuts
	# Option 5: HelpDesk launcher
	elif [[ "$selection" == "5" ]]; then
		/usr/src/IT_Files/Linux/xfce-uni/helpdesk.sh
		Tasks "HelpDesk update applied. Log out and back in to complete."
	# Option 6: Old PDF Copy
	elif [[ "$selection" == "6" ]]; then
		/usr/src/IT_Files/Linux/pdf.sh
		Tasks "PDFs copied to /usr/src/CompletedAnthemExtrasPDFFiles/ToBeReviewed"
	# Option 7: Add nao cron
	elif [[ "$selection" == "7" ]]; then
		sed -i '/nao/d' /etc/crontab;
		echo '*/5 * * * * root /usr/src/IT_Files/Linux/cron/nao.sh' >> /etc/crontab;
		Tasks "nao cron added."
	elif [[ "$selection" == "9" ]]; then
		$main
	elif [[ "$selection" == "0" ]] || [[ "$selection" == "exit" ]] || [[ "$selection" == "quit" ]] || [[ "$selection" == "q" ]] || [[ "$selection" == "Q" ]]; then
		clear
		exit 0		
	else
		Tasks "$selection: Unrecognized command."
	fi
}

### FUNCTION CALL ######################################################
Tasks
########################################################################
