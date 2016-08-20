#!/bin/sh

#
# the brj elementary bolgenos script ;-)
# http://brj.pp.ru/
#

sudo apt-get -y install git zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sudo chsh -s /bin/zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
