#!/bin/bash

export PATH="${HOME}/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/snap/bin"

CARGO_BIN_PATH="${HOME}/.cargo/bin"
if [[ -r "$CARGO_BIN_PATH" ]] && [[ -d "$CARGO_BIN_PATH" ]]; then
  export PATH="${CARGO_BIN_PATH}:${PATH}"
fi

GO_CORE_PATH="/usr/local/go/bin"
if [[ -r "$GO_CORE_PATH" ]] && [[ -d "$GO_CORE_PATH" ]]; then
  export PATH="${GO_CORE_PATH}:${PATH}"

  GOPATH="${GOPATH:-"${HOME}/workspace/go"}"
  GO_BIN_PATH="${GOPATH}/bin"

  if [[ -r "$GO_BIN_PATH" ]] && [[ -d "$GO_BIN_PATH" ]]; then
    export PATH="${GO_BIN_PATH}:${PATH}"
  fi
fi