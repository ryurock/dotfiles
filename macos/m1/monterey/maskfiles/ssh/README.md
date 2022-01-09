# Tasks SSH

Tasks related to SSH

SSHの設定に関するタスク

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [init](#init)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## init

> ssh init directory & file

```bash
mask init
```

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
[[ ! -e ~/.ssh/config ]] && touch ~/.ssh/config && chmod 600 ~/.ssh/config
```
