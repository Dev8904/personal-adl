#!/bin/bash
#set -e

##################################################################################################################
#Author  : Jonathan Marshall
#Github  : https://github.com/Dev8904
###########################################################################################################################

#Declaring our installed directory
installed_dir=$(dirname "$(readlink -f "$(basename "$(pwd)")")")

##################################################################################################################
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
INSTLOG="install.log"

username=$(id -u -n 1000)

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
apt install nala -y

# Making primary directories .config and Moving config files and background to Pictures
cd $installed_dir
bash general.sh
chown -R $username:$username /home/$username

# Installing Essential Programs 
nala install feh kitty picom thunar nitrogen lxpolkit x11-xserver-utils unzip wget pulseaudio pulseeffects tlp brightnessctl pavucontrol variety build-essential libx11-dev libxft-dev libimlib2-dev libxinerama-dev -y
# Installing Other less important Programs
nala install neofetch flameshot psmisc mangohud code lxappearance papirus-icon-theme lxappearance meld mintstick catfish zenity gitfiend tldr fonts-noto-color-emoji lightdm -y

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Installing fonts
cd $installed_dir 
nala install fonts-font-awesome -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /usr/local/share/fonts
mv settings/fonts/otfs/*.otf /usr/local/share/fonts/
mv settings/fonts/* /usr/local/share/fonts/
chown $username:$username /usr/local/share/fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd $installed_dir
rm -rf Nordzy-cursors

# Install Firefox
nala install firefox

# Enable graphical login and change target from CLI to GUI
systemctl enable lightdm
systemctl set-default graphical.target

# Beautiful bash
git clone https://github.com/Dev8904/mybash
cd mybash
bash setup.sh
cd $installed_dir

# Use nala
bash settings/nala/usenala

#general
bash gen.sh

#install dwm
git clone https://github.com/Dev8904/arto-chadwm
cd arto-chadwm
bash install.sh
cd $installed_dir

echo "Set up complete"
sleep 5
exit
