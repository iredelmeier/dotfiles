#!/bin/bash

installed="$(command -v go > /dev/null)"

GO_INSTALL_PATH="/usr/local/go/bin"
if [[ -d "$GO_INSTALL_PATH" ]]; then
  export PATH="${GO_INSTALL_PATH}:${PATH}"
  installed=true
fi

GOPATH="${GOPATH:-"${HOME}/go"}"
GO_BIN_PATH="${GOPATH}/bin"
if [[ -d "$GO_BIN_PATH" ]]; then
  export PATH="${GO_BIN_PATH}:${PATH}"
fi

if $installed; then
  export GOPATH
fi
