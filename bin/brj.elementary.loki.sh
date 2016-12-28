#!/bin/sh

# this is the brj elementary bolgenos script ;-)
# http://brj.pp.ru/
#
# bolgenos for elementaryos-0.4-stable-amd64.20160921.iso
# do not connect to internet and download updates


# =========================================================
# beroot
# =========================================================


beroot() {

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

}

# =========================================================
# begin up keys + ppa
# =========================================================

beroot

# =========================================================
# nuke it!
# =========================================================

sudo apt -y purge apparmor apparmor-utils noise pantheon-photos* audience evolution-data-server
sudo apt -y purge activity-log-manager-common activity-log-manager-control-center zeitgeist zeitgeist-core zeitgeist-datahub
sudo apt -y purge modemmanager appcenter
sudo apt -y purge sane pantheon-mail
sudo apt -y purge switchboard-plug-parental-controls
sudo apt -y purge apport apport-gtk apport-hooks-elementary apport-symptoms elementary-os-prerelease
sudo apt -y purge dropbox*
sudo apt -y purge elementaryos-report-problem-dockitem
sudo apt -y purge evolution-data-server-google2 evolution-data-server-outlook evolution-data-server-pantheon-online-accounts
sudo apt -y purge fonts-opendyslexic gsignond gsignond-extension-pantheon gsignond-plugin-lastfm gsignond-plugin-oauth
sudo apt -y purge libgsignon-glib1 libgsignond-common0 libpantheon-online-accounts0 pantheon-online-accounts-plugin-lastfm
sudo apt -y purge python3-problem-report switchboard-plug-parental-controls libaccounts-glib0 python3-apport

# =========================================================
# nuked locale
# =========================================================

sudo apt -y purge language-pack*
sudo apt -y install language-pack-en language-pack-gnome-en language-pack-gnome-en-base
#sudo apt -y install language-pack-gnome-ru language-pack-ru-base

# =========================================================
# begin up keys + ppa
# =========================================================

sudo apt -y update

sudo apt-key net-update

sudo apt -y full-upgrade

sudo service apparmor stop
sudo update-rc.d -f apparmor remove

sudo apt -y update

# =========================================================
# install needs
# =========================================================

sudo apt -y install apt-transport-https ca-certificates figlet dpkg deborphan dconf-editor python-gpgme
sudo apt -y install software-properties-common software-properties-gtk debconf-utils aptitude ppa-purge bzip2 gdebi
sudo apt -y install synaptic gdebi dconf-editor

# =========================================================
# upkeys
# =========================================================

upkeyz() {
figlet "upkeys"
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com `sudo aptitude update 2>&1 | grep -o '[0-9A-Z]\{16\}$' | xargs`
}

# =========================================================
# sysup
# =========================================================

sysup() {

figlet "update"
sudo apt -y update
figlet "dist-up"
sudo apt -y dist-upgrade
figlet "force install"
sudo apt-get -y -f install
figlet "autoclean"
sudo apt -y autoremove
sudo apt -y autoclean
sudo apt -y clean
sudo dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt -y purge
figlet "updatedb"
sudo updatedb
figlet "done"
}

# =========================================================
# add repos
# =========================================================
#

figlet "add key's"

sudo add-apt-repository -y ppa:andreas-angerer89/sni-qt-patched
sudo add-apt-repository -y ppa:varlesh-l/indicator-kdeconnect
sudo add-apt-repository -y ppa:yunnxx/elementary
#sudo add-apt-repository -y ppa:oibaf/graphics-drivers
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo add-apt-repository -y ppa:atareao/pushbullet
sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:ubuntuhandbook1/corebird
sudo add-apt-repository -y ppa:atareao/telegram
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:transmissionbt/ppa
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:linphone/release
sudo add-apt-repository -y ppa:wireshark-dev/stable
sudo add-apt-repository -y ppa:ricotz/docky
sudo add-apt-repository -y ppa:varlesh-l/loki

#sudo add-apt-repository -y ppa:ubuntu-wine/ppa
#sudo add-apt-repository -y ppa:ubuntuhandbook1/apps
#sudo add-apt-repository -y ppa:quiterss/quiterss

# no ppa repos
echo 'deb [trusted=yes] http://www.tataranovich.com/debian xenial main' > /etc/apt/sources.list.d/tataranovich.list
echo 'deb [trusted=yes] http://archive.canonical.com/ubuntu xenial partner' > /etc/apt/sources.list.d/partner.list
echo 'deb [trusted=yes arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list

# =========================================================
# begin up keys + ppa
# =========================================================

upkeyz
sysup
upkeyz

# =========================================================
# begin install
# =========================================================
#
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
echo wireshark-common wireshark-common/install-setuid boolean true | debconf-set-selections
#
sudo apt -y install tataranovich-keyring
#
sudo apt -y install aptitude cowsay curl dpkg aria2 zsh fonts-powerline git figlet lnav xkbset
sudo apt -y install android-tools-adb android-tools-fastboot bluetooth
sudo apt -y install libfuse-dev android-tools-adb
sudo apt -y install ssmtp whois zram-config
sudo apt -y install gtk-redshift
sudo apt -y install haveged molly-guard ncdu openssh-server htop powertop uget preload pollinate smartmontools ethtool fdupes

# replace plank plank
#sudo apt --purge remove -y plank
sudo apt install -y --reinstall plank
sudo apt -y install sni-qt hardcode-tray

#
# install my own
#
#sudo apt -y install wine
#sudo apt -y install elementary-indicator-places
#sudo apt -y install remmina remmina-plugin-rdp
#sudo apt -y install doublecmd-gtk
#sudo apt -y install vdpau-va-driver libvdpau-va-gl1 libvdpau1 vlc browser-plugin-vlc
#sudo apt -y install fluxgui
#sudo apt -y install quiterss elinks liferea
#
sudo apt -y install unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract wget curl
sudo apt -y install zip unzip p7zip p7zip-rar rar unrar elinks
sudo apt -y install gnome-system-monitor caffeine
sudo apt -y install keepassx
sudo apt -y install libreoffice libreoffice-gtk libreoffice-pdfimport libreoffice-avmedia-backend-gstreamer
sudo apt -y install libreoffice-style-sifr libreoffice-lightproof-ru-ru libreoffice-help-ru libreoffice-l10n-ru
sudo apt -y install ubuntu-restricted-extras
sudo apt -y install ffmpeg x264 libdvdread4 lame
sudo apt -y install vlc browser-plugin-vlc
sudo apt -y install mypaint viewnior
sudo apt -y install elementary-wallpapers-extra comixcursors-righthanded-opaque comixcursors-righthanded
sudo apt -y install transmission minissdpd natpmp-utils
sudo apt -y install telegram
sudo apt -y install tshark iftop
sudo apt -y install putty git
sudo apt -y install homebank
sudo apt -y install xournal
sudo apt -y install elementary-tweaks
sudo apt -y install freerdp
sudo apt -y install tlp tlp-rdw
sudo apt -y install sublime-text
sudo apt -y install glipper xclip xsel
sudo apt -y install pushbullet-indicator
sudo apt -y install lame
sudo apt -y install sqlite3
sudo apt -y install torbrowser-launcher
sudo apt -y install smartmontools ethtool qt4-qtconfig dconf-tools
#sudo apt -y install xserver-xorg-video-intel
sudo apt -y install audacious audacious-plugins
sudo apt -y install thunderbird
sudo apt -y install flashplugin-installer pepperflashplugin-nonfree
sudo apt -y install linphone
sudo apt -y install corebird
sudo apt -y install dosbox
sudo apt -y install hardinfo
#sudo apt -y install gtk-recordmydesktop
#sudo apt -y install audacity
sudo apt -y install gparted gnome-disk-utility usb-creator-gtk
sudo apt -y install ntfs-config git zsh fonts-powerline
sudo apt -y install systemd-ui
sudo apt -y install google-chrome-stable mc
sudo apt -y install indicator-kdeconnect libqt4-svg qt5ct
sudo apt -y install xfonts-terminus console-terminus ttf-dejavu ttf-liberation fonts-elementary-core fonts-droid-fallback
sudo apt -y install virt-manager

# =========================================================
# nuke archives
# =========================================================

rm -rf /var/cache/apt/archives

upkeyz
sysup

# =========================================================

notify-send -i utilities-terminal brj.done "All tasks ok successfully! ;-)"

# =========================================================
# the end
# =========================================================
#
# the end, the brj elementary bolgenos script ;-)
# http://brj.pp.ru/
#
