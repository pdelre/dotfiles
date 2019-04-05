# PDR local changes

typeset -ga POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir vcs)

local p='$'
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?.%F{002}${p}%f.%F{009}${p}%f) "

typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%k[%n@%m] '

typeset -g POWERLEVEL9K_VCS_GIT_ICON=$'\uf418 ' #nf-oct-git_branch
