#!/usr/bin/env zsh

if test ! "$(uname)" = "Darwin"
  then
  return
fi

export LS_BIN=/usr/local/bin/gls

# Add php path
# local php_path=$(brew --prefix 'php@7.4')
# local php_path='/usr/local/opt/php@8.1'
# local php_path='/usr/local/opt/php@7.4'
# export PATH="${php_path}/bin:$PATH"
# export PATH="${php_path}/sbin:$PATH"

# Add ruby path
# local ruby_path=$(brew --prefix ruby)
local ruby_path='/opt/homebrew/opt/ruby'
export PATH="${ruby_path}/bin:$PATH"

# Add python3 path for `pip3 install --user` packages
# local python3_path='/Users/pdelre/Library/Python/3.9'
# export PATH="${python3_path}/bin:$PATH"

# Add curl path
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

export PATH="/usr/local/bin:/usr/local/sbin:${HOME}/bin:$PATH"
