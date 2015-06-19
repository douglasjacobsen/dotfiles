#!/usr/bin/env bash

# Load RVM, if you are using it
#[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
#export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='colorful'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor, svn, and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'
export SVN_EDITOR='vim'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

export BASH_PROFILE_SOURCED=yes

if [ -f ~/.bashrc ]; then
    if [ -z ${BASHRC_SOURCED} ]; then
        source ~/.bashrc
    fi
fi
# Set LANG to en_US.utf8
export LANG=en_US.UTF-8

# Load Bash It
source $BASH_IT/bash_it.sh
