#!/bin/bash

for filename in /usr/src/IT_Files/Linux/logs/hosts/*.log; do
    cat "${filename}"
done > /home/tech/Documents/catHosts.log

/usr/src/IT_Files/Linux/hostnameParser /home/tech/Documents/linux_list.txt /home/tech/Documents/catHosts.log
