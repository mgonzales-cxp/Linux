#!/bin/bash
# Script:      nightly_functions.sh
# Author:      Matt Gonzales
# Usage:       Source include for nightly.sh.
# Description: Source script for nightly.sh. Functions can be easily
#              be turned off or on in nightly.sh

### Script variables

    $seed_deploy=/usr/src/IT_Files/Linux/cron/launcher_update.sh
    $seed_deploy_slc=/usr/src/IT_Files/Linux/cron/launcher_slc.sh
    $deploy_ossec=/usr/src/IT_Files/Linux/cron/deploy_ossec.sh
    $ossec_copy=/usr/src/IT_Files/Linux/cron/ossec_copy.sh
    $wlp_flags=/usr/src/IT_Files/Linux/cron/wlp_flags.sh
    $set_screensaver=/usr/src/IT_Files/Linux/cron/screensaver_cron.sh
    $remove_screensaver=/usr/src/IT_Files/Linux/cron/ss_be_gone.sh
    $update_parser="/usr/src/IT_Files/Linux/updateParser /var/log/apt/history.log"
    $check_os_version=/usr/src/IT_Files/Linux/cron/version.sh
    $update_univention=/usr/src/IT_Files/Linux/cron/change_univention.sh

function Nightly()
{

    ### Remove firefox FIGURE OUT HOW TO TELL IF INSTALLED
    apt-get purge -y firefox
    
    ### Update time
    ntpdate time.nist.gov
    
    ### Enable firewall and set rules
    ufw enable
    ufw allow 5901
    ufw allow 22
        
    ### Write hostname
    echo "$ext" > /usr/src/IT_Files/Linux/logs/hosts/$ext.log
    
}

function USBOff() {

    /usr/src/IT_Files/Linux/usb_off.sh
}

function Crons() {

    ### Delete extra 'nao' entries and re-write them
    sed -i '/nao/d' /etc/crontab
    echo '*/5 * * * * root /usr/src/IT_Files/Linux/cron/nao.sh' >> /etc/crontab
    
    ### Delete extra 'nightly' entires and re-write them
    sed -i '/nightly/d' /etc/crontab
    echo '00 03 * * * root /usr/src/IT_Files/Linux/cron/nightly.sh' >> /etc/crontab
}

function ClamAV() {

    ### ClamAV
    freshclam
    echo "$(date "+%m%d")" > /var/log/clamav.log
    clamscan -ri \
         --exclude-dir=/usr/src/IT_Files \
         --exclude-dir=/usr/src/Aetna_Files \ 
         --exclude-dir=/usr/src/Coventry_Files \ 
         --exclude-dir=/usr/src/WLP_Info \
         --exclude-dir=/usr/src/AnthemExtrasWritablePDFFiles \
         --exclude-dir=/usr/src/CompletedAnthemExtrasPDFFiles \
         / >> /var/log/clamav.log
    line=$(head -n 1 /var/log/clamav.log)
    if [[ "$line" != "$(date "+%m%d")" ]]; then
        echo "ClamAV scan did not run" > /var/log/clamav_failure.log
    fi
}

function UpdateOS() {

    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" upgrade
}

function Software() {

    apt-get $1 $2 -y
}

### FORCE GLOBAL CALL BY UNCOMMENTING ########
#Nightly
##############################################