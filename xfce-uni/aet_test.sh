#!/bin/bash

ext=$(hostname)
user=$1
ip=$(hostname -I)

# Create startup directory
if [ ! -d /home/$1/.config/autostart ]; then
    sleep 5
    mkdir /home/$1/.config/autostart
    cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/$1/.config/autostart
    cp /home/$1/Desktop/Zoiper.desktop /home/$1/.config/autostart/
    #/usr/src/IT_Files/Linux/update.sh
    reboot
fi

sleep 5
# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

### XFCE AetnaXE SETUP ###

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
        echo $(hostname) > /home/$1/.ext
        # echo $return_hostname > /home/$1/.ext
        # clear
        # echo "Updating hostname"
        # sleep 2
        #/usr/src/IT_Files/Linux/xfce-uni/preferences/rewrite_hosts.sh $return_hostname
    }

    function Initialize()
    {
        current_ext=$(cat /home/$1/.ext)

        # if [ ! -f /home/$1/.ext ]; then
        #     CheckHostname $user "No extension flag found. Updating profile."
        # elif [[ "$current_ext" != "$ext" ]]; then
        #     CheckHostname $user "Extension has changed. Updating profile."
        # fi

        # if [[ "$current_ext" != "$ext" ]]; then
        #     CheckHostname $user "Extension has changed. Updating profile."
        # elif [ ! -f /home/$1/.ext ]; then
        #     CheckHostname $user "No extenstion flag found. Updating profile."
        # fi

        clear
        echo -e "$COL_GREEN User$COL_RESET is: $COL_CYAN$user$COL_RESET"
        echo -e "$COL_RED Please wait while the profile is being configured.$COL_RESET"
        echo -e "$COL_RED Apps may open and close several times during the process.$COL_RESET"
        #sleep 3
        su $user -c google-chrome </dev/null &>/dev/null &
        su $user -c zoiper </dev/null &>/dev/null &
        sleep 8

        pkill google-chrome
        pkill google-chrome-stable
        pkill chrome
        pkill zoiper

        su $user -c google-chrome </dev/null &>/dev/null &
        #su $user -c zoiper </dev/null &>/dev/null &
        sleep 8

        pkill google-chrome
        pkill google-chrome-stable
        pkill chrome
        #pkill zoiper
        
        MountDrives $1
    }

    function MountDrives()
    {
        # Create directories for mount locations    
        mkdir /usr/src/Aetna_Files
        
        # Credentials
        cp /usr/src/IT_Files/Linux/xfce-uni/creds/aet/.smbcredentials /home/$1/.smbcredentials
        chmod 600 /home/$1/.smbcredentials

        # Prevent writing extra fstab entries
        sed -i '/WLP/d' /etc/fstab
        sed -i '/PDF/d' /etc/fstab
        sed -i '/Aetna/d' /etc/fstab
        sed -i '/Coventry/d' /etc/fstab

        # Create Aetna_Files shortcut on desktop
        echo '[Desktop Entry]
        Version=1.0
        Name=Aetna Files
        Comment=Access Aetna files folder
        Exec=thunar smb://ucs-fs/Aetna_Files/ %U
        Terminal=False
        Icon=folder
        Type=Application' > /home/$1/Desktop/Aetna_Files.desktop

        chmod a+x /home/$1/Desktop/Aetna_Files.desktop

        # Write client-specific fstab entries
        #echo "//hal2.connexionpoint.com/Aetna_Files /usr/src/Aetna_Files cifs credentials=/home/$1/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0" >> /etc/fstab
        
        # Unmount network drives
        umount -a

        # Create desktop links for Aetna / Coventry Files
        rm /home/*/Desktop/Aetna_Files
        rm /home/*/Desktop/Coventry_Files
        rm /home/*/Desktop/WLP_Info
        rm /home/*/Desktop/AnthemExtrasWritablePDFFiles
        rm /home/*/Desktop/CompletedAnthemExtrasPDFFiles

        rm -r /usr/src/Aetna_Files
        rm -r /usr/src/Coventry_Files
        rm -r /usr/src/WLP_Info
        rm -r /usr/src/AnthemExtrasWritablePDFFiles
        rm -r /usr/src/CompletedAnthemExtrasPDFFiles

        # Mount network drives
        mount -a
    }

    function Settings()
    {

        # Disable welcome screen
        if [ -f /usr/bin/mintwelcome ]; then
            mv /usr/bin/mintwelcome /usr/bin/mintwelcome.bak
        fi

        # Create startup directory
        if [ ! -d /home/$1/.config/autostart ]; then
            mkdir /home/$1/.config/autostart
        fi

        # Copy shortcuts and seeds from HAL
        cp -a /usr/src/IT_Files/Linux/xfce-uni/shortcuts/. /home/$1/Desktop
        cp -a /usr/src/IT_Files/Linux/xfce-uni/seeds/Zoiper/Production/AetnaXE/Sip1/* /home/$1/.Zoiper/
        cp /usr/src/IT_Files/Linux/xfce-uni/startup/update.desktop /home/$1/.config/autostart
        cp /home/$1/Desktop/Zoiper.desktop /home/$1/.config/autostart/
        
        # Write Zoiper settings
        clear
        echo "Writing Settings..."
        /usr/src/IT_Files/Linux/check_ext_range.sh
        # read -p "Enter extension: " ext
        # read -p "Enter sip: " sip
        # /usr/src/IT_Files/Linux/xfce-uni/preferences/aet-zoip.sh "$1" $ext $sip

        # Write profile update crons
        echo "* * * * * root /usr/bin/"

        # Call preference scripts
        /usr/src/IT_Files/Linux/xfce-uni/preferences/screensaver.sh "$1"
        /usr/src/IT_Files/Linux/xfce-uni/preferences/theme.sh "$1"
        /usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "$1"
        /usr/src/IT_Files/Linux/xfce-uni/preferences/compositing.sh "$1"
        /usr/src/IT_Files/Linux/xfce-uni/preferences/icons.sh "$1"
        /usr/src/IT_Files/Linux/xfce-uni/preferences/lockscreen.sh "$1"
        /usr/src/IT_Files/Linux/xfce-uni/preferences/panel.sh "$1"
        /usr/src/IT_Files/Linux/xfce-uni/preferences/mimelist.sh "$1"
        /usr/src/IT_Files/Linux/xfce-uni/preferences/pointers.sh "$1"
        #/usr/src/IT_Files/Linux/xfce-uni/preferences/blacklist_update.sh
        #cp -r /usr/src/IT_Files/Linux/new_defaults/aet/web$sip/Default /home/$1/.config/google-chrome/
        sleep 3
        xdg-mime default wfica.desktop application/x-ica
        
        # Remove home directory folders
        foldersArray=(
                    "/home/$1/Documents"
                    "/home/$1/Music"
                    "/home/$1/Pictures"
                    "/home/$1/Public"
                    "/home/$1/Templates"
                    "/home/$1/Videos"
                    )

        for i in ${foldersArray[@]}; do
            if [ -d $i ]; then
                rm -r $i
                clear
                echo -e "$COL_RED $i is being removed. $COL_RESET"
                sleep 1
            else
                message="No unwanted home folders found."
            fi
        done

        clear
        echo -e "$COL_GREEN $message $COL_RESET"
        sleep 2

        # Remove Wine start menu entries
        wine1=/usr/share/applications/wine-browsedrive.desktop
        wine2=/usr/share/applications/wine-notepad.desktop
        wine3=/usr/share/applications/wine-uninstaller.desktop

        if [ -f $wine1 ]; then
            rm $wine1
        fi
        if [ -f $wine2 ]; then
            rm $wine2
        fi
        if [ -f $wine3 ]; then
            rm $wine3
        fi
        
        # Remove stock wallpaper and copy over new
        rm /usr/share/xfce4/backdrops/*
        rm -r /usr/share/wallpapers/
        rm /usr/share/backgrounds/xfce/xfce-blue.jpg
        cp /usr/src/IT_Files/Linux/wallpaper/agent_background_aetna_3.png /usr/share/xfce4/backdrops/linuxmint.png
        cp /usr/src/IT_Files/Linux/wallpaper/agent_background_aetna_3.jpg /usr/share/backgrounds/xfce/xfce-blue.jpg
        
        # Create production environment flags
        touch /var/log/aet.flag
        touch /var/log/drx_scraper.flag
        rm /var/log/wlp.flag
        rm /var/log/wlp.log
        rm /var/log/aet.log
    }

    ### Function Calls ###
    #user=$1
    Initialize $user
    Settings $user
    /usr/src/IT_Files/Linux/xfce-uni/preferences/start_menu.sh "$user"
    ######################

    clear
    touch /home/$1/.aet_profiled.flag
    # read -p "System must be rebooted for DESKTOP changes to take effect. Reboot? (y/n) " answer
    # if [[ "$answer" == "y" ]]; then 
    #     echo "" 
    #     echo "### Rebooting system..."
    #     sleep 3
    #     reboot
    # else
    #     exit 0
    # fi
    #reboot
