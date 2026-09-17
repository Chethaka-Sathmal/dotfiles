# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/csathmal/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
ZSH_THEME="gnzh"

# Custom config
[ -f "$HOME/.dotfiles/.aliases" ] && . "$HOME/.dotfiles/.aliases" 

alias lsa="ls -a"
