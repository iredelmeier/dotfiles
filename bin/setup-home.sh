#!/bin/bash

set -eu

TARGET="${TARGET:-"$HOME"}"

cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")")/../home"

find . -type f -print0 | while IFS= read -rd $'\0' path; do
  path="$(echo "$path" | sed -e "s/^\.\///g")" # trim off the leading "."
  dir="$(dirname -- "$path")"

  if [[ "$dir" != "." ]]; then
    mkdir -p "${TARGET}/.${dir}"
  fi

  ln -sfn "${PWD}/${path}" "${TARGET}/.${path}"
done
