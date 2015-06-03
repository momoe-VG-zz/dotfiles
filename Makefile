BREW_PKGS = glib wget tree gnu-sed curl sl cmake

.PHONY: install intellij_idea

install: intellij_idea $(BREW_PKGS)

intellij_idea:
	brew cask install caskroom/homebrew-versions/java6
	brew cask install intellij-idea

$(BREW_PKGS):
	brew install $@

