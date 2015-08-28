#!/bin/bash

formatted_ext=$(hostname | tail -c 5)

echo $formatted_ext

function CopySeeds() {

	echo $(hostname) > /home/tagent/.ext
	sip=$1
	cp /usr/src/IT_Files/Linux/new_defaults/aet/web2/Default/Bookmarks /home/tagent/.config/google-chrome/Default
	cp /usr/src/IT_Files/Linux/new_defaults/aet/web2/Default/Preferences /home/tagent/.config/google-chrome/Default
	/usr/src/IT_Files/Linux/xfce-uni/preferences/aet-zoip.sh tagent $formatted_ext $sip
}

if [[ $formatted_ext > 4999 ]] && [[ $formatted_ext < 6000 ]]; then
	CopySeeds 1
elif [[ $formatted_ext > 5999 ]] && [[ $formatted_ext < 7000 ]]; then
	CopySeeds 2
fi
