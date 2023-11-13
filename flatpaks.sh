#!/bin/bash
#set -e

##################################################################################################################
#Author  : Jonathan Marshall
#Github  : https://github.com/Dev8904
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname "$(readlink -f "$(basename "$(pwd)")")")

##################################################################################################################
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
flatpaks=( 
    org.mozilla.firefox
    com.valvesoftware.Steam
    net.lutris.Lutris
    com.heroicgameslauncher.hgl
    net.davidotek.pupgui2
    com.github.Matoking.protontricks
    com.github.tchx84.Flatseal
    org.videolan.VLC
    org.libreoffice.LibreOffice
    com.usebottles.bottles
    org.winehq.Wine
    org.linux_hardware.hw-probe
    com.discordapp.Discord
    org.qbittorrent.qBittorrent
    io.github.jordanl2.ModularCalculator
    com.gitfiend.GitFiend
    org.gnome.meld
    com.obsproject.Studio
    xyz.ketok.Speedtest
    org.DolphinEmu.dolphin-emu
    org.yuzu_emu.yuzu
    net.pcsx2.PCSX2
    org.mozilla.Thunderbird
    com.bitwarden.desktop
    org.signal.Signal
    com.github.micahflee.torbrowser-launcher
    com.slack.Slack
    org.kde.kdenlive
    org.audacityteam.Audacity
    com.stremio.Stremio
    com.google.AndroidStudio
    org.filezillaproject.Filezilla
    org.gnome.Maps
    org.gnome.Weather
    com.anydesk.Anydesk
    network.loki.Session
    com.tutanota.Tutanota
    me.timschneeberger.GalaxyBudsClient
    io.github.anirbandey1.ChatbotClient
)

##################################################################################################################
#####################Functions
##################################################################################################################
install_flatpaks() {
    package_name="$1"

    # Install the Flatpak package
    flatpak install -y flathub "$package_name"

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "Flatpak package '$package_name' installed successfully."
    else
        echo "Failed to install Flatpak package '$package_name'."
        exit 1
    fi
}

tput setaf 3
echo "################################################################"
echo "################### Lets Install Flatpaks"
echo "################################################################"
for SOFTWR in "${flatpaks[@]}"; do
        install_flatpaksPrograms "$SOFTWR" 
        done
clear
echo "################################################################"
echo "################### Installation Complete"
echo "################################################################"
echo
echo
sleep 2
