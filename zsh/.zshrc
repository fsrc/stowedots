# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ssh-agent nvm gitfast git-extras npm node github coffee archlinux complete gem colored-man extract dircycleh)

zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh

export PATH=${HOME}/.cabal/bin
export PATH=${PATH}:${HOME}/bin
export PATH=${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=${PATH}:/usr/bin/core_perl
export PATH=${PATH}:/usr/local/sbin
export PATH=${PATH}:/usr/X11/bin


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export VISUAL=vim
export EDITOR=vim

export NLS_LANG="AMERICAN_AMERICA.UTF8"


alias pacman="pacman --color always"
alias packer="packer-color"
nvm use default

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source /home/fredrik/.rvm/scripts/rvm
