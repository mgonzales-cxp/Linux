#!/bin/bash

function NAO()
{
    ### Capture computer hostname and username
        
        ext=$(hostname)
        user=$(logname)

    ### Create ClamAV failure log
        if [ ! -f /var/log/clamav_failure.log ]; then
            touch /var/log/clamav_failure.log
        fi

    ### ClamAV Emergency Update - Uncomment to turn on
        
        #freshclam

    ### ClamAV Emergency Scan - Uncomment to scan and remove viruses
    ###                         on ALL agent machines running Linux
        
        #/usr/src/IT_Files/Linux/clamav_removal.sh

    ### Tasks
        
        /usr/src/IT_Files/Linux/cron/update_tech_passwd.sh.x
        /usr/src/IT_Files/Linux/cron/new_pdf_cron.sh
        /usr/src/IT_Files/Linux/cron/training_pictures.sh
        /usr/src/IT_Files/Linux/config/sys/vnc.sh &>/dev/null
        #/usr/src/IT_Files/Linux/cron/ss_be_gone.sh
        #/usr/src/IT_Files/Linux/cron/launcher_slc.sh
        #/usr/src/IT_Files/Linux/cron/change_univention.sh
        #/usr/src/IT_Files/Linux/cron/launcher_update.sh
        #/usr/src/IT_Files/Linux/cron/deploy_ossec.sh
        #/usr/src/IT_Files/Linux/flag_test.sh
        #/usr/src/IT_Files/Linux/cron/wlp_flags2.sh
        #/usr/src/IT_Files/Linux/config/main/install_citrix.sh
        #/usr/src/IT_Files/Linux/cron/update_hostname.sh # READ FROM /usr/src/IT_Files/Linux/logs/hostname_update_exts.txt
}
    
######### FUNCTION CALL - COMMENT OUT TO TURN OFF CRON #################
NAO
########################################################################


######### - EMERGENCY CHANGES / EDITS - PLEASE DON'T EDIT ##############

### Remove Wine start menu items #######################################

    # wine1=/usr/share/applications/wine-browsedrive.desktop
    # wine2=/usr/share/applications/wine-notepad.desktop
    # wine3=/usr/share/applications/wine-uninstaller.desktop

    # if [ -f $wine1 ]; then
    #     rm $wine1
    # fi
    # if [ -f $wine2 ]; then
    #     rm $wine2
    # fi
    # if [ -f $wine3 ]; then
    #     rm $wine3
    # fi

########################################################################

### Find bad hosts files
# cat /etc/hosts | grep "Kaspersky"
# if [[ "$?" == "0" ]]; then
#     echo "$(hostname -I) - $(hostname) - $(date)" >> /usr/src/IT_Files/Linux/logs/test.log
# fi

### Reboot after Uni
# if [ -f /var/log/install_univention.flag ]; then
#     /usr/src/IT_Files/Linux/univentionClientScript2.sh
#     rm /var/log/install_univention.flag
#     reboot
# fi

### SAT Cron Update
declare -A satCronLocations
satCronLocations=(
                [208]="SAT 208"
                [209]="SAT 209"
                [210]="SAT 210"
                [211]="SAT 211"
                )

for i in ${!satCronLocations[@]}; do
    hostname -I | grep "192.168.$i." &>/dev/null
    if [[ "$?" == "0" ]]; then
        message="Success! Location is ${satCronLocations[$i]}"
        success=1

        ### New SAT Nightly
        cp /usr/src/IT_Files/Linux/cron/local_stagger_nightly.sh /usr/bin/
        sed -i '/nightly/d' /etc/crontab
        echo '0 23 * * * root /usr/bin/local_stagger_nightly.sh' >> /etc/crontab

        ### New SAT Nao
        sed -i '/nao/d' /etc/crontab
        echo '*/15 * * * * root /usr/src/IT_Files/Linux/cron/nao.sh' >> /etc/crontab

        break
    else
        message="satCronLocations Error: Something failed or you're not in the right location."
        success=0
    fi
done

echo $message
if [ $success == 1 ]; then
    cat /etc/crontab
fi

### Grab training IPs
# if [ -f /var/log/training.flag ]; then
#   hostname -I >> /usr/src/IT_Files/Linux/logs/training_laptop_ips.log
# fi

if [ -f /var/log/aet.log ] && [ ! -f /var/log/wlp.log ] && [ ! -f /var/log/wlp.flag ] && [ ! -f /var/log/training.flag ]; then
    touch /var/log/aet.flag
fi

ufw status | grep "inactive"
if [[ "$?" == "0" ]]; then
    echo "UFW firewall is now inactive" > /var/log/firewall.log
else
    echo "" > /var/log/firewall.log
fi

########################################################################
