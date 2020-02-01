# Install arch via anarchy and add the internet module (networkmanager)
# To use wifi after installation:
# sudo systemctl enable NetworkManager
# sudo systemctl start NetworkManager
# nmtui

# General dependencies.
sudo pacman -S i3-gaps xorg-server xorg-xinit xorg-xrandr xorg-xbacklight zsh neovim dmenu 
sudo pacman -S git termite openssh base-devel nitrogen alsa-utils pulseaudio htop neofetch
sudo pacman -S xf86-video-intel imagemagick rofi

# Fonts
sudo pacman -S ttf-dejavu noto-fonts ttf-liberation ttf-hack ttf-font-awesome
sudo pacman -S ttf-linux-libertine noto-fonts-emoji font-mathematica ttf-croscore

# Polybar dependencies.
sudo pacman -S cairo libxcb python xcb-proto xcb-util-image
sudo pacman -S xcb-util-wm xcb-util-cursor xcb-util-xrm alsa-lib libpulse jsoncpp
sudo pacman -S libmpdclient curl libnl wireless_tools 

# YAY
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

# AUR dependencies
yay polybar
yay ttf-google-fonts-typewolf
yay ttf-material-design-icons
yay siji
yay pamac-aur
yay python-pip
yay pywal
yay flameshot
yay peek

# Zsh as shell (You will have to restart the computer to take effect)
chsh -l
chsh -s $(which zsh) $(whoami)

# Oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Neo vim
sudo pacman -S ack ripgrep
sudo pip install --upgrade neovim
sudo pip install --upgrade jedi
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Color scheme
wal --theme base16-gruvbox-soft

# generate ssh key
ssh-keygen

# Prevent modificiations from installation process to change the repo.
git checkout .
