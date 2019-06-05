# PDR local changes
# ansi colors
# 008 - bright black   - p9k grey
# 009 - bright red     - p9k maroon
# 010 - bright green   - p9k lime
# 011 - bright yellow  - p9k olive
# 012 - bright blue    - p9k navy
# 013 - bright magenta - p9k fuchsia
# 014 - bright cyan    - p9k aqua
# 015 - bright white   - p9k silver

typeset -ga POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir vcs)

local p='$'
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?.%F{002}${p}%f.%F{009}${p}%f) "

typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='navy'
typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=none
# typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='[%n@%m]'

typeset -g POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='aqua'
typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER}_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND

typeset -g POWERLEVEL9K_VCS_GIT_ICON=$'\uf418 ' #nf-oct-git_branch
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='fuchsia'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
typeset -g POWERLEVEL9K_VCS_STASH_ICON=$'\uf487 ' #nf-oct-package
typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\ufc94 '  #nf-mdi-arrow_expand_down
typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\ufc97 ' #nf-mdi-arrow_expand_up

# typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# typeset -g POWERLEVEL9K_SHORTEN_STRATEGY='truncate_middle'
