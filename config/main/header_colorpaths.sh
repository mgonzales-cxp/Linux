#!/bin/bash
# header_colorpaths.sh
# Header for only colors and script paths

# Hostname
ext=$(hostname)

# Username
usr=$(logname)


# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

# Paths
main=/usr/src/IT_Files/Linux/config/main/main.sh
header=/usr/src/IT_Files/Linux/config/main/header.sh
settings=/usr/src/IT_Files/Linux/config/main/settings.sh
network_manager=/usr/src/IT_Files/Linux/config/main/network_manager.sh
software=/usr/src/IT_Files/Linux/config/main/software.sh
client=/usr/src/IT_Files/Linux/config/main/client.sh
usb=/usr/src/IT_Files/Linux/config/main/usb.sh
tasks=/usr/src/IT_Files/Linux/config/main/tasks.sh
noc=/usr/src/IT_Files/Linux/config/main/noc.sh
config_args=/usr/src/IT_Files/Linux/config/main/args.sh