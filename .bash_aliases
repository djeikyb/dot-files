#-- GLOBAL {{{
# greps
alias egrep='"grep" -Ei --color=auto'
alias fgrep='"grep" -Fi --color=auto'
alias grep='"grep" -i --color=auto'
# case insensitive
alias less='less -i'
alias man='man -i'
# misc system
alias cal='"ncal" -bM3'   # b=cal style. M=monday first. 3=3 months
alias df='"df" -h'
alias du='"du" -bh'
alias ls='"ls" --color=auto -F'
alias pgrep='pgrep -l'
alias rxvt='urxvt'
alias tmux="tmux -2"
alias top='htop'
alias which='alias | /usr/local/bin/which --tty-only --read-alias --show-dot --show-tilde'
#}}} -- GLOBAL

#-- HOST SPECIFIC {{{
case "$(hostname)" in
    daedalus)
        # etc
        alias feh='feh -F'
        alias slocate='slocate -i'
        alias mutt='mutt -F ~/.config/mutt/muttrc'
        alias mm="mmutter"
        alias mmutter='mutt -F ~/.config/mmutter/muttrc'
        alias gmutt='mutt -F ~/.config/mutt-gmail/muttrc'
        #alias play='plaiter'
        alias plait='plait -l'
        alias xterm='xterm -fa inconsolata -geometry 106x43'
        ;;
    clyde)
        alias locate='"locate" -i'
        ;;
#}}} -- HOST SPECIFIC
