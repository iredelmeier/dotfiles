#!/bin/bash

CWD="$(dirname "${BASH_SOURCE[0]-$0}")"

for file in "${CWD}/"*; do
  if [[ -r "$file" ]] && [[ -f "$file" ]] && [[ "$file" != "${BASH_SOURCE[0]-$0}" ]]; then
    # shellcheck source=/dev/null
    source "$file"
  fi
done

if [[ -r "/usr/share/autojump/autojump.sh" ]]; then
  # shellcheck source=/dev/null
  source /usr/share/autojump/autojump.sh
fi

if [[ -r "${HOME}/workspace/asdf-vm/asdf/asdf.sh" ]]; then
  # shellcheck source=/dev/null
  source "${HOME}/workspace/asdf-vm/asdf/asdf.sh"
fi

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
