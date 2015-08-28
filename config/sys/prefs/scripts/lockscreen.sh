#!/bin/bash

touch .Xresources /home/$1/

echo 'xscreensaver.splash: false

!font settings
xscreensaver.Dialog.headingFont:        -*-dina-bold-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.bodyFont:           -*-dina-medium-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.labelFont:          -*-dina-medium-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.unameFont:          -*-dina-medium-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.buttonFont:         -*-dina-bold-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.dateFont:           -*-dina-medium-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.passwd.passwdFont:         -*-dina-bold-r-*-*-12-*-*-*-*-*-*-*

!general dialog box (affects main hostname, username, password text)
xscreensaver.Dialog.foreground:         #ffffff
xscreensaver.Dialog.background:         #111111
xscreensaver.Dialog.topShadowColor:     #111111
xscreensaver.Dialog.bottomShadowColor:  #111111
xscreensaver.Dialog.Button.foreground:  #666666
xscreensaver.Dialog.Button.background:  #ffffff

!username/password input box and date text colour
xscreensaver.Dialog.text.foreground:    #666666
xscreensaver.Dialog.text.background:    #ffffff
xscreensaver.Dialog.internalBorderWidth:24
xscreensaver.Dialog.borderWidth:        20
xscreensaver.Dialog.shadowThickness:    2

!timeout bar (background is actually determined by Dialog.text.background)
xscreensaver.passwd.thermometer.foreground:  #ff0000
xscreensaver.passwd.thermometer.background:  #000000
xscreensaver.passwd.thermometer.width:       8

!datestamp format--see the strftime(3) manual page for details
xscreensaver.dateFormat:    %I:%M%P %a %b %d, %Y' > /home/$1/.Xresources
