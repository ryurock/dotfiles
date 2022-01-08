# Tasks zsh

Tasks related to zsh

zshの設定に関するタスク

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [install-prezto](#install-prezto)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## install-prezto

> Install prezto

```bash
mask install-prezto
```

**Scripts**
```bash
if [ ! -e ~/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
  ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin
  ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout
  ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
  ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile
  ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv
fi
cp maskfiles/zsh/prezto/.zpreztorc ~/.zpreztorc
```
