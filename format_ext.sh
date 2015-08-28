#!/bin/bash

formatted_ext=$(hostname | tail -c 5)

echo $formatted_ext

if [[ $formatted_ext > 2999 ]] && [[ $formatted_ext < 3000 ]]; then
	cp /usr/src/IT_Files/Linux/new_defaults/aet/web1/Default/Bookmarks
	cp /usr/src/IT_Files/Linux/new_defaults/aet/web1/Default/Bookmarks
else
	echo "False"
fi
