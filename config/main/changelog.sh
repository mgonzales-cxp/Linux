#!/bin/bash

# Include Header
source /usr/src/IT_Files/Linux/config/main/header.sh

# Messages
if [[ "$1" != "" ]]; then
    echo ""
    echo -e "Message:$COL_RED $1 $COL_RESET"
fi
echo ''
echo -e "$COL_GREEN July 8, 2015 $COL_RESET"
echo -e "$COL_GREEN ------------ $COL_RESET"
echo ''

echo -e "$COL_RED#$COL_RESET Updated file structure."
echo ''

echo ''
echo -e "$COL_GREEN July 7, 2015 $COL_RESET"
echo -e "$COL_GREEN ------------ $COL_RESET"
echo ''

echo -e "$COL_RED#$COL_RESET Added this here page!"
echo -e "$COL_RED#$COL_RESET Config no longer requires a password if root. Yay!"
echo ''

read -n1 -r -p "Press any key to continue..." key
