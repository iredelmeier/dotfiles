#!/bin/bash

alias ls="ls --color=tty"
alias ll="ls -lh"
alias la="ls -lAh"

if echo | grep -q --color=tty ""; then
  alias grep="grep --color=tty"
fi

if command -v nvim > /dev/null; then
  alias vim=nvim
fi

if command -v xclip > /dev/null; then
  alias copy="xclip -selection clipboard"
  alias paste="xclip -selection clipboard -o"
  alias pbcopy=copy
elif command -v xsel > /dev/null; then
  alias copy="xsel --clipboard"
  alias paste="xsel --clipboard -o"
  alias pbpaste=paste
fi

if command -v xdg-open > /dev/null; then
  alias open="xdg-open"
fi

alias gst="git status"

alias pu="pushd"
alias po="popd"

alias view="vim -R"

# Use `autojump` instead of `j` because it might be run before autojump.sh is sourced,
# in which case `j` won't be a command yet.
if command -v autojump > /dev/null; then
  alias z="j >/dev/null 2>&1"
fi
