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
- [zsh](#zsh)
  - [zsh install-prezto](#zsh-install-prezto)
- [vscode](#vscode)
  - [vscode configure](#vscode-configure)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## install

> 推奨する機能全てをインストールします

```
mask install
```

**Scripts**
```bash
mask xcode commandline-install
mask mac-setting disable-gatekeeper
mask homebrew install
mask github login
mask github install-github-cli
mask github register-ssh-key
mask requirements install
```

## macos-configure

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/macos/maskfile.md

### macos-configure disable-gatekeeper

> Unblock third-party applications on your Mac

![macOS-10-13-High-Sierra-New-Features-Secure_Kernel_Extension_Loading-img-2](https://user-images.githubusercontent.com/1619084/148622932-4dc42786-85ad-4323-bcda-6044c7351aee.jpg)

```bash
mask --maskfile maskfiles/macos/maskfile.md disable-gatekeeper
```

### macos-configure modify-defaults

> Add settings to make your mac easier to use

```bash
mask --maskfile maskfiles/macos/maskfile.md modify-defaults
```


## ssh

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/ssh/maskfile.md

### ssh init

> ssh init directory & file

```bash
mask --maskfile maskfiles/ssh/maskfile.md init
```

## font

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/font/maskfile.md

### font install-ricty-font

> Install Ricty Font

```bash
mask --maskfile maskfiles/font/maskfile.md install-ricty-font
```

## xcode

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/xcode/maskfile.md

### xcode install-commandline

> Xcode Commandline Install

```bash
mask --maskfile maskfiles/xcode/maskfile.md install-commandline
```

## homebrew

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/homebrew/maskfile.md

### homebrew install

> Install MacOS Package Manager Homebrew

```bash
mask --maskfile maskfiles/homebrew/maskfile.md install
```

## github


> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/github/maskfile.md

### github login

> github login

```bash
mask --maskfile maskfiles/github/maskfile.md login
```

### github install-github-cli

> Install github cli

[GitHub CLI](https://cli.github.com)

```
mask github install-github-cli
```

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/maskfile.md install
mask --maskfile maskfiles/github/maskfile.md install-github-cli
```

### github register-ssh-key

> Register SSH key on github

```
mask github register-ssh-key
```

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/maskfile.md install
mask --maskfile maskfiles/github/maskfile.md install-github-cli
mask --maskfile maskfiles/github/maskfile.md register-ssh-key
```

## requirements-software

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/requirements-software/maskfile.md

### requirements-software install

> Install almost essential software

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/maskfile.md install
mask --maskfile maskfiles/requirements-software/maskfile.md install
```

## optional-software

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/optional-software/maskfile.md

### optional-software install

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/maskfile.md install
mask --maskfile maskfiles/optional-software/maskfile.md install
```

## docker

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/docker/maskfile.md

### docker install

> Install Docker softwares

**Scripts**
```bash
mask --maskfile maskfiles/homebrew/maskfile.md install
mask --maskfile maskfiles/docker/maskfile.md install
```

## zsh

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/zsh/maskfile.md

### zsh install-prezto

> Install prezto

```
mask zsh install-prezto
```

**Scripts**
```bash
mask --maskfile maskfiles/xcode/maskfile.md install-commandline
mask --maskfile maskfiles/zsh/maskfile.md install-prezto
```

## vscode

> see https://github.com/ryurock/dotfiles/tree/master/macos/m1/monterey/maskfiles/vscode/maskfile.md

### vscode configure

> initalize configure vscode setting

```bash
mask --maskfile maskfiles/zsh/maskfile.md configure
```