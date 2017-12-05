#!/usr/bin/env bash

######################################
# BASH-IT
#####################################
# Path to the bash it configuration
export BASH_IT="/home/user/.bash-it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='modern'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING=''

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source $BASH_IT/bash_it.sh

###################################################
# LIQUID PROMPT
###################################################
# Load Liquidprompt
# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt

###################################################
# personal additions
####################################################
# some important configuration (e.g. autocompletion)are also found in the .inputrc

# set bash to vi mode
set -o vi

# ad cd when entered a path
shopt -s autocd

# correct minor spelling errors in cd
shopt -s cdspell
 

# Python version management with pyenv
export PATH="/home/user/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# IMPROVEMENT WISHES
# add a dot <.> in front of filename when forgotten

# Environtment Variables belong in ~/.profile, not here
######################

# Aliases
###############
alias sysinfo='neofetch'

# Functions
##############
# cd and ls in one command
     cl() {
     local dir="$1"
     local dir="${dir:=$HOME}"
     if [[ -d "$dir" ]]; then
         cd "$dir" >/dev/null; ls
     else
         echo "bash: cl: $dir: Directory not found"
     fi
     }

###################
# NNN Filebrowser #
###################
     # quit and change directory
     export NNN_TMPFILE="/tmp/nnn"

     n()
     {
         nnn "$@"

         if [ -f $NNN_TMPFILE ]; then
             . $NNN_TMPFILE
             rm $NNN_TMPFILE
         fi
     }


