#!/bin/sh

# Based on github.com/jessfraz/dotfiles/test.sh

set -eu

ERRORS=""
CWD="$(dirname -- "$0")"
DOTFILES_PATH="${CWD}/../dotfiles"

for file in $(find "$DOTFILES_PATH" -type f -not -ipath "*.git*" | sort -u); do
  shebang="$(head -n 1 < "${file}")"

  if echo "${shebang}" | grep -qE "/bash$|/sh$"; then
    {
      shellcheck "${file}" && echo "[${file}]: success"
    } || {
      echo "[${file}]: ERRORS" && ERRORS=true
    }
  fi
done

if [ -z "${ERRORS}" ]; then
  echo "Everything passed! :)"
else
  echo "There were errors :("
  exit 1
fi
