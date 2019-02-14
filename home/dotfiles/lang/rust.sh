#!/bin/bash

if ! command -v rustc > /dev/null; then
  return
fi

CARGO_BIN_PATH="${HOME}/.cargo/bin"
if [[ -r "$CARGO_BIN_PATH" ]] && [[ -d "$CARGO_BIN_PATH" ]]; then
  export PATH="${CARGO_BIN_PATH}:${PATH}"
fi

if command -v rustc > /dev/null; then
  RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
  export RUST_SRC_PATH
fi

LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$(rustc --print sysroot)/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
