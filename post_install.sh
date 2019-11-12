#!/bin/sh

pw useradd rtorrent -d /root -g 0

npm install -g forever

# rTorrent startup script
chmod 555 /usr/local/etc/rc.d/rtorrent
sysrc -f /etc/rc.conf rtorrent_enable="YES"

# rTorrent Flood startup script
chmod 555 /usr/local/etc/rc.d/rtorrent_flood
sysrc -f /etc/rc.conf rtorrent_flood_enable="YES"

# Create flood folder
mkdir -p /usr/local/etc/rtorrent
chown rtorrent /usr/local/etc/rtorrent
cd /usr/local/etc/rtorrent || exit 1

# Download sources
git clone https://github.com/Flood-UI/flood.git
cd flood || exit 1
cp -rf /root/rtorrent/flood/* .

npm install
npm run build

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
