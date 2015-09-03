BREW_PKGS = caskroom/cask/brew-cask glib wget tree gnu-sed curl sl cmake jq realpath
BREW_TAPS = iveney/mocha
CASK_PKGS = google-chrome firefox lastpass iterm2 evernote skitch slack dash bettertouchtool cheatsheet vagrant virtualbox dropbox google-drive flux alfred skype
PHP_PKGS = php56 php56-mcrypt php56-msgpack php56-opcache php56-xdebug php56-xhprof
PYTHON_PKGS = python python3
RC_FILES = .bashrc .bash_profile .vimrc .ideavimrc .zshrc .gitignore .gitconfig .gvimrc
ZSH_BIN = $(shell which zsh)

.PHONY: install intellij_idea $(BREW_PKGS) $(RC_FILES)

install: $(BREW_PKGS) $(CASK_PKGS) zsh vim intellij_idea php56 nodejs $(RC_FILES)

$(BREW_PKGS): $(BREW_TAPS)
	brew install $@

$(BREW_TAPS):
	brew tap $@

$(CASK_PKGS):
	brew cask install $@
	brew cask alfred link

update:
	brew update
	brew cask update

cleanup:
	brew cleanup
	brew cask cleanup

zsh:
	brew install zsh
	echo $$SHELL |grep -p zsh ||chsh -s $(ZSH_BIN)
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh	

intellij_idea:
	brew cask install caskroom/homebrew-versions/java6
	brew cask install intellij-idea

php56:
	brew tap homebrew/php
	brew tap homebrew/dupes
	brew install $(PHP_PKGS)

python:
	brew tap homebrew/python
	brew install $(PYTHON_PKGS)

nodejs:
	brew install nodebrew
	nodebrew ls | grep -q io@v2.0.2 || nodebrew install-binary io@v2.0.2
	nodebrew use io@v2.0.2

vim:
	brew cask install macvim-kaoriya
	test -d ~/.vim || ln -sv $(CURDIR)/.vim ~/
	test -d ~/.vim/bundle/ || curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

$(RC_FILES):
	test -h ~/.$@ || ln -s $(CURDIR)/$@ ~/

git:
	cp gitsecret.example ~/.gitsecret
	@echo please edit ~/.gitsecret
