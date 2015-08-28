#!/bin/bash

echo '<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-panel" version="1.0">
  <property name="configver" type="empty"/>
  <property name="panels" type="empty">
    <property name="panel-1" type="empty">
      <property name="position" type="empty"/>
      <property name="length" type="empty"/>
      <property name="position-locked" type="empty"/>
      <property name="size" type="empty"/>
      <property name="background-style" type="empty"/>
      <property name="background-alpha" type="empty"/>
      <property name="enter-opacity" type="empty"/>
      <property name="leave-opacity" type="empty"/>
      <property name="plugin-ids" type="array">
        <value type="int" value="1"/>
        <value type="int" value="4"/>
        <value type="int" value="3"/>
        <value type="int" value="8"/>
        <value type="int" value="15"/>
        <value type="int" value="7"/>
        <value type="int" value="6"/>
        <value type="int" value="5"/>
      </property>
    </property>
  </property>
  <property name="plugins" type="empty">
    <property name="plugin-1" type="empty"/>
    <property name="plugin-3" type="empty">
      <property name="show-handle" type="empty"/>
    </property>
    <property name="plugin-15" type="empty">
      <property name="expand" type="empty"/>
      <property name="style" type="empty"/>
    </property>
    <property name="plugin-5" type="empty">
      <property name="digital-format" type="string" value="%I:%M %p"/>
    </property>
    <property name="plugin-6" type="empty">
      <property name="names-visible" type="array">
        <value type="string" value="networkmanager applet"/>
        <value type="string" value="mintupdate.py"/>
        <value type="string" value="thunar"/>
        <value type="string" value="opera"/>
      </property>
      <property name="show-frame" type="empty"/>
    </property>
    <property name="plugin-2" type="empty"/>
    <property name="plugin-4" type="empty"/>
    <property name="plugin-7" type="empty">
      <property name="known-indicators" type="array">
        <value type="string" value="libapplication.so"/>
        <value type="string" value="com.canonical.indicator.sound"/>
      </property>
    </property>
    <property name="plugin-9" type="empty">
      <property name="items" type="empty"/>
    </property>
    <property name="plugin-10" type="empty">
      <property name="items" type="empty"/>
    </property>
    <property name="plugin-8" type="string" value="launcher">
      <property name="items" type="array">
        <value type="string" value="14290360412.desktop"/>
      </property>
      <property name="show-label" type="bool" value="true"/>
    </property>
  </property>
</channel>' > /home/$1/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

cp -r /usr/src/IT_Files/Linux/xfce-uni/preferences/launcher-8 /home/$1/.config/xfce4/panel
