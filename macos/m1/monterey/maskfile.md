# Tasks For M1 Mac Monterey Install Initialize

Setup script for M1 mac macOS [Monterey](https://www.apple.com/macos/monterey/)

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [install](#install)
- [macos-configure](#macos-configure)
  - [macos-configure disable-gatekeeper](#macos-configure-disable-gatekeeper)
  - [macos-configure modify-defaults](#macos-configure-modify-defaults)
- [zsh](#zsh)
  - [zsh init](#zsh-init)
  - [zsh install-prezto](#zsh-install-prezto)
  - [zsh peco-history](#zsh-peco-history)
- [ssh](#ssh)
  - [ssh init](#ssh-init)
- [font](#font)
  - [font install-ricty-font](#font-install-ricty-font)
- [xcode](#xcode)
  - [xcode install-commandline](#xcode-install-commandline)
- [homebrew](#homebrew)
  - [homebrew install](#homebrew-install)
- [github](#github)
  - [github login](#github-login)
  - [github install-github-cli](#github-install-github-cli)
  - [github register-ssh-key](#github-register-ssh-key)
- [requirements-software](#requirements-software)
  - [requirements-software install](#requirements-software-install)
- [optional-software](#optional-software)
  - [optional-software install](#optional-software-install)
- [docker](#docker)
  - [docker install](#docker-install)
- [vscode](#vscode)
  - [vscode configure](#vscode-configure)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## macos-configure

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/macos/README.md

### macos-configure disable-gatekeeper

> Unblock third-party applications on your Mac

![macOS-10-13-High-Sierra-New-Features-Secure_Kernel_Extension_Loading-img-2](https://user-images.githubusercontent.com/1619084/148622932-4dc42786-85ad-4323-bcda-6044c7351aee.jpg)

```bash
mask --maskfile maskfiles/macos/README.md disable-gatekeeper
```

### macos-configure modify-defaults

> Add settings to make your mac easier to use

```bash
mask --maskfile maskfiles/macos/README.md modify-defaults
```

## zsh

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/zsh/README.md

### zsh init

> initialize zsh

```
mask zsh init
```

**Scripts**
```bash
mask --maskfile maskfiles/zsh/README.md init
```

### zsh install-prezto

> Install prezto

```
mask zsh install-prezto
```

**Scripts**
```bash
mask --maskfile maskfiles/xcode/README.md install-commandline
mask --maskfile maskfiles/zsh/README.md install-prezto
```

### zsh peco-history

> Configure history search with peco

```
mask zsh peco-history
```

**Scripts**
```bash
mask --maskfile maskfiles/zsh/README.md peco-history
```

## ssh

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/ssh/README.md

### ssh init

> ssh init directory & file

```bash
mask --maskfile maskfiles/ssh/README.md init
```

## font

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/font/README.md

### font install-ricty-font

> Install Ricty Font

```bash
mask --maskfile maskfiles/font/README.md install-ricty-font
```

## xcode

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/xcode/README.md

### xcode install-commandline

> Xcode Commandline Install

```bash
mask --maskfile maskfiles/xcode/README.md install-commandline
```

## homebrew

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/homebrew/README.md

### homebrew install

> Install MacOS Package Manager Homebrew

```bash
mask --maskfile maskfiles/homebrew/README.md install
```

## github


> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/github/README.md

### github login

> github login

```bash
mask --maskfile maskfiles/github/README.md login
```

### github install-github-cli

> Install github cli

[GitHub CLI](https://cli.github.com)

```
mask github install-github-cli
```

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/README.md install
mask --maskfile maskfiles/github/README.md install-github-cli
```

### github register-ssh-key

> Register SSH key on github

```
mask github register-ssh-key
```

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/README.md install
mask --maskfile maskfiles/github/README.md install-github-cli
mask --maskfile maskfiles/github/README.md register-ssh-key
```

## requirements-software

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/requirements-software/README.md

### requirements-software install

> Install almost essential software

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/README.md install
mask --maskfile maskfiles/requirements-software/README.md install
```

## optional-software

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/optional-software/README.md

### optional-software install

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/README.md install
mask --maskfile maskfiles/optional-software/README.md install
```

## docker

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/docker/README.md

### docker install

> Install Docker softwares

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/README.md install
mask --maskfile maskfiles/docker/README.md install
```

## vscode

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/vscode/README.md

### vscode configure

> initalize configure vscode setting

```bash
mask --maskfile maskfiles/zsh/README.md configure
```