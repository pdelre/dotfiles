# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
completion='$(brew --prefix)/share/zsh/site-functions/_git'

if test -f $completion
then
  source $completion
fi

# git aliases autocompletion
function _git_lgbh() { _git_log }
function _git_lgb() { _git_log }
function _git_lgc() { _git_log }
function _git_lg() { _git_log }
function _git_lgh() { _git_log }
function _git_lgd() { _git_log }

function _git_pr_create() { _git_branch }
