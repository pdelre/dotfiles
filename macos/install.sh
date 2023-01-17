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

# Make Hidden Application Icons Translucent in the Dock
# https://osxdaily.com/2010/06/22/make-hidden-application-icons-translucent-in-the-dock/
defaults write com.apple.dock showhidden -bool YES; killall -HUP Dock

# View hidden files in Finder
# https://apple.stackexchange.com/a/58714
defaults write com.apple.Finder AppleShowAllFiles -bool YES; killall -HUP Finder

# PC Keybindings
# https://apple.stackexchange.com/questions/16135/remap-home-and-end-to-beginning-and-end-of-line
# https://www.iexplain.org/remap-home-and-end-buttons-for-external-keyboard-on-mac/
# Reboot needed for full expected working state
echo "Setting up PC KeyBindings"
mkdir -p ~/Library/KeyBindings
cp "$(dirname $0)"/pc-keybindings.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

# Remove User Photo
# https://www.maketecheasier.com/remove-account-picture-mac/
dscl . delete /Users/$(whoami) jpegphoto
