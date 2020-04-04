#!/bin/bash
cd /root/blacklist

wget -N --no-cache https://antifilter.download/list/ipsum.lst https://antifilter.download/list/subnet.lst

cat /root/blacklist/ipsum.lst | sed 's_.*_route & reject;_' > /etc/bird/ipsum.txt
cat /root/blacklist/subnet.lst | sed 's_.*_route & reject;_' > /etc/bird/subnet.txt
rm /root/blacklist/ipsum.lst /root/blacklist/subnet.lst

/usr/sbin/birdc configure;
