#!/bin/bash -e
# @see http://stackoverflow.com/a/16879922/339535

RED='\033[01;31m'
YELLOW='\033[00;33m'
GREEN='\033[01;32m'
CYAN='\033[01;36m'
NO_COLOR='\033[0m'

current_branch=$(git rev-parse --abbrev-ref HEAD)

onexit() {
  git checkout $current_branch
}
trap onexit EXIT

while read branch; do

  if ! (git rev-parse --abbrev-ref $branch@{upstream} &>/dev/null); then
    echo -e "${YELLOW}$branch${NO_COLOR} has ${RED}no valid upstream${NO_COLOR}"
    continue
  fi

  #upstream=$(git rev-parse --abbrev-ref $branch@{upstream} 2>/dev/null || echo '')
  upstream=$(git rev-parse --abbrev-ref $branch@{upstream} 2>/dev/null)

  # skip branches without an upstream
  if [ -z $upstream ]; then
    echo -e "${YELLOW}$branch${NO_COLOR} has no upstream configured"
    continue
  fi

  # skip train branches
  if [[ $branch == train* ]]; then
    echo -e "${YELLOW}$branch${NO_COLOR} is on a train"
    continue
  fi

  # skip branches tracking remote upstreams
  if git show-ref -q --verify refs/remotes/$upstream; then
    echo -e "${YELLOW}$branch${NO_COLOR} tracks ${RED}$upstream${NO_COLOR}"
    continue
  fi

  # skip branches that are not behind their upstreams
  if [ $(git rev-list --left-only --count $upstream...$branch) -eq 0 ]; then
    echo -e "${YELLOW}$branch${NO_COLOR} not behind ${CYAN}$upstream${NO_COLOR}"
    continue
  fi

  # update branch
  echo -e "${GREEN}$branch${NO_COLOR} behind ${CYAN}$upstream${NO_COLOR}"
  git checkout $branch
  git pull

done < <(git for-each-ref --format='%(refname:short)' 'refs/heads/**')
