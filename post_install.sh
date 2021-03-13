#!/bin/sh

pw useradd rtorrent -g 0 -m
pw useradd rtorrent_flood -g 0 -m

mkdir -p /home/rtorrent_flood/flood
chown rtorrent_flood /home/rtorrent_flood/flood

npm install --global flood

# Enable services
sysrc -f /etc/rc.conf rtorrent_enable="YES"
sysrc -f /etc/rc.conf rtorrent_flood_enable="YES"

# Start the service
service rtorrent start
service rtorrent_flood start

echo "Flood ui credentials" > /root/PLUGIN_INFO
echo "User: admin" >> /root/PLUGIN_INFO
echo "Password: admin" >> /root/PLUGIN_INFO

# OpenVPN directory
mkdir /usr/local/etc/openvpn

# Define firewall rules
sysrc -f /etc/rc.conf firewall_script="/etc/ipfw.rules"
