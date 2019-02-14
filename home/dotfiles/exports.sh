#!/bin/bash

if [[ ! "$EDITOR" && "$(command -v nvim > /dev/null)" ]]; then
  EDITOR="$(which nvim)"
  export EDITOR="$EDITOR"
fi

if [[ ! "$LANG" ]]; then
  if locale -a | grep -q ^en_CA; then
    export LANG="en_CA.UTF-8"
  elif locale -a | grep -q ^en_GB; then
    export LANG="en_GB.UTF-8"
  else
    export LANG="en_US.UTF-8"
  fi
fi

if [[ ! "$LC_ALL" ]]; then
  export LC_ALL="$LANG"
fi

if [[ ! "$PAGER" ]]; then
  export PAGER="less"
fi

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_R_OPTS="-e"

SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
if [[ -n "$SSH_AUTH_SOCK" ]]; then
  export SSH_AUTH_SOCK
fi
