# https://www.reddit.com/r/zsh/comments/eblqvq/del_pgup_and_pgdown_input_in_terminal/fb7337q/
# If NumLock is off, translate keys to make them appear the same as with NumLock on.
bindkey -s '^[OM' '^M'  # enter
bindkey -s '^[Ok' '+'
bindkey -s '^[Om' '-'
bindkey -s '^[Oj' '*'
bindkey -s '^[Oo' '/'
bindkey -s '^[OX' '='

# If someone switches our terminal to application mode (smkx), translate keys to make
# them appear the same as in raw mode (rmkx).
bindkey -s '^[OH' '^[[H'  # home
bindkey -s '^[OF' '^[[F'  # end
bindkey -s '^[OA' '^[[A'  # up
bindkey -s '^[OB' '^[[B'  # down
bindkey -s '^[OD' '^[[D'  # left
bindkey -s '^[OC' '^[[C'  # right

# TTY sends different key codes. Translate them to regular.
bindkey -s '^[[1~' '^[[H'  # home
bindkey -s '^[[4~' '^[[F'  # end

# Bind Home, End and a bunch of other standard things
bindkey '^?'      backward-delete-char          # bs         delete one char backward
bindkey '^[[3~'   delete-char                   # delete     delete one char forward
bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
bindkey '^[[F'    end-of-line                   # end        go to the end of line
bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
bindkey '^[[3;5~' kill-word                     # ctrl+del   delete next word
bindkey '^J'      backward-kill-line            # ctrl+j     delete everything before cursor
bindkey '^[[D'    backward-char                 # left       move cursor one char backward
bindkey '^[[C'    forward-char                  # right      move cursor one char forward
bindkey '^[[A'    up-line-or-beginning-search   # up         prev command in history
bindkey '^[[B'    down-line-or-beginning-search # down       next command in history

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
