# Updating the system

sudo pacman -Syu

# Installing neessary packages

sudo pacman -S xorg xorg-xinit i3-gaps alacritty rofi firefox lightdm lightdm-gtk-greeter feh

# Making necessery folders

mkdir $HOME/.config

mkdir $HOME/.wallpapers

# Copying config files and wallpaper

cp -R dotfiles/* $HOME/.config

cp wallpaper.jpg $HOME/.wallpapers

