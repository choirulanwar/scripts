#!/bin/sh

#Update
sudo apt-get update -y
sudo apt-get upgrade -y

#Git
sudo apt-get install git -y

#Zsh
sudo apt-get install zsh -y
chsh -s /usr/bin/zsh
sh -c "$(yes | wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
source ~/.zshrc

#Ngrok
sudo apt-get update -y
sudo snap install --classic ngrok

#NodeJS
KEYRING=/usr/share/keyrings/nodesource.gpg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | sudo tee "$KEYRING" >/dev/null
gpg --no-default-keyring --keyring "$KEYRING" --list-keys
VERSION=node_16.x
KEYRING=/usr/share/keyrings/nodesource.gpg
DISTRO="$(lsb_release -s -c)"
echo "deb [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src [signed-by=$KEYRING] https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list
sudo apt-get install nodejs -y

#Go
wget https://golang.org/dl/go1.17.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
source ~/.zshrc
rm -rf go1.17.1.linux-amd64.tar.gz

#Node packages
sudo npm i -g npkill pnpm

#Hugo
sudo npm i -g hugo-bin

#Docker
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Pull docker image
docker pull mongo
docker pull redis:alpine
docker pull node:alpine
docker pull alpine:latest
docker pull ubuntu:latest

#Run container
docker-compose up -d --build --force-recreate 

######################################################################

#Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb

#VSCode
sudo snap install --classic code

#Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - \
sudo apt-get install apt-transport-https -y \
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list \
sudo apt-get update -y \
sudo apt-get install sublime-text -y

#MongoDB Compass
wget https://downloads.mongodb.com/compass/mongodb-compass_1.28.4_amd64.deb
sudo dpkg -i mongodb-compass_1.28.4_amd64.deb
rm -rf mongodb-compass_1.28.4_amd64.deb

#Insomnia
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
	| sudo tee -a /etc/apt/sources.list.d/insomnia.list
sudo apt-get update -y
sudo apt-get install insomnia -y

#VLC
sudo snap install --classic vlc

#Telegram
sudo snap install --classic telegram-desktop