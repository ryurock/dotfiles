# Tasks Homebrew

Tasks related to Homebrew

[Homebrew](https://brew.sh/index_ja) に関するタスク

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [install](#install)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## install

> Install MacOS Package Manager Homebrew

```bash
mask install
```

**Scripts**
```bash
[[ ! -e /opt/homebrew/bin/brew ]] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```