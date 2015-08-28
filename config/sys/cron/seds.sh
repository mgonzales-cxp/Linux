#!/bin/bash

# Deletes scan summary from clamav.log

sed -i '/IT_Files/d' /usr/src/IT_Files/Linux/logs/clamav.log
sed -i '/SCAN SUMMARY/d' /usr/src/IT_Files/Linux/logs/clamav.log
sed -i '/Known viruses/d' /usr/src/IT_Files/Linux/logs/clamav.log
sed -i '/Engine version/d' /usr/src/IT_Files/Linux/logs/clamav.log
sed -i '/Scanned directories/d' /usr/src/IT_Files/Linux/logs/clamav.log
sed -i '/Scanned files/d' /usr/src/IT_Files/Linux/logs/clamav.log
sed -i '/Total errors/d' /usr/src/IT_Files/Linux/logs/clamav.log
sed -i '/Data scanned/d' /usr/src/IT_Files/Linux/logs/clamav.log
sed -i '/Data read/d' /usr/src/IT_Files/Linux/logs/clamav.log
sed -i '/Time/d' /usr/src/IT_Files/Linux/logs/clamav.log
