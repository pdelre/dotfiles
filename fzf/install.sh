#!/bin/sh
#
# @see https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
#

if test ! $(which brew)
then
  exit 0
fi

# PDR: not sure if this is needed with brew given I'm only using --bin and keeping the config in dotfiles
$(brew --prefix)/opt/fzf/install --bin
