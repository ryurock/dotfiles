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
gh auth login —web
# Please Enter Code Jump to
open https://github.com/login/device

```

### Setting Github SSH Key

```bash
echo "Give it any name you like for SSHkey on github. For example, your company name or your account name."
read name && \
mv ~/.ssh/id_ed25519 $name.github.id_ed25519 && \
mv ~/.ssh/id_ed25519.pub $name.github.id_ed25519.pub && \
ls -al ~/.ssh/$name.github.id_*
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
brew install
```

## Usage

Change dir Your OS and OS Version

```
maskfiles
└── mac
    └── m1
        └── monterey
            └── maskfile.md
```

change dir.

```
cd maskfiles/mac/m1/monterey
```

help

```
mask help
```

Install all

```
mask install
```

