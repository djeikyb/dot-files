set -o vi   # vi bindings for shell
[ -r ~/.bash_aliases ] && . $HOME/.bash_aliases
[ "$TERM" = "rxvt-256color" ] && TERM='rxvt-unicode'
[ "$TERM" = "rxvt-unicode-256color" ] && TERM='rxvt-unicode'
PATH=$HOME/bin:$PATH
HISTCONTROL=ignoreboth # ignore dups and "^ .*$"

[ -n "$DISPLAY" ] && BROWSER="chromium --new-tab-page"

# UBUNTU DEFAULTS -- {{{
if [ "$(hostname)" = "daedalus" ]; then
    export EDITOR="/usr/bin/vim.basic"
    export VISUAL="$EDITOR"
#
#    # If not running interactively, don't do anything
    [ -z "$PS1" ] && return
    PS1="${txtylw}\h ${txtcyn}\w${txtylw}\$${txtrst} "
    if [ "$(id -u)" = "0" ]; then
        #PS1="${txtred}\h${txtrst} \w\# "
        PS1="${txtylw}${bakred}\h${txtylw} \w ${bldred}#${txtrst} "
        #[ -r /etc/bash_completion   ] && . /etc/bash_completion
    fi
#
#    # check the window size after each command and, if necessary,
#    # update the values of LINES and COLUMNS.
#    shopt -s checkwinsize
#
#    # make less more friendly for non-text input files, see lesspipe(1)
#    [ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
#
#    # set variable identifying the chroot you work in (used in the prompt below)
#    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#        debian_chroot=$(cat /etc/debian_chroot)
#    fi
#
#    # set a fancy prompt (non-color, unless we know we "want" color)
#    case "$TERM" in
#    xterm-color)
#        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#        ;;
#    *)
#        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#        ;;
#    esac
#    # enable color support of ls and also add handy aliases
#    if [ "$TERM" != "dumb" ]; then
#        [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
#            [ -e "$DIR_COLORS" ] || DIR_COLORS=""
#            eval "`dircolors -b $DIR_COLORS`"
#    fi
#
#    # Comment in the above and uncomment this below for a color prompt
#    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#
#    # If this is an xterm set the title to user@host:dir
#    case "$TERM" in
#    xterm*|rxvt*)
#        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
#        ;;
#    *)
#        ;;
#    esac
#
    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    [ -r /etc/bash_completion ] && . /etc/bash_completion
fi # }}} -- UBUNTU DEFAULTS

# CLYDE DEFAULTS -- {{{
if [ "$(hostname)" = "clyde" ]; then
    PS1="${bldcyn}${bakblu}\w${txtrst} "
    if [ "$(id -u)" = "0" ]; then
        PS1="${txtylw}${bakred}\w${txtrst}# "
        [ -r /etc/bash_completion   ] && . /etc/bash_completion
    fi
    PATH=$HOME/bin/paywright:/opt/jdk/bin:$PATH
fi # }}} -- CLYDE DEFAULTS
