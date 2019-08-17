#!/bin/sh

# rTorrent startup script
chmod 555 /usr/local/etc/rc.d/rtorrent
sysrc -f /etc/rc.conf rtorrent_enable="YES"

# Create flood folder
mkdir -p /usr/local/etc/rtorrent/flood
chmod 755 /usr/local/etc/rtorrent/flood
cd /usr/local/etc/rtorrent || exit 1

# Download sources
git clone https://github.com/Flood-UI/flood.git
cd flood || exit 1
mv -rf /root/rtorrent/flood/* .

npm install
npm run build

# Start the service
rtorrent &
npm start
