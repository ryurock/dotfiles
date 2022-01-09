# Tasks Font

Tasks related to font

フォントの設定に関するタスク

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [install-ricty-font](#install-ricty-font)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## install-ricty-font

> Install Ricty Font

```bash
mask init
```

```bash
# fonts for https://github.com/edihbrandon/RictyDiminished
mkdir -p ~/Downloads/RictyDiminished/
rm -rf ~/Downloads/RictyDiminished/*.ttf
curl -o ~/Downloads/RictyDiminished/RictyDiminished-Regular.ttf https://raw.githubusercontent.com/edihbrandon/RictyDiminished/master/RictyDiminished-Regular.ttf
curl -o ~/Downloads/RictyDiminished/RictyDiminished-Bold.ttf https://raw.githubusercontent.com/edihbrandon/RictyDiminished/master/RictyDiminished-Bold.ttf
mv ~/Downloads/RictyDiminished/ /Library/Fonts/
```
