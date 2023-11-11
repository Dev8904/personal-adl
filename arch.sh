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
core_stage=( 
    alsa-utils
    amd-ucode
    archiso
    arch-install-scripts    
    arandr
    base
    bind
    broadcom-wl-dkms
    bash-completion
    clonezilla
    dash
    ddrescue
    dhclient
    diffutils
    dmraid
    dosfstools
    e2fsprogs
    edk2-shell
    efibootmgr
    ethtool
    exfatprogs
    f2fs-tools
    fatresize
    fsarchiver
    gnu-netcat
    gpart
    gptfdisk
    hdparm
    hyperv
    irssi
    jfsutils
    libfido2
    libusb-compat
    linux
    linux-atm
    linux-firmware
    linux-firmware-qlogic
    linux-firmware-marvell
    lsscsi
    lvm2
    mc
    mdadm
    memtest86+-efi
    mkinitcpio
    mkinitcpio-archiso
    mkinitcpio-nfs-utils
    mtools
    nano
    nbd
    ndisc6
    nfs-utils
    nilfs-utils
    ntfs-3g
    nvme-cli
    open-iscsi
    partclone
    parted
    partimage
    pcsclite
    ppp
    pptpclient
    pv
    refind
    reiserfsprogs
    rp-pppoe
    screen
    sdparm
    smartmontools
    sof-firmware
    syslinux
    testdisk
    tmux
    tpm2-tss
    udftools
    usb_modeswitch
    usbmuxd
    usbutils
    wireless-regdb
    wireless_tools
    wpa_supplicant
    wvdial
    xfsprogs
    xl2tpd
    dialog
    dnsutils
    xorg-server
    xorg-apps
    xorg-xinit
    linux-headers
    base-devel
    git
    jsoncpp
    libmtp
    lsb-release
    tlp
    webkit2gtk
    #packages for dual boot
    os-prober
    #packages for virt
    iptables-nft
    dmidecode
    ebtables 
    qemu-full
    virt-manager
    virt-viewer
    dnsmasq
    vde2
    bridge-utils
    edk2-ovmf
    virtualbox
    virtualbox-host-dkms
    virtualbox-guest-iso 
    virtualbox-guest-utils
    virtualbox-guest-utils
    open-vm-tools
    #video drivers
    xf86-video-vmware
    mesa
    xf86-video-amdgpu
    #Audio drivers
    pavucontrol
    pipewire
    pipewire-jack
    pipewire-alsa
    pipewire-audio
    #pipewire-pulse
    lib32-pipewire
    lib32-pipewire-jack
    wireplumber
    qpwgraph
    pipewire-zeroconf
    pipewire-v4l2
    alsa-card-profiles
    #file management
    gvfs
    gvfs-afc
    gvfs-gphoto2
    gvfs-mtp
    gvfs-nfs
    gvfs-smb
    mtpfs
    udiskie
    udisks2
    xdg-user-dirs
    ###tumbler
    tumbler
    ffmpegthumbnailer
    freetype2
    libgsf
    libopenraw
    poppler-glib
    poppler-qt5
    #network drivers
    avahi
    nss-mdns
    mobile-broadband-provider-info
    modemmanager
    networkmanager
    network-manager-applet
    networkmanager-openconnect
    networkmanager-openvpn
    networkmanager-pptp
    networkmanager-vpnc
    tcpdump
    openresolv
    openssh
    openvpn
    rtl8821cu-morrownr-dkms-git
    #packages for bluetooth
    blueberry
    bluez
    bluez-libs
    bluez-utils
    bluez-qt
    #packages for printing
    cups
    cups-pdf
    ghostscript
    gsfonts
    gutenprint
    gtk3-print-backends
    libcups
    system-config-printer
    sane
    simple-scan
    #packages for pacman
    pkgcacheclean
    #flatpak install needed for programs
    flatpak
)
remove_stage=(
    adobe-source-han-sans-cn-fonts
    adobe-source-han-sans-jp-fonts
    adobe-source-han-sans-kr-fonts
    xfce4-artwork
    xf86-video-fbdev 
    xf86-video-openchrome 
    xf86-video-ati 
    xf86-video-nouveau 
    xf86-video-vesa 
    awesome-terminal-fonts
    vivaldi
    urxvt-perls
    urxvt-resize-font-git
    gitahead
    gitahead-git
    plank
    peek
    inkscape
    risetretto
    arduino
    bluefish
    arduino
    brackets-bin
    codeblocks
    firefox-extension-bitwarden
    firefox
    chrome
    brave
    cuttlefish
    geany
    kate
    pycharm-community-edition
    qtcreator
    okular
    openscad
    element-desktop
    element-web
    google-chat-linux-bin 
    hexchat
    teams
    skypeforlinux-stable-bin
    arcolinux-teamviewer
    spotify
    atril
    epdfview
    pdfarranger
    xpdf 
    file-roller
    xreader
    ibus-ui-emojier-plasma
    kwrite
    leafpad
    spectacle
    vim
    codium
)
install_stage=( 
    #ttf-wps-fonts
    #wps-office
    #wps-office-mime
    #adobe-source-sans-fonts
    #aic94xx-firmware
    #autorandr
    #alacritty
    #alacritty-themes
    #ark
    kitty
    #arc-darkest-theme-git
    #arc-gtk-theme
    surfn-icons-git
    orchis-theme-git
    #asciinema
    #awesome-terminal-fonts
    #ayu-theme
    #baobab
    #base16-alacritty-git
    #bash-completion
    #bat
    bibata-cursor-theme-bin
    catfish
    #chromium
    cpuid
    curl
    #dconf-editor
    #dmenu
    downgrade
    duf
    #evince
    expac
    emacs
    fastfetch-git
    feh
    file-roller
    fish
    flameshot-git
    #fluent-icon-theme-git
    #font-manager
    #galculator
    #gimp
    internxt-drive-bin
    git
    #gitahead-bin
    #gnome-disk-utility
    gparted
    grub-customizer
    #gtop
    hardcode-fixer-git
    #hardinfo-gtk3
    #hddtemp
    htop
    hwinfo
    starship
    #inkscape
    #insync
    kvantum
    #linux-firmware-qlogic
    #lastpass
    logrotate
    lolcat
    #lshw
    man-db
    man-pages
    tldr
    mlocate
    mintstick-git
    most
    #neofetch
    nitrogen
    #nomacs
    #noto-fonts
    ntp
    numlockx
    #oh-my-zsh-git
    #paru-bin
    playerctl
    #polkit-gnome
    #polkit
    python-pylint
    pkgfile
    python-pywal
    pvt
    rate-mirrors-bin
    #ripgrep
    rsync
    scrot
    #sardi-icons
    #simplescreenrecorder
    sparklines-git
    ##### plugin your device with a usb cable
    # keep it awake at all times so you see the message you need to noconfirm
    # on your android device make sure you find the settings
    # enable usb debugging on your android
    # https://www.howtogeek.com/129728/how-to-access-the-developer-options-menu-and-enable-usb-debugging-on-android-4.2/
    # then start scrcpy in a terminal and confirm any and all messages on your android device
    # https://wiki.archlinux.org/index.php/Android_Debug_Bridge
    # https://github.com/Genymobile/scrcpy
    scrcpy
    #speedtest-cli-git
    screenkey
    #spotify
    squashfs-tools
    #sublime-text-4
    #surfn-icons-git
    #system-config-printer
    #telegram-desktop
    #the_platinum_searcher-bin
    #the_silver_searcher
    #time
    tree
    #ttf-bitstream-vera
    #ttf-dejavu
    #ttf-droid
    #ttf-hack
    #ttf-inconsolata
    #ttf-liberation
    #ttf-roboto
    #ttf-roboto-mono
    #ttf-ubuntu-font-family
    ttf-jetbrains-mono-nerd
    ttf-meslo-nerd-font-powerlevel10k
    #upd72020x-fw
    variety
    #vivaldi
    #vivaldi-ffmpeg-codecs
    #vivaldi-widevine
    #wd719x-firmware
    wget
    #wttr
    xcolor
    xorg-xkill
    xdg-desktop-portal-gtk
    #zsh
    #zsh-completions
    #zsh-syntax-highlighting
    #rxvt-unicode
    #urxvt-fullscreen
    #urxvt-perls
    #urxvt-resize-font-git
    #gzip
    #p7zip
    unace
    unrar
    unzip
    zenity
)
virtual_machine=(
    qemu-guest-agent
)
btrfs_stage=(
    btrfs-assistant
    btrfs-progs
    grub-btrfs
    snap-pac
    snapper
    snapper-gui-git
    snapper-support
)
services_enable=(
    avahi-daemon.service avahi-daemon
    ntpd.service ntpd
    bluetooth.service bluetooth
    cups.service cups
    #fstrim.timer fstrim
    libvirtd.service libvirtd
    firewalld.service firewall
    tlp.service tlp
    upower.service upower
    #reflector.timer reflector_timer
    #grub-btrfsd.service grub-btrfs
)
services_mask=(
    systemd-rfkill.socket
    systemd-rfkill.socket
)
install_software() {
    # First lets see if the package is there
    if yay -Q "$1" >/dev/null 2>&1 ; then
        echo -e "$COK - $1 is already installed." >&2
    else
        # No package found, so installing
        echo -en "$CNT - Now installing $1 ." >&2
        (yay -S --noconfirm "$1" &>>  "$INSTLOG") &
    fi
}
remove_software() {
    # First let's see if the package is there
    if yay -Q "$1" >/dev/null 2>&1 ; then
        # Package is installed, so we attempt to remove it
        echo -en "$CNT - Now removing $1 ." >&2
        (yay -Rns --noconfirm "$1" &>>  "$INSTLOG") & 
    else
        # No package found so do nothing
        echo -e "$COK - $1 is not installed." >&2
    fi
}
remove_file() {
    # Let's remove a file
    local file="$1"
    sudo rm -r "$file" >> "$INSTLOG" > /dev/null &
}
copy_files() {
    local dest="$1"
    shift  # Remove the destination from the arguments
    # Remaining arguments are the source files
    for src in "$@"; do
        # Determine whether to use sudo based on the destination path
        if [[ "$dest" == "$HOME"* ]]; then
            if [ -d "$src" ]; then
                # Source is a directory, copy it recursively
                cp -v -arf "$src" "$dest" >> "$INSTLOG" > /dev/null & 
            else
                # Source is a file, copy it normally
                cp -v -af "$src" "$dest" >> "$INSTLOG" > /dev/null &
            fi
        else
            if [ -d "$src" ]; then
                # Source is a directory, copy it recursively
                sudo cp -v -arf "$src" "$dest" >> "$INSTLOG" > /dev/null &
            else
                # Source is a file, copy it normally
                sudo cp -v -af "$src" "$dest" >> "$INSTLOG" > /dev/null &
            fi
        fi
    done
}
enable_service() {
    local service_name="$1"
    local service_description="$2"

    if [[ $(sudo systemctl is-enabled "${service_name}") == "enabled" ]]; then
        echo -e "$COK - ${service_description} is already enabled."
    else
        sudo systemctl enable "${service_name}" >> "$INSTLOG" 2>/dev/null &
    fi
}
mask_services() {
    for ((i = 0; i < ${#services_mask[@]}; i += 2)); do
        sudo systemctl mask "${services_mask[i]}" >> "$INSTLOG" > /dev/null &
    done
}

update_system() {
    # Run the update and output logs
    yay -Syu --noconfirm &>> "$INSTLOG" &
}
replace_or_append() {
    local find="$1"
    local replace="$2"
    local file="$3"
    local after_text="$4"
    after_text_escaped=$(echo $after_text | sed 's/\//\\\//g' | sed 's/\&/\\\&/g')
    replace_escaped=$(echo $replace | sed 's/\//\\\//g' | sed 's/\&/\\\&/g')

    # Check if the exact line to append already exists in the file
    if grep -qF "$replace" "$file"; then
        echo -e "$CER - $replace already exists in $file"
    elif [ -n "$find" ] && grep -q "$find" "$file"; then
        # The string exists, so we replace it
        echo "Replacing $find with $replace in $file"
        sudo sed -i.bak "s/$(printf '%s' "$find" | sed 's:[\/&]:\\&:g')/$(printf '%s' "$replace_escaped" | sed 's:[\/&]:\\&:g')/g" "$file"
    elif [ -n "$after_text" ] && grep -q "$after_text" "$file"; then
        # Append after the given line
        echo "Appending $replace to $file after $after_text"
        if grep -qF "$after_text" "$file"; then
            sudo sed -i "s/${after_text_escaped}/${after_text_escaped}${replace_escaped}/g" "$file"
        else
            echo -e "$after_text$replace" >> "$file"
        fi
    else
        # Neither find string nor after_text exist in the file
        echo -e "$CER - $find and $after_text do not exist in $file, nothing to replace or append after"
    fi
}
defragment_filesystem() {
    read -r -t 60 -p "Do you want to proceed with disk fragmentation using zstd compression? [Y/n]: " response || true

    # If no response is received within 60 seconds, default to Yes
    if [[ -z "$response" ]]; then
        echo "No input received within 60 seconds, defaulting to Yes"
        response="Y"
    fi

    # Proceed only if the response starts with y or Y
    if [[ $response =~ ^[Yy] ]]; then
        echo -e "$CAT - Starting disk fragmentation using zstd compression"
        sudo btrfs filesystem defragment -r -v -czstd / &>> "$INSTLOG" &
        pid=$!
        show_progress $pid  # Show progress of the defragment command
        wait $pid  # Wait for the defragment command to complete

        if grep -q '^ERROR:' "$INSTLOG"; then
            echo -e "$CER - Filesystem Defragmentation Failed. Check the install.log for more information."
        else
            echo -e "$COK - Filesystem Defragmentation Completed Successfully."
        fi
    else
        echo -e "$COK - Filesystem Defragmentation skipped by user choice."
    fi
}
#clear the screen 
clear
tput setaf 3
echo "################################################################"
echo "################### Running Arto"
echo "################################################################"
tput sgr0
echo
echo
echo -e "$CNT - This script will run some commands that require sudo. You will be prompted to enter your password.
If you are worried about entering your password then you may want to review the content of the script."
sleep 5
clear
echo
tput setaf 2
# Is the arto repo in pacman?
if grep -q arto_repo /etc/pacman.conf; then
    REPO=true
else
    REPO=false
fi
echo
sleep 5
clear
echo
tput setaf 2
echo "################################################################"
echo "###################Checking repo..."
echo "################################################################"
tput sgr0
echo
if [[ "$REPO" == true ]]; then
    echo -e "$CNT - arto_repo already installed"
else    
    replace_or_append "" "\n[arto_repo]\nSigLevel = Optional TrustedOnly\nServer = https://dev8904.github.io/\$repo/\$arch" "/etc/pacman.conf" "#Server = file:///home/custompkgs"
    sleep 5
    sudo pacman -Sy --noconfirm >> "$INSTLOG" > /dev/null &
    sleep 5
    echo -e "$CNT - arto_repo installed"
fi
echo
echo
sleep 5
clear
echo
if [[ "$ISBTRFS" == true ]]; then
    defragment_filesystem
    echo
    else
    echo
    tput setaf 2
    echo "################################################################"
    echo "$CAT - Your harddisk/ssd/nvme is not formatted as BTRFS."
    echo "$COK - BTRFS setup will not be performed."
    echo "################################################################"
    tput sgr0
    echo
fi
sleep 5
clear
echo
tput setaf 2
echo "################################################################"
echo "################### Welcome To The Purge..."
echo "################################################################"
tput sgr0
echo
# Remove Stage - Bunch of needed items
echo -e "$CNT - Remove Stage - Removing components, this may take a while..."
for SOFTWR in "${remove_stage[@]}"; do
    remove_software "$SOFTWR" 
done
echo
sleep 5
clear
echo
echo
tput setaf 2
echo "################################################################"
echo "###################Installing Software..."
echo "################################################################"
tput sgr0
# Core Stage - Bunch of needed items
    echo -e "$CNT - Core Stage - Installing needed components, this may take a while..."
    for SOFTWR in "${core_stage[@]}"; do
        install_software "$SOFTWR" 
    done
# Setup Nvidia if it was found
    if [[ "$ISNVIDIA" == true ]]; then
        echo -e "$CNT - Nvidia GPU support setup stage, this may take a while..."
        for SOFTWR in "${nvidia_stage[@]}"; do
            install_software "$SOFTWR"
        done
    fi    
#Install main programs
    echo -e "$CNT - Installing main programs, this may take a while..."
    for SOFTWR in "${install_stage[@]}"; do
        install_software "$SOFTWR" 
    done
echo -e "$COK - Installing packages finished"
sleep 5
clear
echo
echo -e "$CNT - Enabling/Masking Services"
sleep 5
for ((i = 0; i < ${#services_enable[@]}; i += 2)); do
    enable_service "${services_enable[i]}" "${services_enable[i+1]}"
done
sleep 5
mask_services
echo
echo -e "$COK - Finished Setting Up Services"
sleep 5
clear
echo
if [[ "$ISBTRFS" == true ]]; then
    echo -e "$CNT - Your fomatted as BTRFS - Installing needed components, this may take a while..."
    for SOFTWR in "${btrfs_stage[@]}"; do
        install_software "$SOFTWR" 
    done
    else
        echo
        tput setaf 2
        echo "################################################################"
        echo "$CAT - Your harddisk/ssd/nvme is not formatted as BTRFS."
        echo "$COK - BTRFS Packages will not be installed."
        echo "################################################################"
        tput sgr0
        echo
fi
echo
tput setaf 2
echo "################################################################"
echo "###################Installing Configs..."
echo "################################################################"
tput sgr0
echo
bash general.sh
sleep 3
echo -e "$COK - Finished setting peronal configs"
sleep 5
clear
echo
echo
if [[ $ISVM == *"vm"* ]]; then
    #Virtual guest machine packages
    tput setaf 2
    echo "################################################################"
    echo "####### Installing virtual machine packages"
    echo "################################################################"
    tput sgr0
    for SOFTWR in "${virtual_machine[@]}"; do
        install_software "$SOFTWR" 
    done
else
    echo
    tput setaf 2
    echo "################################################################"
    echo "####### Copy paste virtual box template"
    echo "################################################################"
    tput sgr0
    echo

    if [ ! -d "$HOME/vm" ]; then
        echo -e "$CER - Directory $HOME/vm does not exist. Please ensure it exists and is accessible."
        exit 1
    fi

    cp "$installed_dir/settings/virtualbox-template/template.tar.gz" "$HOME/vm"
    cd "$HOME/vm" 

    # Add check for extracted files. Replace "your_folder" with the name of the directory the tarball extracts to
    if [ ! -d "template" ]; then
        # Check if tar file exists
        if [ -f "template.tar.gz" ]; then
            tar -xzf "template.tar.gz"
            rm -f "template.tar.gz"
            echo -e "$COK - Virtual box template extracted successfully"
        else
            echo -e "$CER - Could not find template.tar.gz. Please ensure it exists and is in the correct location."
            exit 1
        fi # This fi closes the if [ -f "template.tar.gz" ] condition.

        echo
        #virmanager setup
        user=$(whoami)
        sudo gpasswd -a "$user" libvirt
        sudo gpasswd -a "$user" kvm
        echo '
        nvram = [
        "/usr/share/ovmf/x64/OVMF_CODE.fd:/usr/share/ovmf/x64/OVMF_VARS.fd"
        ]' | sudo tee --append /etc/libvirt/qemu.conf
        sudo virsh net-define /etc/libvirt/qemu/networks/default.xml
        sudo virsh net-autostart default
        sudo systemctl restart libvirtd.service
        echo -e "$COK - Finished adding virutal machines things"
    else
        echo -e "$CAT - Vm settings already set up."
    fi # This fi closes the if [ ! -d "template" ]; then condition.
fi # This fi closes the if [[ $ISVM == *"vm"* ]]; then condition.
echo
#replace_or_append "#AutoEnable=false" "AutoEnable=true" "/etc/bluetooth/main.conf"
if ! grep -q "load-module module-switch-on-connect" /etc/pulse/system.pa; then
    echo 'load-module module-switch-on-connect' | tee --append /etc/pulse/system.pa
fi

if ! grep -q "load-module module-bluetooth-policy" /etc/pulse/system.pa; then
    echo 'load-module module-bluetooth-policy' | tee --append /etc/pulse/system.pa
fi

if ! grep -q "load-module module-bluetooth-discover" /etc/pulse/system.pa; then
    echo 'load-module module-bluetooth-discover' | tee --append /etc/pulse/system.pa
fi
echo
sleep 5
clear
echo
echo
sudo hardcode-fixer >> "$INSTLOG" > /dev/null &
echo
echo
sleep 5 
clear
echo -e "$CER - DO NOT FORGET TO SET UP YOUR LUKS DEVICE IF YOU HAVE IT"
sleep 5
echo
echo "#########################################################"
echo "## Setting Reflector Country ##"
echo "#########################################################"
sleep 5
echo
enable_service "reflector.timer" "reflector"
echo -e "$COK - Finished adding reflector config"
sleep 5
echo
tput setaf 3
echo "################################################################"
echo "FINAL SKEL"
echo "Copying all files and folders from /etc/skel to ~"
echo "Wait for it ...."
echo "################################################################"
echo;tput sgr0
echo
copy_files "/etc/skel/"* "$HOME"
echo
echo -e "$CAT - files copied from skel"
sleep 5
echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
clear
sleep 5
tput setaf 3
echo "################################################################"
echo "$COK - Finished"
echo "################################################################"
sleep 5
echo "$CWR - Rebooting"
tput sgr0
sleep 5
reboot