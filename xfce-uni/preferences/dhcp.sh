#!/bin/bash

# DHCP Script

sudo apt-get remove network-manager -y &>/dev/null
clear

echo "Resetting interfaces to stock..."

sudo echo "# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
auto eth0

iface lo inet loopback
iface eth0 inet dhcp" > /etc/network/interfaces

clear
echo "Bringing interface down..."
ifdown eth0
sleep 2
echo
echo "Then back up..."
echo
sleep 2
ifup eth0
ifconfig eth0
