source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then

  # specify plugins here

  # generate the init script from plugins above
  zgen save
fi
