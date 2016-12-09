#!/bin/sh

sudo apt -y install git
git clone https://github.com/btd1337/elementary-full-icon-theme
sudo mv elementary-full-icon-theme /usr/share/icons/
gsettings set org.gnome.desktop.interface icon-theme "elementary-full-icon-theme"

