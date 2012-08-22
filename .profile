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

export SHELL="/bin/bash"
export EDITOR="/usr/bin/vim"
set -o vi
