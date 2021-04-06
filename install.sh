# Install arch and add the internet module (networkmanager)
# To use wifi after installation:
# sudo systemctl enable NetworkManager
# sudo systemctl start NetworkManager
# nmtui

echo "Downloading general dependencies..."
sudo pacman -S --needed --noconfirm  \
  i3-gaps xorg-server xorg-xinit xorg-xrandr \
  xorg-xbacklight zsh neovim dmenu \
  git termite openssh base-devel \
  nitrogen alsa-utils pulseaudio \
  htop neofetch xf86-video-intel \
  imagemagick rofi xorg-xev bluez \
  bluez-utils i3lock which tree \
  xorg-xset xclip udisks2 \
  tmux unzip zip nodejs npm \
  v4l-utils firefox python-pip \
  python-pywal flameshot peek redshift \
  zathura zathura-pdf-poppler neomutt \
  dictd ntpd

echo "Downloading fonts..."
sudo pacman -S --noconfirm \
  ttf-dejavu noto-fonts noto-fonts-emoji
  # ttf-hack ttf-liberation

echo "Downloading AUR dependencies"
aur() {
  echo Installing $1
  git clone https://aur.archlinux.org/$1.git
  cd $1
  yes | makepkg -si
  cd ..
  rm -rf $1
}

aur yay
aur polybar-git
aur universal-ctags-git
# icons for polybar
aur ttf-font-icons
# unstable
# aur vim-youcompleteme-git

echo "Downloading Polybar dependencies..."
sudo pacman -S --noconfirm \
  cairo libxcb python xcb-proto \
  xcb-util-image xcb-util-wm xcb-util-cursor \
  xcb-util-xrm alsa-lib libpulse jsoncpp \
  libmpdclient curl libnl wireless_tools

echo "Downloading neovim dependencies"
sudo pacman -S --noconfirm ack ripgrep
sudo pip install --upgrade jedi pynvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo npm install -g eslint  # Linter for javascript

echo "Downloading dev dependencies"
sudo pacman -S --noconfirm docker docker-compose openconnect
sudo systemctl start docker && systemctl enable docker
sudo pip install --upgrade virtualenv
# python2 is a dependency for sass-loader used in nuxtJs damn!
sudo pacman -S python2

echo "Applying gruvbox color schema"
wal --theme base16-gruvbox-soft

echo "Applying wallpaper"
nitrogen --save --set-auto ~/Wallpapers/mountain-png.png

echo "Generating .ssh/ folder"
ssh-keygen

echo "Using zsh as a shell. Note: Restart your computer to take effect"
chsh -l
chsh -s $(which zsh) $(whoami)

echo "Downloading oh my zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Downloading dependencies for notification system"
sudo pacman -S --needed --noconfirm  dunst libnotify at
sudo systemctl start atd && systemctl enable atd
