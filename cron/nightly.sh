#!/bin/bash
# Script:      nightly.sh
# Author:      Matt Gonzales
# Usage:       Script ran by cron.
# Description: Called at 3 AM by agent workstations to make
#              or change system settings and software.
# Wiki URL:    https://sites.google.com/a/connexionpoint.com/it-support/linux/nightly-cron-functions-and-scripts


# Source includes
source /usr/src/IT_Files/Linux/cron/stagger_nightly.sh  
source /usr/src/IT_Files/Linux/cron/nightly_functions.sh


# For cron duration: start time
start_time=$SECONDS

####################################################################
####!!! PLEASE READ DOCUMENTATION BEFORE MAKING CHANGES BELOW !!!###
####################################################################

case $site in
    0)
        echo "Site: HQ"
        Nightly Sat
        USBOff Sat
        ClamAV Sat
        Software remove firefox Sat
        Power Reboot Sat
        ;;
    1)
        echo "Site: HQ"
        # Nightly
        # USBOff
        # ClamAV        
        # Power
        ;;
    8)
        echo "Site: Provo"
        Nightly Today
        USBOff Today
        #Crons Today
        ClamAV Today
        Power Reboot Sat
        ;;
    9)
        echo "Site: Provo"
        Nightly Today
        USBOff Today
        #Crons Today
        ClamAV Today
        Power Reboot Sat
        ;;
    17)
        echo "Site: Roy"
        Nightly Today
        USBOff Today
        #Crons Today
        ClamAV Today    
        Power Reboot Sat
        ;;
    19)
        echo "Site: Roy"
        Nightly Today
        USBOff Today
        #Crons Today
        ClamAV Today
        Power Reboot Sat
        ;;
    104)
        echo "Site: SLC"
        Nightly Today
        USBOff Today
        #Crons Today
        ClamAV Today
        Power Reboot Sat
        ;;
    105)
        echo "Site: SLC"
        Nightly Today
        USBOff Today
        #Crons Today
        ClamAV Today
        Power Reboot Sat
        ;;
    106)
        echo "Site: SLC"
        Nightly Today
        USBOff Today
        #Crons Today
        ClamAV Today
        Power Reboot Sat
        ;;
    107)
        echo "Site: SLC"
        Nightly Today
        USBOff Today
        #Crons Today
        ClamAV Today
        Power Reboot Sat
        ;;
    208)
        echo "Site: SAT"
        Nightly Sat
        USBOff Sat
        #Crons Today
        ClamAV Sat
        Power Reboot Sat
        ;;
    209)
        echo "Site: SAT"
        Nightly Sat
        USBOff Sat
        #Crons Today
        ClamAV Sat
        Power Reboot Sat
        ;;
    210)
        echo "Site: SAT"
        Nightly Sat
        USBOff Sat
        #Crons Today
        ClamAV Sat
        Power Reboot Sat
        ;;
    211)
        echo "Site: SAT"
        Nightly Sat
        USBOff Sat
        #Crons Today
        ClamAV Sat
        Power Reboot Sat
        ;;
    *)
        echo "Error: Unknown location"
        echo "$(hostname -I)"
        ;;
esac


# For cron duration: end time
elapsed_time=$(($SECONDS - $start_time))
printf "\nCron elapsed time:\n"
echo "$(($elapsed_time/60)) min $(($elapsed_time%60)) sec" > /var/log/cron_duration.log
cat /var/log/cron_duration.log
