#!/bin/bash

# Static IP script

sudo apt-get remove network-manager -y &>/dev/null
clear

read -p "Enter static IP: 192.168." address
read -p "Enter netmask: 255.255.<xxx>.0 (your input is <xxx>): " netmask
read -p "Enter gateway: 192.168." gateway

sudo echo "# interfaces(5) file used by ifup(8) and ifdown(8)

auto lo
auto eth0

iface lo inet loopback
iface eth0 inet static
		address 192.168.$address
		netmask 255.255.$netmask.0
		gateway 192.168.$gateway" > /etc/network/interfaces

# Bring interface down and then back up to establish changes.
clear
echo "Bringing interface down..."
ifdown eth0
sleep 2
echo
echo "Then back up..."
echo "It may take a minute or two to resolve the connection."
echo
sleep 2
ifup eth0
ifconfig eth0
