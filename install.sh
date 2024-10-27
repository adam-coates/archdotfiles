#!/usr/bin/env bash
green='\e[32m'
red='\e[31m'
purple='\033[0;35m'
clear='\e[0m'

ColorGreen(){
    echo -ne $green$1$clear
}

ColorRed(){
    echo -ne $red$1$clear
}

ColorPurple(){
    echo -ne $purple$1$clear
}

yaypackages=(
    "hyprland-git"
    "aylurs-gtk-shell"
    "matugen-bin"
    "morewaita-icon-theme-git"
    "grimblast-git"
    "gpu-screen-recorder"
    "bibata-cursor-theme"
)

pacmanpackages=(
    "hyprpaper"
    "chromium"
    "nwg-look"
    "ttf-font-awesome"
    "neovim"
    "kitty"
    "dart-sass"
    "fd"
    "brightnessctl"
    "hyprpicker"
    "zip"
    "unzip"
    "libdbusmenu-gtk3"
    "gnome-bluetooth-3.0"
    "networkmanager"
    "ttf-meslo-nerd"
    "libgtop" 
    "bluez" 
    "bluez-utils" 
    "btop"
    "wl-clipboard"
    "python" 
    "pacman-contrib" 
    "power-profiles-daemon"
    "tmux"
    "nodejs"
    "starship"
    "fzf"
    "eza"
    "bat"
    "fastfetch"
    "pyenv"
    "htop"
    "rofi"
    "npm"
    "thunar"
    "sddm"
    "qt5-graphicaleffects"
    "qt5-quickcontrols2"
    "qt5-svg"
)

sudo pacman -S --noconfirm git 

sudo pacman -S --noconfirm gum 

echo -ne "$(ColorPurple 'Would you like to install the pacman packages?')"

gum confirm && for i in ${pacmanpackages[@]}; do sudo pacman -S --noconfirm $i; done

echo -ne "$(ColorPurple 'Would you like to install the yay packages?')"
gum confirm && for k in ${yaypackages[@]}; do yay -S $k; done

touch ~/.inputrc

echo -ne "$(ColorPurple 'Copy .bashrc to ~?')"
gum confirm && cp ~/archdotfiles/.bashrc ~/

echo -ne "$(ColorPurple 'Install bun (required) for ags?')"

gum confirm && curl -fsSl https://bun.sh/install.sh | bash


echo -ne "$(ColorGreen 'Copying wallpaper?')"

cp ~/archdotfiles/stairs.jpg ~/wallpaper.jpg

echo -ne "$(ColorPurple 'Would you like to copy the configs?')"

gum confirm && cp -a ~/archdotfiles/.config/. ~/.config

echo -ne "$(ColorGreen 'Copying cache?')"

mkdir -p ~/.cache/

cp -a ~/archdotfiles/.cache ~


echo -ne "$(ColorGreen 'Copying tmux config?')"

cp ~/archdotfiles/.tmux.conf ~/


echo -ne "$(ColorPurple 'Would you like to install the SDDM theme?')"

if gum confirm; then
    sudo cp -a ~/archdotfiles/sddm-theme/ /usr/share/sddm/themes/
    sudo mkdir /etc/sddm.conf.d/
    sudo cp ~/archdotfiles/sddm.conf /etc/sddm.conf.d/sddm.conf
    sudo systemctl enable sddm.service
fi

sudo ln -s ~/.bun/bin/bun /usr/bin/bun

reboot



