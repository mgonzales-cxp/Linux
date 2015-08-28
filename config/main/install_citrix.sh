#!/bin/bash
#install_citrix.sh
#Author: Matt Gonzales
#Intended use: install Citrix on training laptops

if [ -f /var/log/training.flag ] && [ ! -f /var/log/citrix_32bit.flag ]; then
    gdebi -n /usr/src/IT_Files/Linux/software/ctxusb_2.4.285639_i386.deb &>/dev/null
    gdebi -n /usr/src/IT_Files/Linux/software/icaclient_13.1.0.285639_i386.deb &>/dev/null
    touch /var/log/citrix_32bit.flag
    echo "$(hostname) - $(hostname -I)" >> /usr/src/IT_Files/Linux/logs/test.log
fi
