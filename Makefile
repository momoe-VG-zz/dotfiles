.PHONY: install intellij_idea

install: intellij_idea

intellij_idea:
	brew cask install caskroom/homebrew-versions/java6
	brew cask install intellij-idea
