# https://github.com/agkozak/zsh-z#settings
ZSHZ_TILDE=1
ZSHZ_TRAILING_SLASH=1

# https://github.com/agkozak/zsh-z#complete_aliases
compdef _zshz ${ZSHZ_CMD:-${_Z_CMD:-z}}
