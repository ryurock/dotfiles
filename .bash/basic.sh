alias ll="ls -l"
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH=/usr/local/bin:$PATH

if [ -d ~/.bash/ ] ; then
  for file in `ls ~/.bash/*.sh`
  do
    source "${file}"
  done
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
