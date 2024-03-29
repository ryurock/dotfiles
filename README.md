<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [dotfiles](#dotfiles)
  - [Installration](#installration)
    - [Install XCode Commandline Tool](#install-xcode-commandline-tool)
    - [Disable Gatekeeper](#disable-gatekeeper)
    - [Install Rossete](#install-rossete)
    - [Install Homebrew](#install-homebrew)
    - [Setup Github](#setup-github)
    - [Install Github CLI](#install-github-cli)
    - [Setting Github SSH Key](#setting-github-ssh-key)
    - [Add SSH config](#add-ssh-config)
    - [Start ssh-agent](#start-ssh-agent)
    - [Check Connection Github SSH](#check-connection-github-ssh)
    - [Clone dotfile](#clone-dotfile)
    - [Install mask](#install-mask)
  - [Usage](#usage)
  - [Index](#index)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# dotfiles

my dotfiles

## Installration

### Install XCode Commandline Tool

```
xcode-select --install
```

### Disable Gatekeeper

```bash
sudo spctl --master-disable
```

### Install Rossete

```bash
softwareupdate --install-rosetta
```

### Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Setup Github

your github account login.

```bash
open -a Safari "https://github.com"
```

### Install Github CLI

```bash
brew install gh
# Create SSH key & Github Auth
gh auth login
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

### Setting Github SSH Key

```bash
mv ~/.ssh/id_ed25519 ~/.ssh/`whoami`.github.id_ed25519
mv ~/.ssh/id_ed25519.pub ~/.ssh/`whoami`.github.id_ed25519.pub
```

### Add SSH config

```bash
cat <<EOF > ~/.ssh/config
Host github.com
  HostName github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/private.github.id_ed25519
EOF
```

### Start ssh-agent

```bash
eval "$(ssh-agent -s)"
```

### Check Connection Github SSH

```bash
ssh -T git@github.com
```

### Clone dotfile

```
git clone git@github.com:ryurock/dotfiles.git
```

### Install mask

[Github jakedeichert/mask](https://github.com/jakedeichert/mask)

```bash
brew install mask
```

## Usage

Change dir Your OS and OS Version

```
macos
└── m1
    └── monterey
        ├── README.md
        └── maskfile.md
```

change dir.

```
cd /macos/m1/monterey
```

help

```
mask help
```

## Index

* [Apple sillicon macOS Monterey dotfiles](macos/m1/monterey/)