export EDITOR=vim
export VISUAL=vim
export GOPATH=~/go
export GEM_PATH=~/.gem GEM_HOME=~/.gem
export PATH=$PATH:/usr/local/go/bin:~/go/bin:~/.gem/bin

if [ -d /home/linuxbrew/.linuxbrew ]; then
    export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
    export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
    export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
    export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
fi

if [ -a /usr/local/bin/gls ]; then
    alias ls="gls -F --color=auto"
else
    alias ls="ls -F --color=auto"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/opt/fzf/shell/key-bindings.bash ] && source /usr/local/opt/fzf/shell/key-bindings.bash
[ -f /usr/local/opt/fzf/shell/completion.bash ] && source /usr/local/opt/fzf/shell/completion.bash

export CAPSH="$(hostname | cut -d. -f 1 | tr a-z A-Z)"
export PS1='\[\033[01;33m\]$CAPSH\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#export LDFLAGS="-L/home/aaron/.linuxbrew/opt/llvm/lib -Wl,-rpath,/home/aaron/.linuxbrew/opt/llvm/lib"
export HOMEBREW_NO_ENV_FILTERING=1

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
    source ~/.config/exercism/exercism_completion.bash
fi
