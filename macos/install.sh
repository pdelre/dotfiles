#!/bin/sh
#
# Homebrew installs

if test ! "$(uname)" = "Darwin"
  then
  return
fi

echo "Installing Brew Bundle"
brew bundle install --global

# Disable dark mode on Chrome for Mojave
# https://webtrickz.com/disable-chrome-dark-mode-mac/
defaults write com.google.Chrome NSRequiresAquaSystemAppearance -bool YES
