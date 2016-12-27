#!/bin/bash

if hash pacman 2>/dev/null; then
  INSTALL_PACKAGE="sudo pacman -S"
elif hash apt-get 2>/dev/null; then
  INSTALL_PACKAGE="sudo apt-get install"
fi


install_command() {
  $INSTALL_PACKAGE $1
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
  rm -f ~/.zshrc
}

install_spf13-vim3() {
  curl http://j.mp/spf13-vim3 -L -o - | sh
  rm -f ~/.gvimrc.local
  rm -f ~/.vimrc.before.local
  rm -f ~/.vimrc.bundles.local
  rm -f ~/.vimrc.local
}

install_nodejs() {
  # Install Node Version Manager
  git clone https://github.com/creationix/nvm.git ~/.nvm
  source ~/.nvm/nvm.sh
  nvm install 7.3
  nvm alias default 7.3

  npm install coffee-script -g
}

ensure_command stow
ensure_command git
ensure_command zsh
ensure_command vim
ensure_command curl

install_oh-my-zsh
install_spf13-vim3

stow scripts
stow git
stow terminfo
stow zsh
stow vim

install_nodejs

