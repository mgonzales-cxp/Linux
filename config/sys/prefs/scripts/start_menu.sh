#!/bin/bash

echo 'favorites=google-chrome.desktop,zoiper.desktop,gedit.desktop,gcalctool.desktop
button-title=Start
button-icon=/usr/src/IT_Files/Linux/cXp_Logos/right_leg.png
button-single-row=false
show-button-title=true
show-button-icon=true
launcher-show-name=true
launcher-show-description=true
item-icon-size=2
hover-switch-category=true
category-icon-size=1
load-hierarchy=false
favorites-in-recent=true
display-recent-default=false
position-search-alternate=true
position-commands-alternate=false
position-categories-alternate=true
menu-width=400
menu-height=500
command-settings=xfce4-settings-manager
show-command-settings=true
command-lockscreen=xflock4
show-command-lockscreen=true
command-switchuser=gdmflexiserver
show-command-switchuser=true
command-logout=xfce4-session-logout
show-command-logout=true
command-menueditor=menulibre
show-command-menueditor=true
search-actions=4

[action0]
name=Man Pages
pattern=#
command=exo-open --launch TerminalEmulator man %s
regex=false

[action1]
name=Wikipedia
pattern=!w
command=exo-open --launch WebBrowser https://en.wikipedia.org/wiki/%u
regex=false

[action2]
name=Run in Terminal
pattern=!
command=exo-open --launch TerminalEmulator %s
regex=false

[action3]
name=Open URI
pattern=^(file|http|https):\\/\\/(.*)$
command=exo-open \\0
regex=true
' > /home/$1/.config/xfce4/panel/whiskermenu-1.rc
