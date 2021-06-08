#!/bin/zsh

############ - ENV variables - ############
export ZSH="/home/x/.oh-my-zsh"
export MANWIDTH=90
export HISTSIZE=10000
export SAVEHIST=10000
export BROWSER=/usr/bin/firefox

############ - ZSH options - ############
ZSH_THEME="arrow"
#ZSH_THEME="lambda"
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
alias picomrc="vim ~/.config/picom/picom.conf"
alias polybarrc="vim ~/.config/polybar/config"
alias termiterc="vim ~/.config/termite/config"
alias newsboatrc="vim ~/.config/newsboat/config"
alias newsboaturls="vim ~/.config/newsboat/urls"
alias rofirc="vim ~/.config/rofi/config.rasi"
alias dunstrc="vim ~/.config/dunst/dunstrc"
alias neomuttrc="vim ~/.config/neomutt/neomuttrc"
alias zathurarc="vim ~/.config/zathura/zathurarc"
alias warm="redshift -P -O 4500"
alias brightdown="warm -b 0.5"
alias brightup="warm -b 1.0"
alias wifi="nmtui"
alias ss="flameshot && flameshot gui"
alias record="peek"
alias usb="udisksctl mount -b"  # Mounts an usb: usb /dev/sdb1
alias format-usb="sudo shred " # format-usb /dev/sdb1
alias update="source ~/.zshrc"
alias hdmi="xrandr --output HDMI1 --mode 1920x1080"
alias mirrors="sudo nvim /etc/pacman.d/mirrorlist"
alias svg="feh --conversion-timeout 1"
alias audio="pavucontrol-qt"  # To select a sound device when casting
alias video="qv4l2"  # To set up webcan config
alias warm-automatic="redshift -P &"
alias pushwiki="cd ~/workspace/vimwiki && git add . && git commit && git push -u origin master"
alias pushdocs="cd ~/workspace/documents && git add . && git commit && git push -u origin main"
alias errors-last-boot="sudo journalctl -b -1 | vim -"
alias errors-since-today="sudo journalctl --since=today | vim -"
alias rss="newsboat"
alias calendar="cal -m -y" # dumb one, but I always forget "cal"
alias mail="neomutt"
alias dict="dict -d wn"
alias weather="curl wttr.in/"
alias music="cmus"
alias torrent="firefox https://www.seedr.cc/"
alias sync-arch="sudo pacman -Syy"
alias arch-debug="cc -g ~/workspace/arch/src/* -o /tmp/arch-d && gdb --args /tmp/arch-d "
alias memcheck-temp="cc -Wall -Wextra temp.c && valgrind --leak-check=full --show-leak-kinds=all ./a.out"
alias debug-temp="cc -g -Wall -Wextra temp.c && gdb ./a.out"
alias compile-temp="cc temp.c && ./a.out"


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

update-time() {
  echo 'Updating system and hardware clock'
  timedatectl set-timezone "NZ"
  sudo ntpd -qg
  sudo hwclock --systohc
}

update-arch() {
  # the following script is ZSH language, not BASH!
  while true; do
    read -q "choice?Have you read the latest archlinux news? (y/N): "
    echo '\n'
    case $choice in
      [yY]* )
        update-time()
        echo '[TODO] - Updating mirrors'
        echo 'Updating package list and upgrading all installed repo and AUR'
        yay -Syu --answerclean None --answerdiff None --answerclean All
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

webcam-setup() {
  cd /dev/
  sudo mv video0 video0.temp
  sudo mv video2 video0
  cd ~
}

# bluetooth handy commands
bluetooth-start() {
  bluetoothctl -- power on
  bluetoothctl -- agent on
  bluetoothctl -- default-agent
}
bluetooth-scan() {
  bluetooth-start
  bluetoothctl -- scan on
}
bluetooth-devices() {
  bluetooth-start
  bluetoothctl -- devices
}
bluetooth-connect() {
  bluetooth-start
  bluetoothctl -- trust $1
  bluetoothctl -- connect $1
}
bluetooth-disconnect() {
  bluetooth-start
  bluetoothctl -- disconnect $1
}

function bluetooth-keyboard () {
  bluetooth-connect 70:F0:87:3A:86:D2
}

function bluetooth-headphone() {
  bluetooth-connect 14:3F:A6:15:9D:C3
}
