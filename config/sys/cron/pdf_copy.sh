#!/bin/bash

for D in /home/*; do
	if [ -d "${D}" ]; then
		cp ${D}/*.pdf /usr/src/CompletedAnthemExtrasPDFFiles/ToBeReviewed
	fi
done
