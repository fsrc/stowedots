zle -N zle-line-init


if [[ ! -d ${ZPLUG_HOME} ]]; then
    git clone https://github.com/zplug/zplug ${ZPLUG_HOME}
    source ${ZPLUG_HOME}/init.zsh && zplug update --self
fi

source ${ZPLUG_HOME}/init.zsh

source ${HOME}/.config/zsh/plugin.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose

source ${HOME}/.config/zsh/environment.zsh

source ${HOME}/.config/zsh/alias.zsh

source ${HOME}/.config/zsh/function.zsh

source ${HOME}/.config/zsh/bindkey.zsh


