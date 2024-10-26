#!/usr/bin/env bash

yaypackages=(
    "hyprland-git"
    "aylurs-gtk-shell"
    "matugen-bin"
    "morewaita-icon-theme-git"
    "grimblast-git"
    "gpu-screen-recorder"
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
)

sudo pacman -S --noconfirm git 

sudo pacman -S --noconfirm gum 



gum confirm && for i in ${pacmanpackages[@]}; do sudo pacman -S --noconfirm $i; done

gum confirm && for k in ${yaypackages[@]}; do yay -S $k; done

gum confirm && cp ~/archdotfiles/.bashrc ~/

gum confirm && curl -fsSl https://bun.sh/install.sh | bash && source ~/.bashrc

cp ~/archdotfiles/stairs.jpg ~/wallpaper.jpg

cp -a ~/archdotfiles/.config/. ~/.config

cp ~/archdotfiles/.tmux.conf ~/

touch ~/.inputrc





