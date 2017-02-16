zle -N zle-line-init


if [[ ! -d ${ZPLUG_HOME} ]]; then
    git clone https://github.com/zplug/zplug ${ZPLUG_HOME}
    source ${ZPLUG_HOME}/init.zsh && zplug update --self
fi

source ${ZPLUG_HOME}/init.zsh

# Theme
zplug "dracula/zsh", as:theme

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


# Syntax highlighting on the command line
zplug "zsh-users/zsh-syntax-highlighting"

# Better history search
zplug "zsh-users/zsh-history-substring-search"


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
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

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
alias kat=pygmentize
alias tmux="tmux -f ~/.config/tmux/config"

#nvm use default

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

bindkey '^P' fuzzy-search-and-edit
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

