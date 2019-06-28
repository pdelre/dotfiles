#!/usr/bin/env zsh
# timer=$(($(gdate +%s%N)/1000000))

if test ! "$(uname)" = "Darwin"
  then
  return
fi

export LS_BIN=/usr/local/bin/gls
# now=$(($(gdate +%s%N)/1000000))
# elapsed=$(($now-$timer))
# echo $elapsed": export LS_BIN"

# Add php path
# local php_path=$(brew --prefix 'php@7.2')
local php_path='/usr/local/opt/php@7.2'
export PATH="${php_path}/bin:$PATH"
export PATH="${php_path}/sbin:$PATH"
# now=$(($(gdate +%s%N)/1000000))
# elapsed=$(($now-$timer))
# echo $elapsed": php@7.2"

# Add ruby path
# local ruby_path=$(brew --prefix ruby)
local ruby_path='/usr/local/opt/ruby'
export PATH="${ruby_path}/bin:$PATH"
# now=$(($(gdate +%s%N)/1000000))
# elapsed=$(($now-$timer))
# echo $elapsed": ruby"

export PATH="/usr/local/bin:/usr/local/sbin:${HOME}/bin:$PATH"
