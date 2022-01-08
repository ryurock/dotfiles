# Tasks GitHub

Tasks related to GitHub

GitHubの設定に関するタスク

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [login](#login)
- [install-github-cli](#install-github-cli)
- [register-ssh-key](#register-ssh-key)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## login

> github login

```
mask login
```

**Scripts**
```bash
echo "|======================================================================|"
echo "|                                                                      |"
echo "|                      Please Login to GitHub                          |"
echo "|                                                                      |"
echo "|======================================================================|"
[[ `uname` == "Darwin" ]] && open "https://github.com/login"
[[ `uname` == "Linux" ]] && gnome-open "https://github.com/login"
```

## install-github-cli

> Install github cli

[GitHub CLI](https://cli.github.com)

```
mask github install-github-cli
```

**Scripts**
```bash
brew install gh
```

## register-ssh-key

> Register SSH key on github

```
mask register-ssh-key
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
mask ssh init
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
echo "|======================================================================|"
echo "|             Press Enter when the settings are complete               |"
echo "|======================================================================|"
read

# Add ssh-agent
eval "$(ssh-agent -s)"

# Check Connection Github SSH
ssh -T git@github.com
```
