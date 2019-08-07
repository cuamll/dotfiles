# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# this one is just too ingrained
alias ll="ls -lHA"

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# on macos this will require installing bash through macports
# because the system bash on macos is from like 1994 or something
PROMPT_DIRTRIM=2

# check the window size after each command
shopt -s checkwinsize

# append to (don't overwrite) history file
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1="\u@\h: \w\a\]\$ "
