# Tasks For M1 Mac Monterey Install Initialize

Setup script for M1 mac macOS [Monterey](https://www.apple.com/macos/monterey/)

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [install](#install)
- [mac-setting](#mac-setting)
  - [mac-setting disable-gatekeeper](#mac-setting-disable-gatekeeper)
- [xcode](#xcode)
  - [xcode commandline-install](#xcode-commandline-install)
- [homebrew](#homebrew)
  - [homebrew install](#homebrew-install)
- [github](#github)
  - [github login](#github-login)
  - [github install-github-cli](#github-install-github-cli)
  - [github register-ssh-key](#github-register-ssh-key)
  - [github register-ssh-key](#github-register-ssh-key-1)
- [mask](#mask)
  - [mask install](#mask-install)
- [requirements-install](#requirements-install)
- [optional-install](#optional-install)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## install
---

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

## mac-setting
---

> Tasks related to mac settings

```
mask mac-setting
```

### mac-setting disable-gatekeeper

> Unblock third-party applications on your Mac

![macOS-10-13-High-Sierra-New-Features-Secure_Kernel_Extension_Loading-img-2](https://user-images.githubusercontent.com/1619084/148622932-4dc42786-85ad-4323-bcda-6044c7351aee.jpg)

```
mask mac-setting disable-gatekeeper
```

**Scripts**
```bash
echo "|======================================================================|"
echo "| Turn off GateKeeper on your Mac.                                     |"
echo "| This is required to allow apps that are not registered               |"
echo "| in the App Store with third party products                           |"
echo "|                                                                      |"
echo "| Enter password as sudo permission is required                        |"
echo "|                                                                      |"
echo "|======================================================================|"
sudo spctl --master-disable
```

## xcode
---

> XCode related tasks

```
mask xcode
```

### xcode commandline-install

> Xcode Commandline Install

```
mask xcode commandline-install
```

**Scripts**
```bash
xcode-select --install
```

## homebrew

> MacOS Package Manager Homebrew tasks

```
mask homebrew
```

### homebrew install

> Install MacOS Package Manager Homebrew

```
mask homebrew install
```

**Scripts**
```bash
[[ ! -e /opt/homebrew/bin/brew ]] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## github
---

> github configure tasks

```
mask github
```

### github login

> github login

```
mask github login
```

**Scripts**
```bash
echo "|======================================================================|"
echo "|                                                                      |"
echo "|                      Please log in to GitHub                         |"
echo "|                                                                      |"
echo "|======================================================================|"
[[ `uname` == "Darwin" ]] && open "https://github.com/login"
[[ `uname` == "Linux" ]] && gnome-open "https://github.com/login"
```

### github install-github-cli

> Install github cli

[GitHub CLI](https://cli.github.com)

```
mask github install-github-cli
```

**Scripts**
```bash
[[ ! -e /opt/homebrew/bin/brew ]] && mask homebrew install
brew install gh
```

### github register-ssh-key

> Register SSH key on github

```
mask github register-ssh-key
```

**Scripts**
```bash
[[ ! -e /opt/homebrew/bin/brew ]] && mask homebrew install
[[ ! -e /opt/homebrew/bin/gh ]] && mask github install-github-cli
# Create SSH key & Github Auth
gh auth login
# Please Enter Code Jump to
# open https://github.com/login/device
```

### github register-ssh-key

> Register SSH key on github

```
mask github register-ssh-key
```

**Steps for Github Cli**

**1. Choice Github.com or Github Enterprise**

```
? What account do you want to log into?  [Use arrows to move, type to filter]
> GitHub.com
  GitHub Enterprise Server
```

**2. Choice Protocol**

```
? What is your preferred protocol for Git operations?  [Use arrows to move, type to filter]
  HTTPS
> SSH
```

**3. Generate new SSH Key or choice exsits SSH Key**

Not exsits SSH KEY
```
? Generate a new SSH key to add to your GitHub account? (Y/n)
# usually empty password
? Enter a passphrase for your new SSH key (Optional) 
```


Already exists SSH Key Question
```
? You're already logged into github.com. Do you want to re-authenticate? (y/N) 
```

**4. Choice Authenticate**

```
? How would you like to authenticate GitHub CLI? Login with a web browser

! First copy your one-time code: xxxx-xxxx
- Press Enter to open github.com in your browser... 
```

Response

```
✓ Authentication complete. Press Enter to continue...
- gh config set -h github.com git_protocol ssh
✓ Configured git protocol
✓ Uploaded the SSH key to your GitHub account: $HOME/.ssh/id_ed25519.pub
✓ Logged in as {your account name}
```

**Scripts**
```bash
[[ ! -e /opt/homebrew/bin/brew ]] && mask homebrew install
[[ ! -e /opt/homebrew/bin/gh ]] && mask github install-github-cli
gh auth login

# Rename SSH Key
[[ -e ~/.ssh/id_ed25519 ]] && mv ~/.ssh/id_ed25519 ~/.ssh/`whoami`.github.id_ed25519
[[ -e ~/.ssh/id_ed25519.pub ]] && mv ~/.ssh/id_ed25519.pub ~/.ssh/`whoami`.github.id_ed25519.pub
echo "|======================================================================|"
echo "|                        Your Github SSH Key                           |"
echo "|======================================================================|"
ls -al ~/.ssh/`whoami`.github*

# Add or Display SSH config
whoami=`whoami`
if [[ ! -e ~/.ssh/config ]]; then
  cat << EOF > ~/.ssh/config
Host github.com
  HostName github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/${whoami}.github.id_ed25519
EOF
  echo "|======================================================================|"
  echo "|                    Your SSH Config ~/.ssh/config                     |"
  echo "|======================================================================|"
  cat ~/.ssh/config
else
  echo "|======================================================================|"
  echo "|         Check ot if not exists Paste SSH config ~/.ssh/config        |"
  echo "|======================================================================|"
  cat << EOF
Host github.com
  HostName github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/${whoami}.github.id_ed25519
EOF
fi

# Add ssh-agent
eval "$(ssh-agent -s)"

# Check Connection Github SSH
ssh -T git@github.com
```

## mask

> mask is a CLI task runner which is defined by a simple markdown file

### mask install

> Install mask. markdwon CLI task runner 

```
mask mask install
```

**Scripts**
```bash
brew install mask
```

## requirements-install

> Install almost essential software

**Scripts**
```bash
brew bundle --file=Brewfile.requirements
# Docker for mac
if [[ ! -e /Applications/Docker.app ]]; then
  [[ ! -e /tmp/Docker.dmg ]] && curl -L -o /tmp/Docker.dmg "https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64"
  [[ -e /Volumes/Docker ]] && hdiutil unmount /Volumes/Docker
  hdiutil mount /tmp/Docker.dmg
  cp -r /Volumes/Docker/Docker.app /Applications
  hdiutil unmount /Volumes/Docker
  rm -rf /tmp/Docker.dmg
fi
```

## optional-install

> Install something that is not required but useful software

**Scripts**
```bash
brew bundle --file=Brewfile.optionals
```
