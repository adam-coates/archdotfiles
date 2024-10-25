#!/usr/bin/env bash

yaypackages=(
    "hyprland-git"
    "aylurs-gtk-shell"
    "matagen-bin"
)

pacmanpackages=(
    "hyprland-git"
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
)

sudo pacman -S --noconfirm git 

sudo pacman -S --noconfirm gum 

git clone https://github.com/adam-coates/archdotfiles.git

git clone https://github.com/adam-coates/dotfiles.git





