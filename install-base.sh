#!/bin/env bash

install_command() {
  if hash pacman 2>/dev/null; then
    sudo pacman -S $1
  elif hash apt-get 2>/dev/null; then
    sudo apt-get install $1
  fi
}

ensure_command() {
  if hash $1 2>/dev/null; then
    echo "$1 found"
  else
    echo "$1 not found, installing.."
    install_command $1
  fi
}

install_oh-my-zsh() {
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
}

install_spf13-vim3() {
  curl http://j.mp/spf13-vim3 -L -o - | sh
}

stow scripts
stow zsh
stow vim
stow mc
stow git
stow terminfo

ensure_command git
ensure_command zsh
ensure_command vim
ensure_command mc
ensure_command curl

install_oh-my-zsh
install_spf13-vim3

