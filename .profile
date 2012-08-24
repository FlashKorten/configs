if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "/opt/lang/haskell/7.4.2/bin" ] ; then
    PATH="/opt/lang/haskell/7.4.2/bin:$PATH"
fi

if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

if [ -d "$HOME/.cljr/bin" ] ; then
    PATH="$HOME/.cljr/bin:$PATH"
fi

export SHELL="/bin/bash"
export EDITOR="/usr/bin/vim"
export TERM="xterm-256color"
export JAVA_HOME="/usr/lib/jvm/java-6-sun"
set -o vi
bind -m vi-command ".":insert-last-argument
