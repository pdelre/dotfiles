#!/usr/bin/env zsh

if test ! "$(uname)" = "Darwin"
  then
  return
fi

# TODO: look into /usr/local/opt/coreutils/libexec/gnubin
#alias du='/usr/local/bin/gdu'
#alias date='/usr/local/bin/gdate'
#alias df='/usr/local/bin/gdf'
#alias echo='/usr/local/bin/gecho'
#alias touch='/usr/local/bin/gtouch'

# TODO: look into /usr/local/opt/gnu-tar/libexec/gnubin
#alias tar='/usr/local/bin/gtar'

# GNU
#alias xargs='/usr/local/bin/gxargs'
#alias sed='/usr/local/bin/gsed'

# Brew
alias brew-cask-outdated='brew cask list | xargs brew cask info | grep -B3 "Not installed"'
