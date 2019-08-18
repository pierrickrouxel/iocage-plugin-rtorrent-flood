#!/bin/sh

npm install -g forever

# rTorrent startup script
chmod 555 /usr/local/etc/rc.d/rtorrent
sysrc -f /etc/rc.conf rtorrent_enable="YES"

# rTorrent Flood startup script
chmod 555 /usr/local/etc/rc.d/rtorrent_flood
sysrc -f /etc/rc.conf rtorrent_flood_enable="YES"

# Create flood folder
mkdir -p /usr/local/etc/rtorrent
chmod 755 /usr/local/etc/rtorrent
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
