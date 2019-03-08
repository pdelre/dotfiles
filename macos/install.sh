#!/bin/sh
#
# Homebrew installs

if test ! "$(uname)" = "Darwin"
  then
  return
fi

echo "Installing Brew Bundle"
brew bundle install --global
