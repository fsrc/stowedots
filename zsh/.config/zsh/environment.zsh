export GOPATH=${HOME}/go
export PATH=${PATH}:${HOME}/bin:PATH=${PATH}:${GOPATH//://bin:}/bin
export PATH=${PATH}:${HOME}/.mos/bin

export PATH=${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=${PATH}:/usr/bin/core_perl
export PATH=${PATH}:/usr/local/sbin
export PATH=${PATH}:/usr/X11/bin

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export VISUAL=less
export EDITOR=vim

export NLS_LANG="AMERICAN_AMERICA.UTF8"

export ENHANCD_FILTER=fzf

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
