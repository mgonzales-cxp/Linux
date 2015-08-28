#!/bin/bash
echo "Configuring resolveconf for persistent nameserver settings..."
echo "nameserver 192.168.106.15" >> /etc/resolvconf/resolv.conf.d/head
echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/head
resolvconf -u
cat /etc/resolv.conf
