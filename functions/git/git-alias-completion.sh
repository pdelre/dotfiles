#!/bin/sh

_git_lgbh() {
 _git_log  # reuse that of git log
}

_git_branch-archive() {
 _git_branch
}

_git_mr-ready() {
 _git_branch
}

_git_mr-create() {
 _git_branch
}
