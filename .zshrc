#!/bin/zsh

############ - ENV variables - ############
export ZSH="/home/x/.oh-my-zsh"
export MANWIDTH=90
export HISTSIZE=10000
export SAVEHIST=10000
export BROWSER=/usr/bin/firefox

############ - ZSH options - ############
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
SIMPL_ZSH_DIR=$HOME/.zsh
plugins=(git globalias)
source $ZSH/oh-my-zsh.sh

############ - User configuration - ############

export LANG=en_US.UTF-8
export EDITOR='nvim'

KEYTIMEOUT=1  # Fixes slow <esc> in vim
stty -ixon # don't disturbe when CTRL+S and CTRL+Q
stty sane # avoid tmux going crazy
bindkey -v # vim mode
(cat ~/.cache/wal/sequences &)  # load wal theming

############ - Aliases - ############
alias vim='nvim'
alias vimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"
alias tmuxrc="vim ~/.tmux.conf"
alias i3rc="vim ~/.config/i3/config"
alias polybarrc="vim ~/.config/polybar/config"
alias termiterc="vim ~/.config/termite/config"
alias newsboatrc="vim ~/.config/newsboat/config"
alias rofirc="vim ~/.config/rofi/config.rasi"
alias brightdown="xbacklight -dec 10"
alias brightup="xbacklight -inc 10"
alias wifi="nmtui"
alias ss="flameshot && flameshot gui"
alias record="peek"
alias usb="udisksctl mount -b"  # Mounts an usb: usb /dev/sdb1
alias update="source ~/.zshrc"
alias hdmi="xrandr --output HDMI1 --mode 1920x1080"
alias mirrors="sudo nvim /etc/pacman.d/mirrorlist"
alias svg="feh --conversion-timeout 1"
alias audio="pavucontrol"  # To select a sound device when casting
alias video="qv4l2"  # To set up webcan config
alias warm="redshift -P &"
alias pushwiki="cd ~/workspace/vimwiki && git add . && git commit && git push -u origin master"
alias pushdocs="cd ~/workspace/documents && git add . && git commit && git push -u origin main"
alias errors-last-boot="sudo journalctl -b -1 | vim -"
alias errors-since-today="sudo journalctl --since=today | vim -"
alias rss="newsboat"

# The user can override .zshrc_private with some custom things.
source ~/.zshrc_private
clear

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

aur() {
  echo Installing $1 from AUR
  git clone https://aur.archlinux.org/$1.git
  cd $1
  yes | makepkg -si
  cd ..
  rm -rf $1
}

update-arch() {
  # the following script is ZSH language, not BASH!
  while true; do
    read -q "choice?Have you read the latest archlinux news? (y/N): "
    echo '\n'
    case $choice in
      [yY]* )
        echo '[TODO] - Updating mirrors'
        echo 'Upgrading pacman packages...'
        sudo pacman -Syu
        echo 'Updgrading AUR packages'
        aur_packages=("${(@f)$(pacman -Qqm)}")
        echo 'Upgrading following AUR packages (this may take a while): \n'
        echo $aur_packages
        yay -Syu
        # alternative way to be used when yay isn't good anymore
        # for package in $aur_packages; do
        #  aur $package
        # done
        echo "DONE, you are all sorted!"
      ;;
      [Nn]* )
        echo '[IMPORTANT] Please read the official site latest news!' 
        firefox --new-window https://archlinux.org
        update-arch
      ;;
    esac
  done
}
