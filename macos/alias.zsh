#!/usr/bin/env zsh

if test ! "$(uname)" = "Darwin"
  then
  return
fi

# GNU
alias du='/usr/local/bin/gdu'
alias xargs='/usr/local/bin/gxargs'
alias date='/usr/local/bin/gdate'
alias sed='/usr/local/bin/gsed'
alias df='/usr/local/bin/gdf'
alias echo='/usr/local/bin/gecho'
alias tar='/usr/local/bin/gtar'
alias touch='/usr/local/bin/gtouch'
alias ls="${LS_BIN}"

# Brew
alias brew-cask-outdated='brew cask list | xargs brew cask info | grep -B3 "Not installed"'
