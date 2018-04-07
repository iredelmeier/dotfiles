#!/bin/bash

CWD="$(realpath "$(dirname -- "$0")")"
BIN_DIR="${CWD}/../bin"

for file in "${BIN_DIR}"/*; do
  sudo ln -sf "$file" "/usr/local/bin/$(basename "$file")"
done
