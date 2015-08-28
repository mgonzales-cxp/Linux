#!/bin/bash

# Make directories
sudo mkdir /home/pi/.config/autostart/

# Copy files
sudo cp /media/UUI/files/vnc.sh /usr/bin/
sudo cp /media/UUI/files/vnc.desktop /home/pi/.config/autostart/

# Permissions
sudo chmod +x /usr/bin/vnc.sh
sudo chmod +x /home/pi/.config/autostart/vnc.desktop

x11vnc -storepasswd
/usr/bin/vnc.sh