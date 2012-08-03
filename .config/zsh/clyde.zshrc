# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jake/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# more like bash's history search. ^S should be the opposite, except zsh doesn't block stty flow control
bindkey "^R" history-beginning-search-backward

# source aliases
[ -r ~/.sh_aliases ] && . $HOME/.sh_aliases

# environment, should prolly migrate to .zshenv
export PATH=$HOME/bin:$PATH
