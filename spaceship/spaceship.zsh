#!/usr/bin/env zsh

# Spaceship
SPACESHIP_PROMPT_ORDER=(
  exit_code     # Exit code section
#  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
#  hg            # Mercurial section (hg_branch  + hg_status)
#  package       # Package version
#  node          # Node.js section
#  ruby          # Ruby section
#  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
#  golang        # Go section
#  php           # PHP section
#  rust          # Rust section
#  haskell       # Haskell Stack section
#  julia         # Julia section
#  docker        # Docker section
#  aws           # Amazon Web Services section
#  venv          # virtualenv section
#  conda         # conda virtualenv section
#  pyenv         # Pyenv section
#  dotnet        # .NET section
#  ember         # Ember.js section
#  kubecontext   # Kubectl context section
#  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
#  battery       # Battery level and status
#  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  char          # Prompt character
)

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_CHAR_SYMBOL='$ '

SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR=blue
SPACESHIP_USER_PREFIX='['
SPACESHIP_USER_SUFFIX=''

SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX='%{%B%F{blue}%}@%{%b%f%}'
SPACESHIP_HOST_SUFFIX='] '

SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SUFFIX=$'\n\n'
