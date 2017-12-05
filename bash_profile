# ~/.bash_profile: executed by the command interpreter for login shells.

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
    export PATH
fi

# add /opt/bin to PATH if it exists
if [ -d "/opt/bin" ] ; then
    PATH="/opt/bin:$PATH"
    export PATH
fi

# put ruby gems installations in home dir
export GEM_HOME=$HOME/.gem
