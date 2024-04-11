# install path
if test "$(uname)" = "Darwin"
then
  local fzf_path=/usr/local/opt/fzf
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
  local fzf_path=/home/linuxbrew/.linuxbrew/opt/fzf
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == *${fzf_path}/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${fzf_path}/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${fzf_path}/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${fzf_path}/shell/key-bindings.zsh"
