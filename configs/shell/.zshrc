# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/khaleel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ -f ~/.bash_aliases ]; then
    . ~/.aliases
fi

eval "$(starship init zsh)"
