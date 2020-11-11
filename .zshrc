# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/onejae/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh
export NVM_DIR="/home/onejae/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH=/mnt/c/Program\ Files/MongoDB/Server/4.2/bin/:/home/onejae/.local/bin/:$PATH
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'


[[ -s "/home/onejae/.gvm/scripts/gvm" ]] && source "/home/onejae/.gvm/scripts/gvm"

# alias tmux="TERM=screen-256color-bce tmux"

n() {
    if [ -n $NNNLVL  ] && [ "${NNNLVL:-0}" -ge 1  ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"


    nnn "$@"

    if [ -f "$NNN_TMPFILE"  ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# fzf
fd() {
    local dir
    dir=$(find ${1:-/} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
}

