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

#Personal configs
copyconfig_file=(
    #gtk-2.0
    "$installed_dir/settings/gtk-2.0/" "$HOME/.config/gtk-2.0"
    #gtk-3.0
    "$installed_dir/settings/gtk-3.0/" "$HOME/.config/gtk-3.0"
    "$installed_dir/settings/bookmarks/bookmarks" "$HOME/.config/gtk-3.0/bookmarks"
    #xorg
    "$installed_dir/settings/xorg/" "/etc/X11/xorg.conf.d/"
    #terminal files
    "$installed_dir/settings/kitty/" "$HOME/.config/"
    #alacritty setup
    # "$installed_dir/settings/alacritty/alacritty.yml"* "/etc/skel/.config/alacritty"
    #shell files    -   **handled in another file**
    #"$installed_dir/settings/shell-personal/.bashrc-personal" "$HOME/.bashrc-personal"
    # "$installed_dir/settings/shell-personal/.zshrc" "$HOME/.zshrc"
    # "$installed_dir/settings/shell-personal/.zshrc" "/etc/skel/.zshrc"
    # "$installed_dir/settings/shell-personal/.zshrc-personal" "$HOME/.zshrc-personal"
    "$installed_dir/settings/fish/alias.fish" "$HOME/.config/fish/alias.fish"
    "$installed_dir/settings/fish/config.fish" "$HOME/.config/fish/config.fish"
    #variety
    "$installed_dir/settings/variety/variety.conf" "$HOME/.config/variety"
    "$installed_dir/settings/variety/scripts/" "$HOME/.config/variety/scripts/"
    #screenkey
    "$installed_dir/settings/screenkey/screenkey.json" "$HOME/.config"
    #thunar
    "$installed_dir/settings/thunar/uca.xml" "$HOME/.config/Thunar"
    "$installed_dir/settings/thunar/uca.xml" "/etc/skel/.config/Thunar"
    #neofetch
    "$installed_dir/settings/neofetch/config.conf" "$HOME/.config/neofetch"
    "$installed_dir/settings/neofetch/config.conf" "/etc/skel/.config/neofetch"
    #mangohud
    "$installed_dir/settings/mangohud/" "$HOME/.config/"
    #fastfetch
    #"$installed_dir/settings/fastfetch/config.conf" "/etc/fastfetch/"
    #"$installed_dir/settings/fastfetch/config.conf" "/etc/skel/.config/fastfetch/"
    #pulse audio
    "$installed_dir/settings/pulseeq/presets/" "$HOME/.config/pulse/presets"
    "$installed_dir/settings/pulseeq/equalizerrc.availablepresets" "$HOME/.config/pulse"
    #autostart
    "$installed_dir/settings/autostart/" "$HOME/.config/autostart"
    #cursor
    "$installed_dir/settings/cursor/" "/usr/share/icons/default"
    #vitualbox
    "$installed_dir/settings/virtualbox-template/" "$HOME/vm"
    #lightdm
    "$installed_dir/settings/lightdm/ldm/" "/etc/lightdm"
    #emacs
    "$installed_dir/settings/emacs/" "$HOME/.config/emacs"
    #gimp
    "$installed_dir/settings/GIMP/" "$HOME/.config/"
    #rofi
    #"$installed_dir/settings/rofi/"* "$HOME/.config/"
    #mimeapps & picom
    "$installed_dir/settings/mimeapps_picom/" "$HOME/.config/"
)

vaderconfig_file=(
    "$installed_dir/settings/xorg/config/xorg.conf" "/etc/X11"
    "$installed_dir/settings/monitorscale/.profile" "$HOME"
)

main_dir=(
    #"$HOME/.config/kvantum"
    "$HOME/.config/gtk-3.0"
    "/etc/X11/xorg.conf.d/"
    "$HOME/.config/variety"
    "$HOME/.config/thunar"
    #"$HOME/.config/neofetch
    #"$HOME/.config/pulse/presets
    "$HOME/.config/autostart"
    "$HOME/.bin"
    "$HOME/pictures"
    "$HOME/pictures/backgrounds"
    "$HOME/github"
    "$HOME/github/linux/"
    "$HOME/github/linux/arto-repo"
    "$HOME/github/linux/pkgbuild"
    "$HOME/github/linux/packages"
    "$HOME/github/college"
    "$HOME/.fonts"
    "$HOME/.icons"
    "$HOME/.themes"
    "$HOME/.local/share/icons"
    "$HOME/.local/share/themes"
    "$HOME/personal"
    "$HOME/.config"
    "$HOME/.config/fish"
    "$HOME/data"
    "$HOME/courses"
    "$HOME/clients"
    "$HOME/internxt"
    "$HOME/torrents"
    "$HOME/vm"
) 

git_files=(
    https://github.com/Dev8904/arto_repo.git "$HOME/github/linux/arto-repo"
    https://github.com/Dev8904/pkgbuild.git "$HOME/github/linux/pkgbuild"
    https://github.com/Dev8904/arto-chadwm.git "$HOME/github/linux/packages/arto-chadwm"
    https://github.com/Dev8904/arto-skel.git "$HOME/github/linux/packages/arto-skel"
    https://github.com/Dev8904/artolinux-zsh.git "$HOME/github/linux/packages/artolinux-zsh"
    https://github.com/Dev8904/artolinux-volumeicon.git "$HOME/github/linux/packages/artolinux-volumeicon"
    https://github.com/Dev8904/artolinux-variety-autostart.git "$HOME/github/linux/packages/variety-autostart"
    https://github.com/Dev8904/artolinux-variety.git "$HOME/github/linux/packages/variety"
    https://github.com/Dev8904/artolinux-root.git "$HOME/github/linux/packages/artolinux-root"
    https://github.com/Dev8904/artolinux-qt5.git "$HOME/github/linux/packages/artolinux-qt5"
    https://github.com/Dev8904/artolinux-paru.git "$HOME/github/linux/packages/artolinux-paru"
    https://github.com/Dev8904/artolinux-nitrogen.git "$HOME/github/linux/packages/artolinux-nitrogen"
    https://github.com/Dev8904/artolinux-neofetch.git "$HOME/github/linux/packages/artolinux-neofetch"
    https://github.com/Dev8904/artolinux-local-applications.git "$HOME/github/linux/packages/artolinux-local-applications"
    https://github.com/Dev8904/artolinux-local-applications-all-hide.git "$HOME/github/linux/packages/artolinux-local-applications-all-hide"
    https://github.com/Dev8904/artolinux-kvantum.git "$HOME/github/linux/packages/artolinux-kvantum"
    https://github.com/Dev8904/artolinux-gtk3-arcolinux-candy-beauty.git "$HOME/github/linux/packages/artolinux-gtk3-arcolinux-candy-beauty"
    https://github.com/Dev8904/artolinux-fonts.git "$HOME/github/linux/packages/artolinux-fonts"
    https://github.com/Dev8904/artolinux-fish.git "$HOME/github/linux/packages/artolinux-fish"
    https://github.com/Dev8904/artolinux-config-all-desktops.git "$HOME/github/linux/packages/artolinux-config-all-desktops"
    https://github.com/Dev8904/artolinux-bin.git "$HOME/github/linux/packages/artolinux-bin"
    https://github.com/Dev8904/artolinux-alacritty.git "$HOME/github/linux/packages/artolinux-alacritty"
    https://github.com/Dev8904/arto-system.git "$HOME/github/linux/packages/arto-system"
    https://github.com/Dev8904/artolinux-rofi-themes.git "$HOME/github/linux/packages/artolinux-rofi-themes"
    https://github.com/Dev8904/artolinux-rofi.git "$HOME/github/linux/packages/artolinux-rofi"
    https://github.com/Dev8904/arto.git "$HOME/github/linux/arto"
)

git_clone() {
    local args=("$@")  # Grab all arguments into an array

    # Iterate over the pairs of arguments
    for ((i=0; i<${#args[@]}; i+=2)); do
        local gitpath="${args[i]}"
        local destination="${args[i+1]}"

        # Check if the repository has already been cloned
        if [ -d "$destination/.git" ]; then
            echo -e "$COK - $gitpath is already cloned to $destination. Skipping."
            continue  # Skip to the next iteration
        fi

        # Determine the owner of the parent directory
        local parentdir=$(dirname "$destination")
        local owner=$(stat -c '%U' "$parentdir")

        # If the owner is not the current user, change ownership
        if [ "$owner" != "$USER" ]; then
            sudo chown -R $USER:$USER "$parentdir"
        fi

        # Now the git clone command should always be able to run as the current user
        git clone "$gitpath" "$destination" >>  "$INSTLOG" 2>&1 &
    done
}
check_dir() {
    local path="$1"
    if [ -d "$path" ]; then
        echo -e "$COK - Directory $path already exists."
    else
        # Determine whether to use sudo based on the path
        if [[ "$path" == "$HOME"* ]]; then
            mkdir -p "$path" >> "$INSTLOG" > /dev/null &
        else
            sudo mkdir -p "$path" >> "$INSTLOG" > /dev/null &
        fi
    fi
}
copy_files() 
{
    local dest="$1"
    shift  # Remove the destination from the arguments
    # Remaining arguments are the source files
    for src in "$@"; do
        # Check if destination exists and is a file, while source is a directory
        if [ -f "$dest/$(basename "$src")" ] && [ -d "$src" ]; then
            echo "Warning: Deleting file '$dest/$(basename "$src")' to copy directory '$src'"
            rm "$dest/$(basename "$src")"
        fi
        
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

#Create Directories
for DIR in "${main_dir[@]}"; do
        check_dir "$DIR" 
    done
#Install main configs
    for ((i=0; i<${#copyconfig_file[@]}; i+=2)); do
    src="${copyconfig_file[$i]}"
    dest="${copyconfig_file[$i+1]}"
    copy_files "$dest" "$src"
done
#Install configs for lord vader
if [[ "$ISVADER" == true ]]; then
    echo
    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Personal settings for Vader"
    echo "################################################################"
    tput sgr0
    echo
    for ((i=0; i<${#vaderconfig_file[@]}; i+=2)); do
        src="${vaderconfig_file[$i]}"
        dest="${vaderconfig_file[$i+1]}"
        copy_files "$dest" "$src"
    done
    sleep 5
    #download all projects from github
    echo "Time to download github repos"
    git_clone "${git_files[@]}"
    echo
    sleep 3
    echo "Finished downloading projects."
    sleep 3
    echo -e "$CNT - Checking For Missing User field"
    echo
    if grep -q "jonathan:x:1000:1000:jonathan:/$HOME/jonathan:/bin/fish" /etc/passwd; then
    echo -e "$COK - No missing user field"
    else
    sudo usermod -c jonathan jonathan >> "$INSTLOG" > /dev/null &
    echo
    echo -e "$COK - Missing User Field Has Been Fixed"
    fi
fi
echo "Finished general config"
sleep 3
exit
