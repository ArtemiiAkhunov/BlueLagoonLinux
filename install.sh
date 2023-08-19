# Updating the system

sudo pacman -Syu

# Installing neessary packages

sudo pacman -S xorg xorg-xinit pulseaudio sof-firmware alsa i3-gaps alacritty rofi firefox lightdm lightdm-gtk-greeter feh rustup gnome-themes-extra

# Enabling lightdm

systemctl enable lightdm

# Making necessery folders

mkdir $HOME/.config

mkdir $HOME/.wallpapers

# Building necessary executables

mkdir builds

cd builds


# ElKowars wacky widgets

rustup install nightly

rustup default nightly

git clone https://github.com/elkowar/eww

cd eww

cargo build --release --no-default-features --features x11

rustup default stable

cd ..

sudo cp eww/target/release/eww /bin/eww

# Yay

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

cd ..

cd ..

# Copying config files and wallpaper

cp -R dotfiles/* $HOME/.config

cp wallpaper.jpg $HOME/.wallpapers

sudo cp wallpaper.jpg /usr/share/pixmaps/.

sudo cp lightdm-gtk-greeter.conf /etc/lightdm/.
