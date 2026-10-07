#!/bin/bash

export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_ENV_FILTERING=1
export BAT_THEME=gruvbox-dark BAT_STYLE=plain
export CAPSH="$(hostname | sed 's/^\(....\).*/\1/' | tr a-z A-Z)"

yellow="\001$(tput bold ; tput setaf 3)\002"
blue="\001$(tput bold ; tput setaf 4)\002"
green="\001$(tput bold ; tput setaf 2)\002"
dim="\001$(tput dim)\002"
reset="\001$(tput sgr0)\002"

unset PROMPT_COMMAND

function title() {
    echo -ne "\033]0;$1\007";
}
function gc() {
    git commit -m $(date +%s);
};
function branches() {
    git show --format='%C(auto)%D %s' -s $(git for-each-ref --sort=committerdate --format='%(refname:short)' refs/heads/ | grep -v '^\(master\|main\)$')
}
function grp() {
    br=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ ! -z "$br" ]]; then
        echo " [$br] "
    fi
}
export PS1="$yellow$CAPSH$reset:$blue\w${green}\$(grp)$reset\$ "

if [ "$(type -t hx)" == "file" ]; then
    export EDITOR=hx
    export VISUAL=hx
    alias vi=hx
    alias vim=hx
fi

if [ "$(type -t bat)" == "file" ]; then
    alias cat=bat
fi

if [ "$(type -t batcat)" == "file" ]; then
    alias cat=batcat
fi

if [ "$(type -t doas)" == "file" ]; then
    # musl memory
    alias sudo=doas
fi

if [ "$(type -t zoxide)" == "file" ]; then
    eval "$(zoxide init bash)" || true
fi

if [ "$(type -t gls)" == "file" ]; then
    alias ls="gls -F --color=auto"
else
    alias ls="ls -F --color=auto"
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK=$(echo ~/.ssh/agent/*.agent.*)
fi

[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f /usr/share/bash/plugins/fzf/fzf.plugin.sh ] && source /usr/share/bash/plugins/fzf/fzf.plugin.sh
[ -d /usr/gnu/bin ] && export PATH="/usr/gnu/bin:$PATH"
[ -f ~/.cargo/env ] && source ~/.cargo/env
[ -d ~/.local/bin ] && export PATH="~/.local/bin:$PATH"
[ -d ~/Bin ] && export PATH="~/Bin:$PATH"
[ -f ~/.lscolors ] && source ~/.lscolors
[ -f ~/.localbash ] && source ~/.localbash
