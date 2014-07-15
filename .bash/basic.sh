alias ll="ls -l"
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ -d ~/.bash/ ] ; then
  for file in `ls ~/.bash/*.sh`
  do
    source "${file}"
  done
fi

