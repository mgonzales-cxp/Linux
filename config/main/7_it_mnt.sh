#!/bin/bash

sudo mkdir /usr/src/IT_Files
sudo sed -i '/IT_Files/d' /etc/fstab #Prevents writing extra fstab entries
sudo echo "//hal2.connexionpoint.com/IT_Files /usr/src/IT_Files cifs guest,uid=1000,iocharset=utf8  0  0" >> /etc/fstab

sudo mount -a