#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias ll="ls -l"
alias ls='ls -G'

if [ -d ~/dotfiles/.zsh/ ] ; then
  for file in `ls ~/dotfiles/.zsh/*.sh`
  do
    source "${file}"
  done
fi

