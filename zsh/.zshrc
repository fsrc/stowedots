source ${HOME}/.zplug/init.zsh

# Theme
zplug "dracula/zsh", as:theme

# Better history search
zplug "zsh-users/zsh-history-substring-search"

# Jump to directories
zplug "wting/autojump"

# Calculator
zplug "arzzen/calc.plugin.zsh"

# NVM auto completion
zplug "lukechilds/zsh-nvm"
# NPM auto completion
zplug "lukechilds/zsh-better-npm-completion"

# Vim mode in edit line
zplug "sharat87/zsh-vim-mode"

# Fuzzy search change directory
zplug "b4b4r07/enhancd", use:init.sh

# Enables asynchronous plugins
zplug "mafredri/zsh-async"

# Fuzzy search on ctrl-p, edit the file chosen
zplug "seletskiy/zsh-fuzzy-search-and-edit"

# aur packer auto completer
zplug "wakeful/zsh-packer"

# More advanced 'ls'
zplug "supercrabtree/k"

# Blackbox (encrypted credentials in repositories)
zplug 'StackExchange/blackbox'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose

export PATH=${PATH}:${HOME}/.gem/ruby/2.3.0/bin
export PATH=${PATH}:${HOME}/bin
export PATH=${PATH}:${HOME}/go/bin
export PATH=${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=${PATH}:/usr/bin/core_perl
export PATH=${PATH}:/usr/local/sbin
export PATH=${PATH}:/usr/X11/bin

export GOPATH=${HOME}/go


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export VISUAL=vim
export EDITOR=vim

export NLS_LANG="AMERICAN_AMERICA.UTF8"

export ENHANCD_FILTER=fzf

alias pacman="pacman --color always"
alias packer="packer-color --noedit"
alias vim="nvim"
alias ls="ls --color=always"
alias l="k -h"

#nvm use default

bindkey '^P' fuzzy-search-and-edit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
