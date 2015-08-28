#!/bin/bash
# config.sh

# Include header
source /usr/src/IT_Files/Linux/config/main/header.sh &>/dev/null

#### ARGUMENTS #########################################################
arg=$1

function RootCheck()
{
	if [[ "$1" != "" ]]; then
		if [[ "$EUID" == "0" ]]; then
			RunArg $arg
		else
			clear
			echo "You must be root to execute this commmand."
			exit 1
		fi
	fi
}

function RunArg()
{
	args=(
		'init'
		'vnc'
		'aet'
		'wlp'
		'uni'
		'pdf'
		'dns'
		'fstab'
		'roy'
		'chat'
		'vga'
		'ossec'
		'ossecrmv'
		'ossecforce'
		'rmzoip'
		'slc'
		'launcher'
		'flag'
		'host'
		'tbt'
		)

	for i in ${args[@]}; do
		if [[ "$i" == "$1" ]]; then
			$config_args "$i"
			exit 0
		fi
	done
}

RootCheck $arg

#### CHECK CREDENTIALS #################################################

if [ -d /usr/src/IT_Files ] && [ "$EUID" != "0" ]; then
	clear
	read -s -p "Password: " password
	FILE=/usr/src/IT_Files/Linux/documents/sys/.pwcred
	exec 3<&0
	exec 0<$FILE
		
	while read line
	do
		#use $line variable to process line
		if [[ "$password" == $line ]]; then
			access="Cleared"
			echo $access
			#sleep 1
			break
		else
			access="Failed"
			echo $access
			sleep 1
			break
		fi
		#echo $line
	done
	exec 0<&3

	if [[ "$access" == "Failed" ]]; then
		exit 1
	fi
fi

### SCRIPT CALL ########################################################
$main
########################################################################
