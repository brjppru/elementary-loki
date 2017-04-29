#!/bin/sh

sudo apt --purge remove -y dropbox*
sudo apt -y install git python-gpgme
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
sudo bash /tmp/elementary-dropbox/install.sh

echo do chmod for `whoami`
