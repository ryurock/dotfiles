#!/usr/bin/env bash
set -Ceuo pipefail

if ! [ -e ~/.ssh ]; then
    mkdir ~/.ssh;
fi

if ! [ -e ~/.ssh/config ]; then
    touch ~/.ssh/config;
fi

cat <<-EOS
|======================================================================================================================|
|                             [GitHubにSSH鍵を登録します]                                                              |
| Githubに設定するSSHの秘密鍵ファイル[id_rsa]ファイル名を入力してください                                              |
|           例) yourmailaddress_github.id_rsa                                                                          |
|                                                                                                                      |
|                                                                                                                      |
| まだGithubのSSH鍵登録が終わっていない方はこのshellを終了して                                                         |
| ssh-keygen -t rsa -C "あなたのメールアドレス" -f "$HOME/.ssh/{Githubに登録するSSH鍵ファイル名}"      |
| を実行してください                                                                                                   |
| -fオプションは何も気にしなければid_rsaが一般的な名称です                                                             |
|======================================================================================================================|
EOS

read id_rsa_name;
if [ "${id_rsa_name}" = "" ]; then
    echo "秘密鍵ファイル名が入力されていない為終了します";
    exit 1;
fi

if ! [ -e $HOME/.ssh/$id_rsa_name ]; then
    echo "$HOME/.ssh/${id_rsa_name}が存在しません";
    exit 1;
fi

chmod 600 "$HOME/.ssh/${id_rsa_name}"
# 設定するとなぜか~/.sshのパーミッションがおかしくなるので再度パーミッションを変更
chmod 700 ~/.ssh/
if [ $((`cat ~/.ssh/config | grep -c -E ^'Host github.com'$`)) -lt 1 ]; then
    cat <<-EOS
Host github.com
  HostName github.com
  User git
  IdentityFile $HOME/.ssh/$id_rsa_name
  ForwardAgent yes
EOS >> ~/.ssh/config
fi

# github 通信チェック
echo "|===========================================================================================================|";
echo "|                                                                                                           |";
echo "| github.comのssh 接続確認を行います Hi {your account name}! You've successfully と表示されていれば成功です |";
echo "|                                                                                                           |";
echo "|===========================================================================================================|";
ssh -T github.com || true