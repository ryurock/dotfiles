# Tasks Docker

Tasks related to Docker

Dockerに関するタスク

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [install](#install)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## install

> Install Docker Softwares

```bash
mask install
```

**Scripts**
```bash
brew install docker docker-completion
# M1 mac用のDocker for Mac
if [[ ! -e /Applications/Docker.app ]]; then
  [[ ! -e /tmp/Docker.dmg ]] && curl -L -o /tmp/Docker.dmg "https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64"
  [[ -e /Volumes/Docker ]] && hdiutil unmount /Volumes/Docker
  hdiutil mount /tmp/Docker.dmg
  cp -r /Volumes/Docker/Docker.app /Applications
  hdiutil unmount /Volumes/Docker
  rm -rf /tmp/Docker.dmg
fi
```