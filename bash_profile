export EDITOR=vim
export VISUAL=vim
export GOPATH=~/go
export GEM_PATH=~/.gem GEM_HOME=~/.gem
export PATH=$PATH:/usr/local/go/bin:~/go/bin:~/.gem/bin

if [ -d ~/.linuxbrew ]; then
    export PATH="/home/aaron/.linuxbrew/bin:$PATH"
    export MANPATH="/home/aaron/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="/home/aaron/.linuxbrew/share/info:$INFOPATH"
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
