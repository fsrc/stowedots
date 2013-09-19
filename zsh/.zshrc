#
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ssh-agent gitfast npm node github coffee vi-mode archlinux complete gem last-working-dir rvm colored-man command-not-found extract)

zstyle :omz:plugins:ssh-agent agent-forwarding on
# zstyle :omz:plugins:ssh-agent lifetime 4h

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=${HOME}/.bin
export PATH=${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=${PATH}:/usr/local/sbin
export PATH=${PATH}:/usr/X11/bin
export PATH=${PATH}:${HOME}/.gem/ruby/1.9.1/bin
export PATH=${PATH}:${HOME}/.gem/ruby/2.0.0/bin

current_path=${PWD}

[[ -s /home/fredrik/.nvm/nvm.sh ]] && . /home/fredrik/.nvm/nvm.sh  # This loads NVM

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export VISUAL=vim
export EDITOR=vim

export NLS_LANG="AMERICAN_AMERICA.UTF8"
unset DYLD_LIBRARY_PATH

function lst {
  if test $1
  then
    ls -lash | grep -e $1
  else
    ls -lah
  fi 
}

cd ${current_path}

alias pacman="pacman --color always"
alias packer="packer-color"

