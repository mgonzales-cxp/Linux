#!/bin/bash

echo '[Default Applications]
application/x-ica=wfica.desktop
application/pdf=qpdfview.desktop

[Added Associations]
application/pdf=qpdfview.desktop;
x-scheme-handler/http=exo-web-browser.desktop
x-scheme-handler/https=exo-web-browser.desktop
' > /home/$1/.local/share/applications/mimeapps.list
