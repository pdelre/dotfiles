#!/usr/bin/env zsh

if test ! "$(uname)" = "Darwin"
  then
  return
fi

export LS_BIN=/usr/local/bin/gls

# Add php path
local php_path=$(brew --prefix 'php@7.2')
export PATH="${php_path}/bin:$PATH"
export PATH="${php_path}/sbin:$PATH"

# Add ruby path
local ruby_path=$(brew --prefix ruby)
export PATH="${ruby_path}/bin:$PATH"
