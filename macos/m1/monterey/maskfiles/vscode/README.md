# Tasks zsh

Tasks related to zsh

zshの設定に関するタスク

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [configure](#configure)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## configure

> Configure VSCode

```bash
mask configure
```

**Scripts**
```bash
cp maskfiles/vscode/keybinding.json ~/Library/Application\ Support/Code/User/
cp maskfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/
cat maskfiles/vscode/VSCodeExtFile | while read line ; do
  code --install-extension $line
done
```
