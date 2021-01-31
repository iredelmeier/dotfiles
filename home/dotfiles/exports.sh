#!/bin/bash

if [[ ! "${EDITOR}" && "$(which nvim)" ]]; then
  EDITOR="$(which nvim)"
  export EDITOR="${EDITOR}"
fi

if [[ ! "${LANG}" ]]; then
  if locale -a | grep -q ^en_CA; then
    export LANG="en_CA.UTF-8"
  elif locale -a | grep -q ^en_GB; then
    export LANG="en_GB.UTF-8"
  else
    export LANG="en_US.UTF-8"
  fi
fi

if [[ ! "${LC_ALL}" ]]; then
  export LC_ALL="${LANG}"
fi

if [[ ! "${PAGER}" ]]; then
  export PAGER="less"
fi

export FZF_DEFAULT_COMMAND='ag -fg ""'
export FZF_CTRL_R_OPTS="-e"

export GOPATH="${HOME}/workspace/go"
export GOPATH_GLOBAL="$GOPATH"

if command -v rustc > /dev/null; then
  LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$(rustc --print sysroot)/lib"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
fi

if [[ -z "$SSH_AUTH_SOCK" ]]; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add -q
fi
# SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# if [[ -n "$SSH_AUTH_SOCK" ]]; then
  # export SSH_AUTH_SOCK
# fi
