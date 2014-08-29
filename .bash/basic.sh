alias ll="ls -l"
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad
export PATH=/usr/local/bin:$PATH

if [ -d ~/.bash/ ] ; then
  for file in `ls ~/.bash/*.sh`
  do
    source "${file}"
  done
fi

export PYENV_ROOT="/Users/r-kimura/.pyenv"
export PATH=/Users/r-kimura/.pyenv/bin:$PATH
eval "$(pyenv init -)"
