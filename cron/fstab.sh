#!/bin/bash

sed -i '/IT_Files/c\//hal2.connexionpoint.com/IT_Files /usr/src/IT_Files cifs guest,uid=1000,iocharset=utf8,nobootwait  0  0' /etc/fstab
sed -i '/Aetna_Files/c\//hal2.connexionpoint.com/Aetna_Files /usr/src/Aetna_Files cifs credentials='$1'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
sed -i '/Coventry_Files/c\//hal2.connexionpoint.com/Coventry_Files /usr/src/Coventry_Files cifs credentials='$1'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
sed -i '/WLP_Info/c\//hal2.connexionpoint.com/WLP_Info /usr/src/WLP_Info cifs credentials='$1'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
sed -i '/AnthemExtrasWritablePDFFiles/c\//hal2.connexionpoint.com/AnthemExtrasWritablePDFFiles /usr/src/AnthemExtrasWritablePDFFiles cifs credentials='$1'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
sed -i '/CompletedAnthemExtrasPDFFiles/c\//hal2.connexionpoint.com/CompletedAnthemExtrasPDFFiles /usr/src/CompletedAnthemExtrasPDFFiles cifs credentials='$1'/.smbcredentials,iocharset=utf8,sec=ntlm,nobootwait 0 0' /etc/fstab
