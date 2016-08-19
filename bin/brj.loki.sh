#!/bin/sh

#
# the brj elementary bolgenos script ;-)
# http://brj.pp.ru/
#


beroot() {

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

}


beroot

sudo apt-get -y install figlet dpkg
sudo apt-get -y install software-properties-common



upkeyz() {
figlet "upkeys" && sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com `sudo aptitude update 2>&1 | grep -o '[0-9A-Z]\{16\}$' | xargs`
}

sysup() {

figlet "update"     && sudo apt-get -y update
figlet "dist-up"    && sudo apt-get -y dist-upgrade
figlet "force deps" && sudo apt-get -y -f install
figlet "remove"     && sudo apt-get -y autoremove
figlet "autoclean"
sudo apt-get -y autoclean
sudo apt-get -y clean
sudo dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt-get -y purge
sudo updatedb
figlet "done"
}

# add repos
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:atareao/telegram
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:me-davidsansome/clementine
sudo add-apt-repository -y ppa:transmissionbt/ppa
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:ubuntu-wine/ppa

# no ppa repos
echo 'deb http://www.tataranovich.com/debian xenial main' > /etc/apt/sources.list.d/tataranovich.list
echo 'deb http://archive.canonical.com/ubuntu xenial partner' > /etc/apt/sources.list.d/partner.list
echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list

# =========================================================
# begin up keys + ppa
# =========================================================

upkeyz
sysup

# begin install
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
#
sudo apt-get -y install aptitude cowsay curl dpkg aria2 mc git figlet
sudo apt-get -y install language-pack-en language-pack-ru
sudo apt-get -y install molly-guard openssh-server htop uget preload pollinate smartmontools ethtool 

# install my own
sudo apt-get -y install unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract
sudo apt-get -y install quiterss
sudo apt-get -y install keepassx
sudo apt-get -y install remmina remmina-plugin-rdp
sudo apt-get -y install libreoffice libreoffice-gtk libreoffice-pdfimport libreoffice-avmedia-backend-gstreamer libreoffice-style-sifr libreoffice-lightproof-ru-ru libreoffice-help-ru libreoffice-l10n-ru
sudo apt-get -y install ubuntu-restricted-extras 
sudo apt-get -y install ffmpeg x264 libdvdread4 vlc browser-plugin-vlc
sudo apt-get -y install clementine
sudo apt-get -y install mypaint
sudo apt-get -y install transmission minissdpd natpmp-utils
sudo apt-get -y install telegram
sudo apt-get -y install pidgin pidgin-plugin-pack
sudo apt-get -y install birdie
sudo apt-get -y install tshark
sudo apt-get -y install elementary-tweaks
sudo apt-get -y install sublime-text
sudo apt-get -y install --allow-unauthenticated google-chrome-stable

# degarbage system
#sudo apt-get -y purge midori-granite noise software-center bluez modemmanager scratch-text-editor 
#sudo apt-get -y purge pantheon-photos* audience

sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-bluetooth.plug
sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-wacom.plug

cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

#
# the end, the brj elementary bolgenos script ;-)
# http://brj.pp.ru/
#

#sudo apt-get install -y gdebi guake glipper doublecmd-gtk xournal powertop preload smartmontools ethtool qt4-qtconfig dconf-tools
#sudo apt-get install -y adobe-flashplugin furiusisomount
