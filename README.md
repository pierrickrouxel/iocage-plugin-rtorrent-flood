# iocage-plugin-rtorrent-flood

Artifact file(s) for rTorrent Flood iocage plugin.

## rTorrent

Download directory: `/home/rtorrent/download`.

## Flood

Default credentials :
User : admin
Password : admin

## Test

```sh
iocage fetch -P --name rtorrent-flood.json dhcp=on --branch develop ip4_addr="bge0|10.141.1.100"
```

## OpenVPN

Copy `openvpn.conf` and `pass.txt` to `/usr/local/etc/openvpn`.

sysrc -f /etc/rc.conf openvpn_enable="YES"
sysrc -f /etc/rc.conf firewall_enable="YES"

service openvpn start
service ipfw start