#!/bin/bash

echo '<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-desktop" version="1.0">
  <property name="backdrop" type="empty">
    <property name="screen0" type="empty">
      <property name="monitor0" type="empty">
        <property name="image-path" type="empty"/>
        <property name="last-image" type="empty"/>
        <property name="last-single-image" type="empty"/>
        <property name="brightness" type="empty"/>
      </property>
      <property name="monitorVGA1" type="empty">
        <property name="workspace0" type="empty">
          <property name="color-style" type="int" value="0"/>
          <property name="image-style" type="int" value="5"/>
          <property name="last-image" type="string" value="/usr/share/xfce4/backdrops/linuxmint.png"/>
        </property>
        <property name="workspace1" type="empty">
          <property name="color-style" type="int" value="0"/>
          <property name="image-style" type="int" value="5"/>
          <property name="last-image" type="string" value="/usr/share/xfce4/backdrops/linuxmint.png"/>
        </property>
        <property name="workspace2" type="empty">
          <property name="color-style" type="int" value="0"/>
          <property name="image-style" type="int" value="5"/>
          <property name="last-image" type="string" value="/usr/share/xfce4/backdrops/linuxmint.png"/>
        </property>
        <property name="workspace3" type="empty">
          <property name="color-style" type="int" value="0"/>
          <property name="image-style" type="int" value="5"/>
          <property name="last-image" type="string" value="/usr/share/xfce4/backdrops/linuxmint.png"/>
        </property>
      </property>
    </property>
  </property>
  <property name="desktop-icons" type="empty">
    <property name="icon-size" type="empty"/>
    <property name="file-icons" type="empty">
      <property name="show-filesystem" type="empty"/>
      <property name="show-home" type="bool" value="false"/>
      <property name="show-trash" type="empty"/>
      <property name="show-removable" type="bool" value="false"/>
    </property>
    <property name="show-thumbnails" type="empty"/>
    <property name="use-custom-font-size" type="empty"/>
    <property name="font-size" type="empty"/>
    <property name="style" type="empty"/>
    <property name="tooltip-size" type="empty"/>
    <property name="show-tooltips" type="empty"/>
  </property>
  <property name="desktop-menu" type="empty">
    <property name="show" type="empty"/>
  </property>
  <property name="last" type="empty">
    <property name="window-width" type="int" value="579"/>
    <property name="window-height" type="int" value="504"/>
  </property>
</channel>' > /home/$1/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
