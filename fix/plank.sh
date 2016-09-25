#!/bin/sh

sudo apt install software-properties-common
sudo add-apt-repository ppa:ricotz/docky
sudo apt update
sudo apt install --reinstall plank
killall plank
plank --preferences

