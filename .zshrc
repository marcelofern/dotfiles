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
alias vpn="ss-local -c /etc/shadowsocks-libev/config.json -v"

###### GITHUB REPOS ALIASES ########
alias mf="cd ~/workspace/marcelofern"
alias docs="cd ~/workspace/documents"
function mfpush {
  cd ~/workspace/marcelofern
  git add .
  git commit
  git push origin master
  npm run generate
  cd ~/workspace/marcelofern.github.io/
  rm -r -f *
  mv ~/workspace/marcelofern/dist/* .
  mv ~/workspace/marcelofern/dist/.* .
  git add .
  git commit -m "site update"
  git push origin master
}
alias mfpush=mfpush

function heart-env {
  cd ~/workspace/masters/machine_learning/heart
  source ~/workspace/masters/machine_learning/heart/env_heart/bin/activate
}

function heart {
  heart-env
  pip install ipykernel
  python -m ipykernel install --user --name=env_heart
  jupyter notebook
}

########### BLUETOOTH UTILS ########### 
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

aunction bluetooth-keyboard () {
  bluetooth-connect 70:F0:87:3A:86:D2
}

function bluetooth-headphone() {
  bluetooth-connect 14:3F:A6:15:9D:C3
}

function bluetooth-mouse() {
  bluetooth-connect E0:52:24:93:D4:AE
}

########## OCTOPUS STUFF #############
export OCTODEV_REPO_PATH=/home/x/workspace/octodev
alias octodev="inv -f ${OCTODEV_REPO_PATH}/invoke.override.yml --search-root=${OCTODEV_REPO_PATH}"
alias kraken="cd ~/workspace/kraken-core/ && source ~/workspace/env_kraken/bin/activate"
