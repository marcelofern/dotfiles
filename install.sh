# Install arch and add the internet module (networkmanager)
# To use wifi after installation:
# sudo systemctl enable NetworkManager
# sudo systemctl start NetworkManager
# nmtui

echo "Downloading general dependencies..."
sudo pacman -S --noconfirm  \
  i3-gaps xorg-server xorg-xinit xorg-xrandr \
  xorg-xbacklight zsh neovim dmenu \
  git termite openssh base-devel \
  nitrogen alsa-utils pulseaudio \
  htop neofetch xf86-video-intel \
  imagemagick \ # required for pywal
  rofi xorg-xev bluez \
  bluez-utils i3lock which tree \
  xorg-xset xclip udisks2 \
  tmux unzip zip nodejs npm \
  v4l-utils firefox

echo "Downloading fonts..."
sudo pacman -S --noconfirm \
  ttf-dejavu noto-fonts noto-fonts-emoji ttf-liberation \
  ttf-hack ttf-font-awesome font-mathematica

echo "Downloading Polybar dependencies..."
sudo pacman -S --noconfirm \
  cairo libxcb python xcb-proto \
  xcb-util-image xcb-util-wm xcb-util-cursor \
  xcb-util-xrm alsa-lib libpulse jsoncpp \
  libmpdclient curl libnl wireless_tools

echo "Downloading YAY"
git clone https://aur.archlinux.org/yay.git
cd yay
yes | makepkg -si
cd ..

echo "Downloading AUR dependencies"
aur() {
  echo Installing $1
  echo 1 | yay --answerclean None --answerdiff None $1
}
aur polybar
aur pamac-aur
aur python-pip
aur pywal  # a.k.a python-pywal
aur flameshot
aur peek
aur vim-youcompleteme-git
aur universal-ctags-git  # dependency for tagbar vim
aur redshift  # screen warmth

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
