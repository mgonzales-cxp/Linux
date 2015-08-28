#!/bin/bash

red='\033[1;31m'
NC='\033[0m'
yellow='\033[1;33m'
LGRAY='\033[0;37m'

#This script requires Opera and Xclip.
#sudo apt-get install opera
#sudo apt-get install xclip
echo -e "Your IP Address is:" ${red} $(hostname -I) ${NC}
echo $(hostname -I) | xclip -sel clip
echo ""
echo ""
echo "Tech will be able to use this IP address"
echo "to remote-control into your computer and"
echo "help you with troubleshooting as needed."
echo ""
echo -e ${yellow}"Your IP Address has been automatically copied"
echo -e "into your clipboard for your convenience.${NC}"
#echo "Computer name: " $(hostname)
echo ""
read -p "Press ENTER key to launch HelpDesk."

opera &> /dev/null 
#opera "http://help.connexionpoint.com"
