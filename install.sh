#!/usr/bin/env bash

yaypackages=(
    "hyprland-git"
    "aylurs-gtk-shell"
    "matugen-bin"
    "morewaita-icon-theme-git"
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
    "swww"
    "hyprpicker"
    "zip"
    "unzip"
    "libdbusmenu-gtk3"
    "gnome-bluetooth-3.0"
    "networkmanager"
)

sudo pacman -S --noconfirm git 

sudo pacman -S --noconfirm gum 


git clone https://github.com/adam-coates/dotfiles.git


gum confirm && for i in ${pacmanpackages[@]}; do sudo pacman -S --noconfirm $i; done

gum confirm && for k in ${yaypackages[@]}; do yay -S $k; done

curl -fsSl https://bun.sh/install.sh | bash

sudo pacman -S pipewire libgtop bluez bluez-utils btop networkmanager dart-sass wl-clipboard brightnessctl swww python gnome-bluetooth-3.0 pacman-contrib power-profiles-daemon
