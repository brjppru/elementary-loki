#!/bin/sh

# bolgenos for elementaryos-0.4-stable-amd64.20160921.iso

# =========================================================
# begin up keys + ppa
# =========================================================
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

# =========================================================
# begin up keys + ppa
# =========================================================

beroot

sudo apt-key -y net-update

sudo apt -y update
sudo apt -y full-upgrade

sudo service apparmor stop
sudo update-rc.d -f apparmor remove

sudo apt-get -y update

sudo apt-get -y install apt-transport-https ca-certificates figlet dpkg bleachbit deborphan dconf-editor
sudo apt-get -y install software-properties-common software-properties-gtk debconf-utils aptitude ppa-purge bzip2 gdebi

# =========================================================
# nuke it!
# =========================================================

sudo apt-get -y purge apparmor apparmor-utils noise pantheon-photos* audience evolution-data-server
sudo apt-get -y purge activity-log-manager-common activity-log-manager-control-center zeitgeist zeitgeist-core zeitgeist-datahub
sudo apt-get -y purge modemmanager appcenter
sudo apt-get -y purge sane pantheon-mail
sudo apt-get -y purge switchboard-plug-parental-controls
sudo apt-get -y purge apport apport-gtk apport-hooks-elementary apport-symptoms elementary-os-prerelease elementaryos-report-problem-dockitem 
sudo apt-get -y purge evolution-data-server-google2 evolution-data-server-outlook evolution-data-server-pantheon-online-accounts 
sudo apt-get -y purge fonts-opendyslexic gsignond gsignond-extension-pantheon gsignond-plugin-lastfm gsignond-plugin-oauth libaccounts-glib0 
sudo apt-get -y purge libgsignon-glib1 libgsignond-common0 libpantheon-online-accounts0 pantheon-online-accounts-plugin-lastfm python3-apport 
sudo apt-get -y purge python3-problem-report switchboard-plug-parental-controls

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

figlet "update"     && sudo apt-get -y update
figlet "dist-up"    && sudo apt-get -y dist-upgrade
figlet "force deps" && sudo apt-get -y -f install
figlet "remove"     && sudo apt-get -y autoremove
figlet "autoclean"
sudo apt-get -y autoclean
sudo apt-get -y clean
sudo apt -y autoremove
sudo apt -y autoclean
sudo dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt-get -y purge
sudo apt -y -f install
sudo updatedb
figlet "done"
}


# =========================================================
# add repos
# =========================================================
#

figlet "add key's"

sudo add-apt-repository -y ppa:yunnxx/elementary
sudo add-apt-repository -y ppa:oibaf/graphics-drivers
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
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:linphone/release
sudo add-apt-repository -y ppa:wireshark-dev/stable
sudo add-apt-repository -y ppa:ubuntuhandbook1/apps
sudo add-apt-repository -y ppa:quiterss/quiterss
sudo add-apt-repository -y ppa:ricotz/docky

# sleeping 
#sudo apt-add-repository -y ppa:nathandyer/vocal-daily
#sudo add-apt-repository -y ppa:me-davidsansome/clementine
#sudo add-apt-repository -y ppa:nathan-renniewaldock/flux

# no ppa repos
echo 'deb http://www.tataranovich.com/debian xenial main' > /etc/apt/sources.list.d/tataranovich.list
#
echo 'deb http://archive.canonical.com/ubuntu xenial partner' > /etc/apt/sources.list.d/partner.list
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list

# =========================================================
# begin up keys + ppa
# =========================================================

upkeyz
sysup

# =========================================================
# begin install
# =========================================================
#
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
echo wireshark-common wireshark-common/install-setuid boolean true | debconf-set-selections
#
sudo apt-get -y install tataranovich-keyring
#
sudo apt-get -y install aptitude cowsay curl dpkg aria2 zsh fonts-powerline git figlet lnav xkbset
sudo apt-get -y install language-pack-en language-pack-ru
sudo apt-get -y install android-tools-adb android-tools-fastboot bluetooth
sudo apt-get -y install libfuse-dev android-tools-adb
sudo apt-get -y install ssmtp whois zram-config
sudo apt-get -y install gtk-redshift
sudo apt-get -y install haveged molly-guard ncdu openssh-server htop powertop uget preload pollinate smartmontools ethtool fdupes
#
# install my own
#
#sudo apt-get -y install remmina remmina-plugin-rdp
#sudo apt-get -y install vdpau-va-driver libvdpau-va-gl1 libvdpau1 vlc browser-plugin-vlc
#sudo apt-get -y install fluxgui
#sudo apt-get -y install caffeine
#
sudo apt-get -y install unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract wget curl
sudo apt     -y install zip unzip p7zip p7zip-rar rar unrar
sudo apt-get -y install quiterss elinks liferea
sudo apt-get -y install keepassx
sudo apt-get -y install libreoffice libreoffice-gtk libreoffice-pdfimport libreoffice-avmedia-backend-gstreamer libreoffice-style-sifr libreoffice-lightproof-ru-ru libreoffice-help-ru libreoffice-l10n-ru
sudo apt-get -y install ubuntu-restricted-extras 
sudo apt-get -y install ffmpeg x264 libdvdread4 lame
sudo apt-get -y install vlc browser-plugin-vlc
sudo apt-get -y install mypaint viewnior
sudo apt-get -y install elementary-wallpapers-extra
sudo apt-get -y install comixcursors-righthanded-opaque comixcursors-righthanded
sudo apt-get -y install transmission minissdpd natpmp-utils
sudo apt-get -y install telegram
sudo apt-get -y install tshark iftop
sudo apt-get -y install putty
sudo apt-get -y install homebank
sudo apt-get -y install xournal
sudo apt-get -y install elementary-tweaks
sudo apt-get -y install doublecmd-gtk
sudo apt-get -y install freerdp
sudo apt-get -y install tlp tlp-rdw
sudo apt-get -y install sublime-text
sudo apt-get -y install glipper xclip xsel
sudo apt-get -y install pushbullet-indicator
sudo apt-get -y install lame
sudo apt-get -y install sqlite3
sudo apt-get -y install torbrowser-launcher
sudo apt-get -y install smartmontools ethtool qt4-qtconfig dconf-tools
sudo apt-get -y install xserver-xorg-video-intel
sudo apt-get -y install audacious audacious-plugins
sudo apt-get -y install thunderbird
sudo apt-get -y install flashplugin-installer pepperflashplugin-nonfree
sudo apt-get -y install linphone
sudo apt-get -y install corebird
sudo apt-get -y install dosbox
sudo apt-get -y install wine
sudo apt-get -y install hardinfo
sudo apt-get -y install gtk-recordmydesktop
sudo apt-get -y install audacity
sudo apt-get -y install gparted gnome-disk-utility
sudo apt-get -y install ntfs-config
sudo apt-get -y install systemd-ui
sudo apt-get -y install elementary-indicator-places

sudo apt-get -y install xfonts-terminus console-terminus
sudo apt-get -y install ttf-dejavu
sudo apt-get -y install ttf-liberation
sudo apt-get -y install fonts-elementary-core fonts-droid-fallback

sudo apt-get -y install --allow-unauthenticated google-chrome-stable mc

sudo apt --purge remove -y plank
sudo apt install -y --reinstall plank

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
