# Install arch via anarchy and add the internet module (networkmanager)

# To use wifi after installation:
# sudo systemctl enable NetworkManager
# sudo systemctl start NetworkManager
# nmtui


# Note:
#  ttf-dejavu -> so that i3 works.
#  cp /etc/X11/xinit/xinitrc ~/.xinitrc and remove the xterm lines and add "exec i3"

# General dependencies.
sudo pacman -S i3-gaps xorg-server xorg-xinit xorg-xrandr xorg-xbacklight zsh neovim dmenu 
sudo pacman -S git termite openssh base-devel

# Fonts
sudo pacman -S ttf-dejavu noto-fonts ttf-liberation ttf-hack 
sudo pacman -S ttf-linux-libertine noto-fonts-emoji font-mathematica ttf-croscore

# Polybar dependencies.
sudo pacman -S cairo libxcb python xcb-proto xcb-util-image 
sudo pacman -S xcb-util-wm xcb-util-cursor xcb-util-xrm alsa-lib libpulse jsoncpp
sudo pacman -S libmpdclient curl libnl wireless_tools 
               
# Video driver
pacman -S xf86-video-intel

# misc
sudo pacman -S neofetch

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

# AUR dependencies
yay polybar
yay ttf-google-fonts-typewolf
yay pamac-aur

# Zsh as shell (opts, will have to restart the computer to take effect)
chsh -l
chsh -s $(which zsh) $(whoami)

# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Prevent modificiations from installation process to change the repo.
git checkout .