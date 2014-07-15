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

