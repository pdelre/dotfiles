#!/usr/bin/env zsh

local ls_opts='--color --group-directories-first'

if $(gls &>/dev/null); then
  local bin=$(which gls)
else
  local bin=$(which ls)
fi

alias ls="${bin} ${ls_opts} -F"
alias ll="${bin} ${ls_opts} -alh"
