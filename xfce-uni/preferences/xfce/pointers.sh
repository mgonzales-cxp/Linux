#!/bin/bash

echo '<?xml version="1.0" encoding="UTF-8"?>

<channel name="pointers" version="1.0">
  <property name="Plantronics_Plantronics_DA45" type="empty">
    <property name="Properties" type="empty">
      <property name="Device_Enabled" type="int" value="0"/>
    </property>
  </property>
</channel>' > /home/$1/.config/xfce4/xfconf/xfce-perchannel-xml/pointers.xml
