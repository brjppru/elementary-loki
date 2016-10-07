#!/bin/sh

exit 0 

cd /usr/share/wine/fonts
rm tahoma.ttf
rm tahomabd.ttf
ln -s /usr/share/fonts/truetype/ttf-dejavu/DejaVuSansMono.ttf ./tahoma.ttf
ln -s /usr/share/fonts/truetype/ttf-dejavu/DejaVuSansMono-Bold.ttf ./tahomabd.ttf
