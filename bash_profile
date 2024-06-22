#!/bin/bash

export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_ENV_FILTERING=1
export BAT_THEME=1337 BAT_STYLE=plain
export CAPSH="$(hostname | cut -d. -f 1)"
export PS1='\[\033[01;33m\]$CAPSH\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PYENV_ROOT="$HOME/.pyenv"
unset PROMPT_COMMAND

function title() {
    echo -ne "\033]0; $1\007";
}
function gc() {
    git commit -m $(date +%s);
};
function branches() {
    git show --format='%C(auto)%D %s' -s $(git for-each-ref --sort=committerdate --format='%(refname:short)' refs/heads/ | grep -v '^\(master\|main\)$')
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

[ -f ~/.cargo.env ] && source ~/.cargo.env
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"
which -s pyenv && eval "$(pyenv init -)"

[ -d "/usr/gnu/bin" ] && export PATH="/usr/gnu/bin:$PATH"
[ -d "~/.local/bin" ] && export PATH="~/.local/bin:$PATH"
[ -d "~/Bin" ] && export PATH="~/Bin:$PATH"

[ -f ~/.lscolors ] && source ~/.lscolors
