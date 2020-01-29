# Install arch via anarchy and add the internet module (networkmanager)

# To use wifi after installation:
# sudo systemctl enable NetworkManager
# sudo systemctl start NetworkManager
# nmtui


# Note:
#  ttf-dejavu -> so that i3 works.
#  cp /etc/X11/xinit/xinitrc ~/.xinitrc and remove the xterm lines and add "exec i3"

# General dependencies.
sudo pacman -S i3-gaps xorg-server xorg-xinit xorg-xrandr zsh neovim dmenu 
               git termite openssh base-devel

# Fonts
sudo pacman -S ttf-dejavu noto-fonts ttf-liberation ttf-hack 
               ttf-linux-libertine noto-fonts-emoji font-mathematica
               ttf-croscore

# Polybar dependencies.
sudo pacman -S cairo libxcb python xcb-proto xcb-util-image 
               xcb-util-wm xcb-util-cursor xcb-util-xrm alsa-lib libpulse jsoncpp
               libmpdclient curl libnl wireless_tools 
               
# Video driver
pacman -S xf86-video-intel

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# AUR dependencies
yay polybar
yay ttf-google-fonts-typewolf
yay pamac-aur


# wget https://raw.githubusercontent.com/marcelodufe/environment/master/i3.config
