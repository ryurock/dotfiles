.PHONY: help
help: ## make taskの説明を表示する
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## 初期セットアップを実行する
	make check-target-os
	make modify-mac-defaults
	make install-xcode-commandline-tools
	make configure-xcode
	make configure-git
	make disable-gatekeeper
	make add-zshrc
	make install-homebrew
	make install-apps-for-brew
	make bundle-brewfile
	make install-prezto
	make change-brew-zsh
	make configure-aws
	make configure-vim
	make configure-python-version-manager
	make configure-nodejs-version-manager
	make configure-ruby-version-manager
	make add-programing-fonts
	make configure-vscode
	make configure-avg-antivirus

.PHONY: check-target-os
check-target-os: ## OSの確認をする
	if [ `uname` != "Darwin" ]; then\
	    echo "[Failed] this installer OSX only.";\
	    exit 1;\
	fi

.PHONY: install-xcode-commandline-tools
install-xcode-commandline-tools: ## xcode-commandline-toolsをインストールする
	xcode-select --install || true

.PHONY: configure-xcode
configure-xcode: ## XCodeの初期設定
	defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
	export core_num=`system_profiler SPHardwareDataType | grep 'Total Number of Cores:' | awk '{print $$5}'` && \
	defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks $$core_num

.PHONY: disable-gatekeeper
disable-gatekeeper: ## MacのGateKeeperをOFF
	@echo "|======================================================================|"
	@echo "|    MacのGateKeeperをOFFにします。これはサードパーティ製品で          |"
	@echo "|    AppStoreに登録されていないアプリを許可するために必要です          |"
	@echo "|    sudo権限が必要なのでpasswordを入力してください                    |"
	@echo "|======================================================================|"
	sudo spctl --master-disable

.PHONY: add-zshrc
add-zshrc: ## zshrcを追加する
	cp .zsh/.zshrc $(HOME)/.zshrc

.PHONY: install-homebrew
install-homebrew: ## HomeBrewのインストール
	if [ ! -e /usr/local/bin/brew ]; then\
	    ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";\
	    command_ver=$$(brew --version);\
	    command=$$(which brew);\
	    brew doctor;\
	    echo "[Install] installed Homebrew. path : ${command} version : ${command_ver}";\
	else\
	    echo "[Install] Already exists dependency Homebrew";\
	fi

.PHONY: install-apps-for-brew
install-apps-for-brew: ## apps install for HomeBrew
	brew install \
	'git' \
	'coreutils' \
	'awscli' \
	'zsh' \
	'm-cli' \
	'mas' \
	'tree' \
	'nkf' \
	'nmap' \
	'wget' \
	'peco' \
	'pyenv' \
	'readline' \
	'jq' \
	'rbenv' \
	'docker-compose' \
	'docker-completion' \
	'autoconf' \
	'automake' \
	'freetype' \
	'pkg-config' \
	'libyaml' \
	'libssh' \
	'direnv' || true

	brew cask install 'google-japanese-ime' \
	'google-chrome' \
	'iterm2' \
	'karabiner-elements' \
	'coteditor' \
	'docker' \
	'skitch' \
	'slack' \
	'visual-studio-code' \
	'appcleaner' \
	'spectacle' \
	'google-cloud-sdk' \
	'avg-antivirus' \
	'ngrok' \
	'dropbox' \
	'Kindle' || true

# optional このディレクトリにBrewfileを配置していると自動的に追加でインストールしてくれる
.PHONY: bundle-brewfile
bundle-brewfile:
	if [  -e $(CURDIR)/Brewfile ]; then\
		brew bundle;\
	fi

.PHONY: install-prezto
install-prezto: ## zsh framework preztoをinstallする
	if [ ! -e $(HOME)/.zprezto ]; then\
		git clone --recursive https://github.com/sorin-ionescu/prezto.git $(HOME)/.zprezto;\
		ln -s $(HOME)/.zprezto/runcoms/zlogin $(HOME)/.zlogin;\
		ln -s $(HOME)/.zprezto/runcoms/zlogout $(HOME)/.zlogout;\
		ln -s $(HOME)/.zprezto/runcoms/zpreztorc $(HOME)/.zpreztorc;\
		ln -s $(HOME)/.zprezto/runcoms/zprofile $(HOME)/.zprofile;\
		ln -s $(HOME)/.zprezto/runcoms/zshenv $(HOME)/.zshenv;\
	fi
	cp .zsh/prezto/.zpreztorc $(HOME)/.zpreztorc;\

.PHONY: change-brew-zsh
change-brew-zsh: ## HomeBrewのzshをShell設定できるように変更する
	if [ `cat /etc/shells | grep -c '/usr/local/bin/zsh'` -eq 0 ]; then\
		sudo cp etc/shells /etc/shells;\
		chsh -s /usr/local/bin/zsh;\
	fi

.PHONY: modify-mac-defaults
modify-mac-defaults: ## macの内部設定を変更します
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
	defaults write com.apple.dock autohide-delay -float 0

.PHONY: configure-vim
configure-vim: ## vimの設定
	mkdir -p $(HOME)/.cache;\
	mkdir -p $(HOME)/.config/nvim;\
	mkdir -p $(HOME)/.vim/colors;\

	if [ ! -e $(HOME)/.cache/dein ]; then\
		curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $(HOME)/Downloads/installer.sh;\
		sh $(HOME)/Downloads/installer.sh ~/.cache/dein;\
	fi\

	if [ ! -e $(HOME)/.vim/colors/hybrid.vim ]; then\
		curl https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim > $(HOME)/.vim/colors/hybrid.vim;\
	fi\

	cp .vim/.config/nvim/init.vim $(HOME)/.config/nvim/init.vim
	cp .vim/.config/.dein.toml $(HOME)/.config/.dein.toml
	if [ ! -e $(HOME)/.vimrc ]; then\
		ln -s $(HOME)/.config/nvim/init.vim $(HOME)/.vimrc;\
	fi\

.PHONY: configure-aws
configure-aws: ## awsの設定
	if [ ! -e $(HOME)/.aws ]; then\
		echo "|======================================================================|";\
		echo "|    AWS GUI Consoleにログインして自分のAWS Tokenを設定してください    |";\
		echo "|======================================================================|";\
		aws configure;\
	fi\

.PHONY: configure-git
configure-git: ## gitの設定
	cp .gitconfig $(HOME)/.gitconfig
	read username && git config --global user.name $$username
	read email && git config --global user.email $$email

.PHONY: configure-nodejs-version-manager
configure-nodejs-version-manager: ## Configure NodeJS version Manager
	mkdir $(HOME)/.nvm
	brew install nvm || true
	nvm install v10.18

.PHONY: configure-python-version-manager
configure-python-version-manager: ## Configure Python version Manager
	brew install pyenv pyenv-virtualenv || true
	pyenv install 3.7.5
	pyenv global 3.7.5

.PHONY: configure-ruby-version-manager
configure-ruby-version-manager: ## Configure Ruby version Manager
	rbenv install 2.6.5 -v -s
	rbenv global 2.6.5
	rbenv exec gem install bundler
	rbenv rehash

.PHONY: add-programing-fonts
add-programing-fonts: ## add Programing Fonts for Ricty
	# fonts for https://github.com/edihbrandon/RictyDiminished
	mkdir -p $(HOME)/Downloads/RictyDiminished/
	rm -rf $(HOME)/Downloads/RictyDiminished/*.ttf
	curl -o $(HOME)/Downloads/RictyDiminished/RictyDiminished-Regular.ttf https://raw.githubusercontent.com/edihbrandon/RictyDiminished/master/RictyDiminished-Regular.ttf
	curl -o $(HOME)/Downloads/RictyDiminished/RictyDiminished-Bold.ttf https://raw.githubusercontent.com/edihbrandon/RictyDiminished/master/RictyDiminished-Bold.ttf
	mv $(HOME)/Downloads/RictyDiminished/ /Library/Fonts/

.PHONY: configure-vscode
configure-vscode:
	cp .vscode/keybinding.json $(HOME)/Library/Application\ Support/Code/User/
	cp .vscode/settings.json $(HOME)/Library/Application\ Support/Code/User/
	cat .vscode/VSCodeExtFile | while read line ; do \
		code --install-extension $$line; \
	done;

.PHONY: configure-avg-antivirus
configure-avg-antivirus:
	echo 'AVGAntivirusの設定を変更してください。理由は下記です。'
	open 'https://qiita.com/ryurock/items/7f902554842d14028dee'
