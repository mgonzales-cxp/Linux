#!/bin/bash
# Script:      nightly.sh
# Author:      Matt Gonzales
# Usage:       Script ran by cron.
# Description: Called at 3 AM by agent workstations to make
#              or change system settings and software.

### Include for cron time stagger
source /usr/src/IT_Files/Linux/cron/stagger_nightly.sh  

function Nightly()
{

    ### Remove firefox FIGURE OUT HOW TO TELL IF INSTALLED
    apt-get purge -y firefox

    ### Install ossec
    /usr/src/IT_Files/Linux/cron/deploy_ossec.sh

    ### Replace ossec.conf
    /usr/src/IT_Files/Linux/cron/ossec_copy.sh
    
    ### Write WLP flags
    /usr/src/IT_Files/Linux/cron/wlp_flags.sh

    ### Delete extra 'nao' entries and re-write them
    sed -i '/nao/d' /etc/crontab
    echo '*/5 * * * * root /usr/src/IT_Files/Linux/cron/nao.sh' >> /etc/crontab
    
    ### Delete extra 'nightly' entires and re-write them
    sed -i '/nightly/d' /etc/crontab
    echo '00 03 * * * root /usr/src/IT_Files/Linux/cron/nightly.sh' >> /etc/crontab
    
    ### Set screensaver
    /usr/src/IT_Files/Linux/cron/screensaver_cron.sh

    ### Remove Screensaver from start
    /usr/src/IT_Files/Linux/cron/ss_be_gone.sh
    
    ### Update time
    ntpdate time.nist.gov
    
    ### Enable firewall and set rules
    ufw enable
    ufw allow 5901
    ufw allow 22
    
    ### Turn off USB
    /usr/src/IT_Files/Linux/usb_off.sh "- nightly"
    
    ### ClamAV
    freshclam
    echo "$(date "+%m%d")" > /var/log/clamav.log
    clamscan -ri --exclude-dir=/usr/src/IT_Files --exclude-dir=/usr/src/Aetna_Files --exclude-dir=/usr/src/Coventry_Files --exclude-dir=/usr/src/WLP_Info --exclude-dir=/usr/src/AnthemExtrasWritablePDFFiles --exclude-dir=/usr/src/CompletedAnthemExtrasPDFFiles / >> /var/log/clamav.log
    line=$(head -n 1 /var/log/clamav.log)
    if [[ "$line" != "$(date "+%m%d")" ]]; then
        echo "ClamAV scan did not run" > /var/log/clamav_failure.log
    fi
    
    ### Updates
    #apt-get update
    #DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
    
    ### Deploy Chrome Seed - CHECK THESE SCRIPT BEFORE UNCOMMENTING
    #/usr/src/IT_Files/Linux/cron/launcher_slc.sh
    #/usr/src/IT_Files/Linux/cron/launcher_update.sh

    ### History logs
    /usr/src/IT_Files/Linux/updateParser /var/log/apt/history.log
    
    ### Check OS version
    /usr/src/IT_Files/Linux/cron/version.sh
    
    ### Update Univention
    /usr/src/IT_Files/Linux/cron/change_univention.sh
        
    ### Write hostname
    echo "$ext" > /usr/src/IT_Files/Linux/logs/hosts/$ext.log
    
}

function Software() {
    apt-get $1 $2 -y
}

function Scripts() {

}

case $site in
    0)
        echo "Site: HQ"
        Nightly
        ;;
    1)
        echo "Site: HQ"
        Nightly
        ;;
    8)
        echo "Site: Provo"
        Nightly
        ;;
    9)
        echo "Site: Provo"
        Nightly
        ;;
    17)
        echo "Site: Roy"
        Nightly
        reboot
        ;;
    19)
        echo "Site: Roy"
        Nightly
        reboot
        ;;
    104)
        echo "Site: SLC"
        Nightly
        reboot
        ;;
    105)
        echo "Site: SLC"
        Nightly
        reboot
        ;;
    106)
        echo "Site: SLC"
        Nightly
        reboot
        ;;
    107)
        echo "Site: SLC"
        Nightly
        reboot
        ;;
    208)
        echo "Site: SAT"
        #Nightly
        ;;
    209)
        echo "Site: SAT"
        #Nightly
        ;;
    210)
        echo "Site: SAT"
        #Nightly
        ;;
    211)
        echo "Site: SAT"
        #Nightly
        ;;
    *)
        echo "Unknown location"
        ;;
esac

### FUNCTION CALL ###############
#Nightly
#################################
