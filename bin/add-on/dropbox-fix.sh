#!/bin/sh

sudo apt -y install git
sudo apt --purge remove -y dropbox*
sudo apt -y install python-gpgme
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
sudo bash /tmp/elementary-dropbox/install.sh

