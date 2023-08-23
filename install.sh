# Updating the system

sudo pacman -Syu

# Installing neessary packages

sudo pacman -S xorg xorg-xinit pulseaudio pulseaudio-alsa pulseaudio-jack sof-firmware alsa pavucontrol pamixer ncspot brightnessctl i3-gaps kitty rofi firefox lightdm lightdm-gtk-greeter feh rustup gnome-themes-extra nm-connection-editor modemmanager usb_modeswitch ca-certificates ttf-font-awesome ttf-firacode-nerd jq

# Enabling and configuring lightdm

systemctl enable lightdm

# Enabling Modem Manager for phone modem wifi

systemctl enable ModemManager
systemctl start ModemManager
systemctl restart NetworkManager

# Creating ca-certificates

sudo update-ca-trust force-enable

sudo cp /etc/ca-certificates/extracted/*.pem /etc/ca-certificates/trust-source/anchors

sudo update-ca-trust

# Adding WPA suplicant to NetworkManager

sudo cp /etc/ssl/openssl.cnf /etc/wpa_supplicant/.

# Editing WPA files, so that wpa2 enterprise will work

sudo sed -i '/providers = provider_sect/a ssl_conf = ssl_sect\n\n[ssl_sect]\nsystem_default = system_default_sect\n\n[system_default_sect]\nOptions = UnsafeLegacyRenegotiation\nCipherString = DEFAULT@SECLEVEL1' /etc/wpa_supplicant/openssl.cnf

# Editing WPA suplicant service

sudo sed -i '/BusName=fi.w1.wpa_supplicant1/a Environment="OPENSSL_CONF=/etc/wpa_supplicant/openssl.conf"' /usr/lib/systemd/system/wpa_supplicant.service

# NetworkManager

sudo sed -i '/for details./a [device]\nwifi.scan-rand-mac-address=no' /etc/NetworkManager/NetworkManager.conf


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

sudo cp *.service /etc/systemd/system/.

sudo cp wallpaper.jpg /usr/share/pixmaps/.

sudo cp lightdm-gtk-greeter.conf /etc/lightdm/.

sudo systemctl enable suspend@$USER
sudo systemctl enable resume@$USER
