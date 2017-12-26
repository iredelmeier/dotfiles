# Adapted from oh-my-zsh

if [[ ! "${HISTFILE}" ]]; then
  HISTFILE="${HOME}/.zsh_history"
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case ${HIST_STAMPS} in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_find_no_dups
# use instead of hist_ignore_all_dups to ensure frequent commands stay in history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history
