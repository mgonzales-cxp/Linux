#!/bin/bash

apt-get purge google-chrome-stable

cp /usr/src/IT_Files/Linux/software/google-chrome-stable_current_41.0.2272.101-1_i386.deb /home/$(logname)/Downloads/

#dpkg --install /home/$(logname)/Downloads/google-chrome-stable_41.0.2272.101-1_i386.deb
gdebi -n /home/tech/Downloads/google-chrome-stable_41.0.2272.101-1_i386.deb

rm /home/WLP-TLS/Desktop/google-chrome.desktop

cp /usr/src/IT_Files/Linux/xfce-test/shortcuts/google-chrome.desktop /home/WLP-TLS/Desktop/google-chrome.desktop
