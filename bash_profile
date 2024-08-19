#!/bin/bash

export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_ENV_FILTERING=1
export BAT_THEME=gruvbox-light BAT_STYLE=plain
export CAPSH="$(hostname | sed 's/^\(....\).*/\1/' | tr a-z A-Z)"

yellow="\001$(tput setaf 3)\002"
blue="\001$(tput setaf 4)\002"
green="\001$(tput setaf 2)\002"
dim="\001$(tput dim)\002"
reset="\001$(tput sgr0)\002"

export PS1="$yellow$CAPSH$reset:$blue\w$green\$(grp)$reset\$ "
export PYENV_ROOT="$HOME/.pyenv"
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

if which -s nvim; then
    export EDITOR=nvim
    export VISUAL=nvim
    alias vi=nvim
    alias vim=nvim
else
    export EDITOR=nvim
    export VISUAL=nvim
    alias vi=vim
fi

if which -s bat; then
    alias cat=bat
fi

if which -s batcat; then
    alias cat=batcat
fi

if which -s gls; then
    alias ls="gls -F --color=auto"
else
    alias ls="ls -F --color=auto"
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK=$(echo /tmp/ssh-*/agent.*)
fi

[ -d ~/.vim/plugged/fzf/bin ] && export PATH=~/.vim/plugged/fzf/bin:$PATH
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.vim/plugged/fzf/shell/key-bindings.bash ] && source ~/.vim/plugged/fzf/shell/key-bindings.bash
[ -f ~/.vim/plugged/fzf/shell/completion.bash ] && source ~/.vim/plugged/fzf/shell/completion.bash

[ -f ~/.cargo/env ] && source ~/.cargo/env
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"
which -s pyenv && eval "$(pyenv init -)"

[ -d /usr/gnu/bin ] && export PATH="/usr/gnu/bin:$PATH"
[ -d ~/.local/bin ] && export PATH="~/.local/bin:$PATH"
[ -d ~/Bin ] && export PATH="~/Bin:$PATH"

[ -f ~/.lscolors ] && source ~/.lscolors
