#!/usr/bin/env bash

yaypackages=(
    "hyprland-git"
    "aylurs-gtk-shell"
    "matagen-bin"
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
)

sudo pacman -S --noconfirm git 

sudo pacman -S --noconfirm gum 


git clone https://github.com/adam-coates/dotfiles.git


gum confirm && for i in ${pacmanpackages[@]}; do sudo pacman -S --noconfirm $i; done

gum confirm && for k in ${yaypackages[@]}; do yay -S $i; done

curl -fsSl https://bun.sh/install.sh | bash

