#!/bin/bash

user=$(logname)
ext=$(hostname)

sleep 30

# Start VNC service
/usr/src/IT_Files/Linux/config/sys/vnc.sh
#x11vnc -usepw -bg -display :0 -forever -shared -rfbport 5901 -auth guess
