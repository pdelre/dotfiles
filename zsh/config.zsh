export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
# remove `/` & `=` from WORDCHARS
export WORDCHARS=${WORDCHARS//[\/=]/}

export TIMEFMT='%J [%P cpu]  [%U user | %S system | %*E real]'

# see https://www.reddit.com/r/zsh/comments/er6fok/getting_sign_in_output/ff2im4f/
export PROMPT_EOL_MARK='%K{red} %K{default}'

fpath=($DOTFILES_ROOT/functions $fpath)

autoload -U $DOTFILES_ROOT/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt COMPLETE_ALIASES
