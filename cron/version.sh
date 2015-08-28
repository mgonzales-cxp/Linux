#!/bin/bash

line=$(head -n 1 /etc/issue)
cat /etc/issue | grep "17.1" &>/dev/null
if [[ "$?" != "0" ]]; then
	echo "OS version is not current: $line"
fi
