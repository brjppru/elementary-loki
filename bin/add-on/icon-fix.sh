#!/bin/sh

sudo apt -y install git
git clone https://github.com/btd1337/elementary-full-icon-theme
sudo mv elementary-full-icon-theme /usr/share/icons/
gsettings set org.gnome.desktop.interface icon-theme "elementary-full-icon-theme"

### Install ePapirus icon theme
#wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-root.sh | sh
#wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-libreoffice-theme/master/install-papirus-root.sh | sh

# tray hardcore
hardcode-tray -ug
hardcode-tray -s 24 -fs

