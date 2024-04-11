if test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
    export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
fi
