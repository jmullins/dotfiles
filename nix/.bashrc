#vi key bindings
set -o vi

#Increase command history size
HISTSIZE=10000

#Proxies
export HTTP_PROXY=
export HTTPS_PROXY=
export http_proxy=$HTTP_PROXY
export https_proxy=$HTTPS_PROXY

#OS specific config
export OS=`uname`

case "$OS" in
    SunOS)
        alias ls="ls -F"
        alias man="man -t"

        export TCAT="less -sR"
        export TROFF="nroff -u0"
        ;;
    Linux)
        stty erase \^\? 
        alias ls='ls -h -F --color=auto'
        alias grep='grep --color=auto'

        #export PS1='\[\033[32m\]\u@\h \[\033[31m\w\033[0m\]\n$ '
        export PS1='\u@\h \w $ '

        # Defaults are too dark.
        export LS_COLORS=
        ;;
esac

#host-specific config
hostname=`hostname`
#if [ -z "${hostname##localdev}" ]
#then
#        . /opt/etc/profile
#elif [ -z "${hostname##pattern*}" ]
#then
#        . /opt/etc/profile
#fi

