# Install arch and add the internet module (networkmanager)
# To use wifi after installation:
# sudo systemctl enable NetworkManager
# sudo systemctl start NetworkManager
# nmtui

echo "Downloading general dependencies..."
sudo pacman -S \
  i3-gaps xorg-server xorg-xinit xorg-xrandr \
  xorg-xbacklight zsh neovim dmenu \
  git termite openssh base-devel \
  nitrogen alsa-utils pulseaudio \
  htop neofetch xf86-video-intel \
  imagemagick rofi xorg-xev bluez \
  bluez-utils i3lock which tree \
  xorg-xset firefox xclip udisks2 \
  tmux unzip zip nodejs npm \
  v4l-utils

echo "Downloading fonts..."
sudo pacman -S \
  ttf-dejavu noto-fonts ttf-liberation \
  ttf-hack ttf-font-awesome ttf-linux-libertine \
  noto-fonts-emoji font-mathematica ttf-croscore

echo "Downloading Polybar dependencies..."
sudo pacman -S \
  cairo libxcb python xcb-proto \
  xcb-util-image xcb-util-wm xcb-util-cursor \
  xcb-util-xrm alsa-lib libpulse jsoncpp \
  libmpdclient curl libnl wireless_tools

echo "Downloading YAY"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

echo "Downloading AUR dependencies"
yay polybar
yay ttf-google-fonts-typewolf
yay ttf-material-design-icons
yay siji
yay pamac-aur
yay python-pip
yay pywal
yay flameshot
yay peek
yay tty-clock
yay vim-youcompleteme-git
yay google-chrome
yay universal-ctags-git  # dependency for tagbar vim

echo "Downloading neovim dependencies"
sudo pacman -S ack ripgrep
sudo pip install --upgrade jedi pynvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo npm install -g eslint  # Linter for javascript

echo "Downloading dev dependencies"
sudo pacman -S docker docker-compose postgresql openvpn openconnect
sudo systemctl start docker && systemctl enable docker
sudo pip install --upgrade virtualenv

echo "Applying gruvbox color schema"
wal --theme base16-gruvbox-soft

echo "Generating .ssh/ folder"
ssh-keygen

echo "Using zsh as a shell. Note: Restart your computer to take effect"
chsh -l
chsh -s $(which zsh) $(whoami)

echo "Downloading oh my zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

