# Tasks macOS

Tasks related to macOS settings

macOSの設定に関するタスク

# Usage

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## disable-gatekeeper

> Unblock third-party applications on your Mac

![macOS-10-13-High-Sierra-New-Features-Secure_Kernel_Extension_Loading-img-2](https://user-images.githubusercontent.com/1619084/148622932-4dc42786-85ad-4323-bcda-6044c7351aee.jpg)

```
mask disable-gatekeeper
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

## modify-defaults

> Add settings to make your mac easier to use

```
mask modify-defaults
```

**Scripts**
```bash
# キーリピートを限界まで早くする
defaults write -g InitialKeyRepeat -int 13
defaults write -g KeyRepeat -int 1
# .DS_Storeが作られないようにする
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# タップでクリックできるようにしています。
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
# カーソルの速さを早くする
defaults write -g com.apple.trackpad.scaling -float 7
# 隠しファイルを可視化しています。
defaults write com.apple.finder AppleShowAllFiles true
# 拡張子も可視化しています。
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock autohide-delay -float 0
```