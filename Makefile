BREW_PKGS = glib wget tree gnu-sed curl sl cmake jq
PHP_PKGS = php56 php56-mcrypt php56-msgpack php56-opcache php56-xdebug php56-xhprof
RC_FILES = .bashrc .bash_profile .vimrc .ideavimrc

.PHONY: install intellij_idea $(BREW_PKGS) $(RC_FILES)

install: intellij_idea $(BREW_PKGS) nodejs cheatsheet $(PHP_PKGS)

intellij_idea:
	brew cask install caskroom/homebrew-versions/java6
	brew cask install intellij-idea

$(PHP_PKGS):
	brew tap homebrew/php
	brew tap homebrew/dupes
	brew install $(PHP_PKGS)

nodejs:
	brew install nodebrew
	nodebrew ls | grep -q io@v2.0.2 || nodebrew install-binary io@v2.0.2
	nodebrew use io@v2.0.2

cheatsheet:
	brew cask install cheatsheet

$(RC_FILES):
	test -h ~/.$@ || ln -s $(CURDIR)/$@ ~/

$(BREW_PKGS):
	brew install $@

