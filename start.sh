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

#Ensure we have write permissions to the log
sudo chmod a+rw "$installed_dir/install.log"

#functions
command_exists () {
    command -v $1 >/dev/null 2>&1;
}

#Get system information.
echo "################################################################"
echo "###################Getting System Information..."
echo "################################################################"
tput sgr0
echo

  ## Check Package Handeler
    PACKAGEMANAGER='apt pacman'
    for pgm in ${PACKAGEMANAGER}; do
        if command_exists ${pgm}; then
            PACKAGER=${pgm}
            echo -e "Using ${pgm}"
        fi
    done

    if [ -z "${PACKAGER}" ]; then
        echo -e "${CER}Can't find a supported package manager"
        exit 1
    fi

#Are we using btrfs?
echo -e "$CNT - Checking if we are using btrfs..."
if 	lsblk -f | grep btrfs > /dev/null 2>&1 ; then
    ISBTRFS=true
    echo -e "$COK - We are on BTRFS"
else
    ISBTRFS=false
    echo -e "$COK - We are not on BTRFS"
fi

#Are we running a vm?
echo -e "$CNT - Checking for Physical or VM..."
ISVM=$(hostnamectl | grep Chassis)
echo -e "$COK - Using $ISVM"
if [[ $ISVM == *"vm"* ]]; then
    echo -e "$CWR - Please note that VMs are not fully supported and if you try to run this on
    a Virtual Machine there is a high chance this will fail."
    sleep 1
fi

#Find the Hostname
if grep -q "vader" /etc/hostname; then
    ISVADER=true
    echo -e "$CAT - Hello Lord Vader"
else
    ISVADER=false
fi

#What Iso did we install?
if grep -q "debian" /etc/os-release; then
    ISO="debian"
    echo -e "$CAT - We are on debian"
elif grep -q "archlinux" /etc/os-release; then
    ISO="archlinux"
    echo -e "$CAT - We are on archlinux. Installing yay..."
    sudo ${PACKAGER} --noconfirm -S base-devel
    $(cd /opt && sudo git clone https://aur.archlinux.org/yay-git.git && sudo chown -R ${USER}:${USER} ./yay-git && cd yay-git && makepkg --noconfirm -si)
else
    ISO="none"
    echo -e "$CER - No supported ISO found. Script will now exit..."
    sleep 5
    exit
fi

#Find the Nvidia GPU
if lspci -k | grep -A 2 -E "(VGA|3D)" | grep -iq nvidia; then
    echo -e "$CAT - Nvidia device found. Installing Drivers"
    if [[ $PACKAGER == "pacman" ]]; then
    	yay --noconfirm -S nvidia-dkms nvidia-utils nvidia-settings mesa-utils
    else 
    	sudo ${PACKAGER} install -yq nvidia-dkms nvidia-utils nvidia-settings mesa-utils
    fi
else
    echo "No nvidia found. Continueing..."
fi

#Start installation process for specific ISO
if [[$ISO == debian]]; then
    bash deb.sh
elif [[$ISO == debian]]; then
    bash arch.sh
else
echo "No compatible ISO found"
sleep 3
exit
fi