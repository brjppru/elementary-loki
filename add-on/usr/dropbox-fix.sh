#!/bin/sh

sudo apt --purge remove -y dropbox*
sudo apt -y install git python-gpgme
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
sudo bash /tmp/elementary-dropbox/install.sh

sudo chown -R brj:brj .dropbox-bin 
sudo chown -R brj:brj .dropbox-dist

echo do chmod for `whoami`
