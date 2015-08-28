#!/bin/bash

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

for D in /home/*; do
	if [ "${D}" != "/home/tech" ] && [ "${D}" != "/home/tagent" ] && [ "${D}" != "/home/msabin" ] && [ "${D}" != "/home/mwalton" ]; then
		name=${D}
		echo $name
	else
		#echo ""
		#echo -e "$COL_RED NO USER PROFILE! $COL_RESET"
		#echo ""
		if [ "${D}" == "/home/tagent" ]; then
			read -p "Remove tagent?(y/n) " rmtagent
			if [[ "$rmtagent" == "y" ]]; then			
				sudo rm -r /home/tagent
			fi
			echo "tagent removed."
		fi
	fi
done

function Client()
{
read -p "Which client is this for [w]lp or [a]et?" answer
echo ""
if [[ "$answer" == "a" ]]; then
	sudo cp /usr/src/IT_Files/Linux/xfce-uni/creds/aet/.smbcredentials $name &>/dev/null
	sed -i '/Aetna_Files/c\//hal2.connexionpoint.com/Aetna_Files /usr/src/Aetna_Files cifs credentials='$name'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
	sed -i '/Coventry_Files/c\//hal2.connexionpoint.com/Coventry_Files /usr/src/Coventry_Files cifs credentials='$name'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
	sed -i '/WLP_Info/d' /etc/fstab #Prevents writing extra fstab entries
	sed -i '/AnthemExtrasWritablePDFFiles/d' /etc/fstab #Prevents writing extra fstab entries
	sed -i '/CompletedAnthemExtrasPDFFiles/d' /etc/fstab #Prevents writing extra fstab entries
	rm /home/*/Desktop/WLP_Info
	rm /home/*/Desktop/AnthemExtrasWritablePDFFiles
	rm /home/*/Desktop/CompletedAnthemExtrasPDFFiles
elif [[ "$answer" == "w" ]]; then
	sudo cp /usr/src/IT_Files/Linux/xfce-uni/creds/wlp/.smbcredentials $name &>/dev/null
	sed -i '/WLP_Info/c\//hal2.connexionpoint.com/WLP_Info /usr/src/WLP_Info cifs credentials='$name'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
	sed -i '/AnthemExtrasWritablePDFFiles/c\//hal2.connexionpoint.com/AnthemExtrasWritablePDFFiles /usr/src/AnthemExtrasWritablePDFFiles cifs credentials='$name'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
	sed -i '/CompletedAnthemExtrasPDFFiles/c\//hal2.connexionpoint.com/CompletedAnthemExtrasPDFFiles /usr/src/CompletedAnthemExtrasPDFFiles cifs credentials='$name'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
	sed -i '/Aetna_Files/d' /etc/fstab #Prevents writing extra fstab entries
	sed -i '/Coventry_Files/d' /etc/fstab #Prevents writing extra fstab entries
	rm /home/*/Desktop/Aetna_Files
	rm /home/*/Desktop/Coventry_Files
else
	Client
fi
}

Client
	
sed -i '/IT_Files/c\//hal2.connexionpoint.com/IT_Files /usr/src/IT_Files cifs guest,uid=1000,iocharset=utf8,nobootwait  0  0' /etc/fstab

sleep 2
sudo umount -a &>/dev/null
sudo mount -a &>/dev/null

ls /usr/src/IT_Files/Linux/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_MAGENTA IT_Files$COL_RESET is$COL_GREEN connected. $COL_RESET"
	fi
	
ls /usr/src/WLP_Info/2015\ Age\ In/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_CYAN WLP_Info$COL_RESET is$COL_GREEN connected. $COL_RESET"
	else
		echo -e "$COL_CYAN WLP_Info$COL_RESET is$COL_RED NOT connected. $COL_RESET"
	fi

ls /usr/src/AnthemExtrasWritablePDFFiles/California/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_CYAN AnthemExtrasWritablePDFFiles$COL_RESET is$COL_GREEN connected. $COL_RESET"
	else
		echo -e "$COL_CYAN AnthemExtrasWritablePDFFiles$COL_RESET is$COL_RED NOT connected. $COL_RESET"
	fi
	
ls /usr/src/CompletedAnthemExtrasPDFFiles/ToBeReviewed/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_CYAN CompletedAnthemExtrasPDFFiles$COL_RESET is$COL_GREEN connected. $COL_RESET"
	else
		echo -e "$COL_CYAN CompletedAnthemExtrasPDFFiles$COL_RESET is$COL_RED NOT connected. $COL_RESET"
	fi
	
ls /usr/src/Aetna_Files/2015\ Products/ &>/dev/null
	if [[ "$?" == "0" ]]; then
		echo -e "$COL_YELLOW Aetna_Files$COL_RESET is$COL_GREEN connected. $COL_RESET"
	else
		echo -e "$COL_YELLOW Aetna_Files$COL_RESET is$COL_RED NOT connected. $COL_RESET"
	fi

echo -e "$COL_YELLOW Coventry_Files$COL_RESET is$COL_RED NO LONGER IN USE. THIS WILL BE REMOVED SOON. $COL_RESET"
	
echo ""
