#!/bin/bash

echo "IP Address: " $(hostname -I)
echo "Computer name: " $(hostname)
echo ""

x-www-browser "www.google.com" &> /dev/null

read -p "Press any key to close."
#sleep 10
