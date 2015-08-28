#!/bin/bash
# Script:      nightly_functions.sh
# Author:      Matt Gonzales
# Usage:       Source include for nightly.sh.
# Description: Source script for nightly.sh. Functions can be easily
#              be turned off or on in nightly.sh
# Wiki URL:    https://sites.google.com/a/connexionpoint.com/it-support/linux/nightly-cron-functions-and-scripts

### Declare short varibles
    
    ext=$(hostname)
    user=$(logname)
    today=$(date +%D)
    tomorrow=$(date --date='tomorrow' +%D)

### Script variables

    seed_deploy=/usr/src/IT_Files/Linux/cron/launcher_update.sh
    seed_deploy_slc=/usr/src/IT_Files/Linux/cron/launcher_slc.sh
    deploy_ossec=/usr/src/IT_Files/Linux/cron/deploy_ossec.sh
    ossec_copy=/usr/src/IT_Files/Linux/cron/ossec_copy.sh
    wlp_flags=/usr/src/IT_Files/Linux/cron/wlp_flags.sh
    set_screensaver=/usr/src/IT_Files/Linux/cron/screensaver_cron.sh
    remove_screensaver=/usr/src/IT_Files/Linux/cron/ss_be_gone.sh
    update_parser="/usr/src/IT_Files/Linux/updateParser /var/log/apt/history.log"
    check_os_version=/usr/src/IT_Files/Linux/cron/version.sh
    update_univention=/usr/src/IT_Files/Linux/cron/change_univention.sh
    update_tech_passwd=/usr/src/IT_Files/Linux/cron/update_tech_passwd.sh.x

function Nightly()
{

    if CheckDate "$1"; then
        
        printf "\nRunning nightly...\n"
    	
    	### Remove Stock Bloatware
    	apt-get purge firefox gimp gthumb hexchat libreoffice-draw thunderbird transmission-* opera pidgin banshee brasero totem -y
        
        ### Update time
        ntpdate time.nist.gov
        
        ### Enable firewall and set rules
        ufw enable
        ufw allow 5901
        ufw allow 22
            
        ### Write hostname
        echo "$ext" > /usr/src/IT_Files/Linux/logs/hosts/$ext.log

        ### Change tech password
        $update_tech_password

        ### Update Bash
        cp /usr/src/IT_Files/Linux/xfce-uni/preferences/bash.bashrc /etc

        ### Script Calls
        $deploy_ossec
        $ossec_copy
        $set_screensaver
        $remove_screensaver
        $update_parser
        $check_os_version
        $update_univention
        $update_tech_password

    elif [[ "$1" != "" ]]; then
        echo "Scheduled for nightly updates on $1"
    fi
}

function USBOff() {

    if CheckDate "$1"; then
        printf "\nTurning off USB access...\n"
        /usr/src/IT_Files/Linux/usb_off.sh
    elif [[ "$1" != "" ]]; then
        echo "Scheduled to turn USB off on $1"
    fi
}

function Crons() {

    if CheckDate "$1"; then
        printf "\nCorrecting crons...\n"
        ### Delete extra 'nao' entries and re-write them
        sed -i '/nao/d' /etc/crontab
        echo '*/5 * * * * root /usr/src/IT_Files/Linux/cron/nao.sh' >> /etc/crontab
        
        ### Delete extra 'nightly' entires and re-write them
        sed -i '/nightly/d' /etc/crontab
        echo '00 03 * * * root /usr/src/IT_Files/Linux/cron/nightly.sh' >> /etc/crontab
    elif [[ "$1" != "" ]]; then
        echo "Scheduled to write to local crontabs on $1"
    fi
}

function ClamAV() {

    if CheckDate "$1"; then
        printf "\nRunning ClamAV...\n"
        freshclam
        echo "$(date "+%m%d")" > /var/log/clamav.log
        clamscan -ri --remove \
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
    elif [[ "$1" != "" ]]; then
            echo "Scheduled for ClamAV update and scan on $1"
    fi
}

function UpdateOS() {

    if CheckDate "$1"; then
        printf "\nUpdating OS...\n"
        apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" upgrade
    elif [[ "$1" != "" ]]; then
        echo "Scheduled to download and install system updates on $1"
    fi
}

function Software() {

    if CheckDate "$3"; then
        printf "\nAdding/removing software...\n"
        echo "Attempting to $1 $2"
        echo ''
        apt-get $1 $2 -y
    elif [[ "$3" != "" ]]; then
        echo "Scheduled to $1 $2 on $3"
    fi
}

function CheckDate() {

    if [[ "$1" == "" ]]; then
        echo "Error in CheckDate(): Argument can't be null."
        #exit 1
        return 1
        break
    fi

    if [[ "$1" == "Today" ]]; then
        return 0
        break
    #elif [[ "$1" == "Tomorrow" ]]; then
    #    $tomorrow
    #    return 0
    #    break
    fi

    date +%a | grep "$1"
    if [[ "$?" == "0" ]]; then
        return 0
    else
        return 1
    fi
}

function Power() {

    if [[ "$1" == "Reboot" ]]; then
        if CheckDate "$2"; then
            echo "Attention: Scheduled for reboot today."
            sleep 5
            reboot
        else
            echo "Scheduled for reboot on $2."
        fi
    elif [[ "$1" == "Shutdown" ]]; then
        if CheckDate "$2"; then
            echo "Attention: Scheduled for shutdown today."
            sleep 5
            poweroff
        else
            echo "Scheduled for shutdown on $2."
        fi
    fi
}

### FORCE GLOBAL CALL BY ADDING/UNCOMMENTING HERE ########
#Nightly
##########################################################
