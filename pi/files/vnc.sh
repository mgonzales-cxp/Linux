#!/bin/bash

x11vnc -usepw -bg -display :0 -forever -shared -rfbport 5901 -auth guess
