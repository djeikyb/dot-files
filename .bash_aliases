#-- GLOBAL {{{
# greps
alias egrep='"grep" -Ei --color=auto'
alias fgrep='"grep" -Fi --color=auto'
alias grep='"grep" -i --color=auto'
# case insensitive
alias less='less -i'
alias man='man -i'
# misc system
alias df='"df" -h'
alias du='"du" -bh'
alias gmutt='mutt -F ~/.config/mutt-gmail/muttrc'
alias ls='"ls" --color=auto -F'
alias pdf='"apvlv"'
alias pgrep='pgrep -fl'
alias rxvt='urxvt'
alias tmux="tmux -2"
alias top='htop'
alias which='alias | "which" --tty-only --read-alias --show-dot --show-tilde'
# stupid app names
alias muta='mid3v2'
#}}} -- GLOBAL

#-- daedalus SPECIFIC {{{
case "$(hostname)" in
    daedalus)
        # etc
        alias cal='"ncal" -bM3'   # b=cal style. M=monday first. 3=3 months
        alias feh='feh --fullscreen'
        alias slocate='slocate -i'  # case insens
        alias mutt='mutt -F ~/.config/mutt/muttrc'
        alias mm="mmutter"
        alias mmutter='mutt -F ~/.config/mmutter/muttrc'
        #alias play='plaiter'
        alias plait='plait -l'
        alias xterm='xterm -fa inconsolata -geometry 106x43'
        ;;
#}}} -- daedalus SPECIFIC
#-- clyde SPECIFIC {{{
    clyde)
        alias cal='"cal" -m3'
        alias mpc='"mpc" --host 10.1.1.22 --port 6600'
        alias locate='"locate" -i'  # case insens
        #alias python=''python2"'
        ;;
#}}} -- clyde SPECIFIC
esac
