#!/bin/zsh

############ - ENV variables - ############
export ZSH="/home/x/.oh-my-zsh"
export MANWIDTH=90
export HISTSIZE=10000
export SAVEHIST=10000

############ - ZSH options - ############
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
SIMPL_ZSH_DIR=$HOME/.zsh
plugins=(git)
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
alias rofirc="vim ~/.config/rofi/config.rasi"
alias brightdown="xbacklight -dec 10"
alias brightup="xbacklight -inc 10"
alias wifi=nmtui
alias update="source ~/.zshrc"

clear
