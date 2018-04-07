#!/bin/bash

set -eux

CWD="$(realpath "$(dirname -- "$0")")"
KONSOLE_DIR="${CWD}/../konsole"

for file in "${KONSOLE_DIR}/config/"*; do
  ln -sfn "$file" "${HOME}/.config/$(basename "$file")"
done

mkdir -p "${HOME}/.local/share/konsole"

for file in "${KONSOLE_DIR}/share/"*; do
  ln -sfn "$file" "${HOME}/.local/share/konsole/$(basename "$file")"
done
