#!/bin/bash

function CheckHostname() {

    ### MOVE TO UPDATE.SH ###
    clear
    echo -e "$COL_RED Attention$COL_RESET: $2"
    echo ""
    sleep 5
    #########################

    ### Get hostname from array
    source /usr/src/IT_Files/Linux/xfce-uni/exts_array.sh

    ### Set new hostname
    echo $return_hostname > /home/tagent/.ext
    clear
    echo "Updating hostname"
    sleep 2

    /usr/src/IT_Files/Linux/xfce-uni/preferences/rewrite_hosts.sh $return_hostname
}
