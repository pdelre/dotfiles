#!/bin/sh
#
# Homebrew installs

if test ! "$(uname)" = "Darwin"
  then
  return
fi

# echo "Installing Brew Bundle"
# brew bundle install --global

# Disable dark mode on Chrome for Mojave
# https://webtrickz.com/disable-chrome-dark-mode-mac/
defaults write com.google.Chrome NSRequiresAquaSystemAppearance -bool YES

# Configure General
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
# Use LCD font smoothing when available
defaults write NSGlobalDomain "AppleFontSmoothing" -int "1"
# Always show scrollbars
defaults write NSGlobalDomain "AppleShowScrollBars" -string "Always"
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool "true"
# Don't resume same files whe re-opening an app
defaults write com.apple.systempreferences "NSQuitAlwaysKeepsWindows" -bool "false"

# Configure Dock Settings
# More: https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# More: https://github.com/kevinSuttle/macOS-Defaults
# Wipe all (default) app icons from the Dock
# defaults write com.apple.dock "persistent-apps" -array
# https://macos-defaults.com/dock/orientation.html
defaults write com.apple.dock "orientation" -string "bottom"
# https://macos-defaults.com/dock/tilesize.html
defaults write com.apple.dock "tilesize" -int "36"
# https://macos-defaults.com/dock/autohide.html
defaults write com.apple.dock "autohide" -bool "false"
# https://macos-defaults.com/dock/show-recents.html
defaults write com.apple.dock "show-recents" -bool "false"
# https://macos-defaults.com/dock/static-only.html
defaults write com.apple.dock "static-only" -bool "false"
# https://macos-defaults.com/dock/mineffect.html
defaults write com.apple.dock "mineffect" -string "scale"
# Make Dock icons of hidden applications translucent
# https://osxdaily.com/2010/06/22/make-hidden-application-icons-translucent-in-the-dock/
defaults write com.apple.dock "showhidden" -bool "true"
# Minimize windows into their application’s icon
defaults write com.apple.dock "minimize-to-application" -bool "true"
# Hot corners
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos#L436
defaults write com.apple.dock "wvous-br-corner" -int 5
defaults write com.apple.dock "wvous-br-modifier" -int 0
killall -HUP Dock

# Configure Finder
# https://macos-defaults.com/finder/appleshowallextensions.html
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
# https://macos-defaults.com/finder/appleshowallfiles.html
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
# https://macos-defaults.com/finder/showpathbar.html
defaults write com.apple.finder "ShowPathbar" -bool "true"
# https://macos-defaults.com/finder/fxpreferredviewstyle.html
# List view
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
# https://macos-defaults.com/finder/_fxsortfoldersfirst.html
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
# https://macos-defaults.com/finder/fxdefaultsearchscope.html
# Search the current folder
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
# https://macos-defaults.com/finder/fxenableextensionchangewarning.html
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
# https://macos-defaults.com/finder/nsdocumentsavenewdocumentstocloud.html
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
# https://macos-defaults.com/finder/showwindowtitlebaricons.html
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true"
# https://macos-defaults.com/finder/nstableviewdefaultsizemode.html
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "2"
# Display full POSIX path as Finder window title
defaults write com.apple.finder "_FXShowPosixPathInTitle" -bool "true"
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "true"
defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool "true"
killall Finder

# Configure Desktop
# https://macos-defaults.com/desktop/_fxsortfoldersfirstondesktop.html
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"
# https://macos-defaults.com/desktop/createdesktop.html
defaults write com.apple.finder "CreateDesktop" -bool "true"
# https://macos-defaults.com/desktop/showharddrivesondesktop.html
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
# https://macos-defaults.com/desktop/showexternalharddrivesondesktop.html
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "false"
# https://macos-defaults.com/desktop/showremovablemediaondesktop.html
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"
# https://macos-defaults.com/desktop/showmountedserversondesktop.html
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false"
killall Finder

# Configure Menu Bar
# https://macos-defaults.com/menubar/flashdateseparators.html
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "false"
# https://macos-defaults.com/menubar/dateformat.html
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM H:mm\""
killall SystemUIServer

# Configure Mission Control
# https://macos-defaults.com/mission-control/mru-spaces.html
defaults write com.apple.dock "mru-spaces" -bool "false"
# https://macos-defaults.com/mission-control/expose-group-apps.html
defaults write com.apple.dock "expose-group-apps" -bool "false"
# https://macos-defaults.com/mission-control/applespacesswitchonactivate.html
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool "true"
# https://macos-defaults.com/mission-control/spans-displays.html
defaults write com.apple.spaces "spans-displays" -bool "false"
killall Dock
killall SystemUIServer

# Configure Activity Monitor
# https://macos-defaults.com/activity-monitor/updateperiod.html
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "2"
# https://macos-defaults.com/activity-monitor/icontype.html
defaults write com.apple.ActivityMonitor "IconType" -int "6"
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor "OpenMainWindow" -bool "true"
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor "ShowCategory" -int "0"
# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor "SortColumn" -string "CPUUsage"
defaults write com.apple.ActivityMonitor "SortDirection" -int "0"
killall Activity\ Monitor

# Configure Screenshots
# https://macos-defaults.com/screenshots/disable-shadow.html
defaults write com.apple.screencapture "disable-shadow" -bool "true"
# https://macos-defaults.com/screenshots/include-date.html
defaults write com.apple.screencapture "include-date" -bool "true"
# https://macos-defaults.com/screenshots/location.html
defaults write com.apple.screencapture "location" -string "~/Downloads"
# https://macos-defaults.com/screenshots/show-thumbnail.html
defaults write com.apple.screencapture "show-thumbnail" -bool "true"
# https://macos-defaults.com/screenshots/type.html
defaults write com.apple.screencapture "type" -string "png"
killall SystemUIServer

# Configure Mouse
# https://macos-defaults.com/mouse/linear.html
# (Requires restart)
defaults write NSGlobalDomain com.apple.mouse.linear -bool "true"
# https://macos-defaults.com/mouse/scaling.html
# TODO: Get value with `defaults read NSGlobalDomain com.apple.mouse.scaling`
# defaults write NSGlobalDomain com.apple.mouse.scaling -float "1"
# https://macos-defaults.com/mouse/focusfollowsmouse.html
defaults write com.apple.Terminal "FocusFollowsMouse" -bool "false" && killall Terminal

# Configure Touchpad
# https://macos-defaults.com/trackpad/firstclickthreshold.html
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "1"
# enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool "true"
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int "1"
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int "1"

# Configure Keyboard
# (Requires restart)
# https://macos-defaults.com/keyboard/applepressandholdenabled.html
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "true"
# https://macos-defaults.com/keyboard/applefnusagetype.html
# Opens the Character Viewer for entering emoji, symbols, and more.
defaults write com.apple.HIToolbox AppleFnUsageType -int "2"
# https://macos-defaults.com/keyboard/applekeyboardfnstate.html
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool "true"

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
