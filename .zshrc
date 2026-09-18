# ~/.zshrc

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTFILE="$HOME/.histfile"
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# ---------------------------------------------------------------------------
# General options
# ---------------------------------------------------------------------------
setopt nomatch
unsetopt beep

# ---------------------------------------------------------------------------
# Oh My Zsh
# ---------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# No OMZ theme - Starship renders the prompt instead (see bottom of file).
ZSH_THEME=""

# Never check for updates on shell startup: it's a network call on the
# critical path of opening a terminal. Update manually with `omz update`.
zstyle ':omz:update' mode disabled

# Fast, cached compinit: OMZ's own `compinit -i -d "$ZSH_COMPDUMP"` call
# below has no freshness check, so it does a full completion rescan +
# security audit + dump rebuild on EVERY launch (~500-700ms measured here
# - by far the largest single cost in this file). This wrapper intercepts
# that call: `autoload -U compinit` does not clobber a function already
# defined with that name, so as long as this runs before oh-my-zsh.sh is
# sourced, OMZ's internal call hits this instead of the real compinit.
# Full rescan still happens once a day; every other launch just loads the
# precompiled dump directly via -C (skips rescan + compaudit).
compinit() {
  unfunction compinit
  autoload -Uz compinit
  if [[ -n ${ZSH_COMPDUMP}(#qN.mh+24) ]]; then
    compinit "$@"       # dump missing or >24h stale: full rescan + audit
  else
    compinit -C "$@"    # dump fresh: skip rescan/audit, load directly
  fi
}

# zsh-autosuggestions/zsh-syntax-highlighting here are symlinked (in
# .oh-my-zsh/custom/plugins/) to the dnf-packaged copies rather than
# OMZ's own git clones, so `dnf update` keeps them current with one
# less thing to separately maintain. zsh-syntax-highlighting must stay
# last in this list - OMZ loads plugins in array order, and highlighting
# needs every other widget/keybinding already defined first.
plugins=(
  git
  sudo
  fzf
  extract
  colored-man-pages
  command-not-found
  dnf
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# ---------------------------------------------------------------------------
# Vi keybindings
# ---------------------------------------------------------------------------
# Must come AFTER sourcing oh-my-zsh.sh: OMZ's lib/key-bindings.zsh sets
# emacs-style bindings by default, so this has to run after it to win.
bindkey -v
export KEYTIMEOUT=1   # ~10ms ESC->normal-mode delay instead of zsh's ~400ms default

# zsh's vicmd map binds `:` to `execute-named-cmd` by default (type the name
# of a zle widget to run) - NOT vim's ex-command mode. Coming from vim/nvim
# muscle memory it's a confusing trap (`:q` types into it and goes nowhere,
# since no widget is named "q"). Unbind it so `:` is just a no-op there.
bindkey -M vicmd -r ':'

# Cursor shape follows vi mode: block in normal mode, beam in insert mode.
# NOTE: must be defined+registered (`zle -N`) BEFORE the `starship init zsh`
# eval near the bottom - starship detects a pre-existing zle-keymap-select
# widget and wraps it, which is how both the cursor shape *and* starship's
# vi-mode prompt segment keep working together. Do not move this block
# after the Prompt section.
function zle-keymap-select {
  case $KEYMAP in
    vicmd)      print -n '\e[1 q'; export STARSHIP_VI_MODE='NORMAL' ;;  # blinking block = normal mode
    viins|main) print -n '\e[5 q'; export STARSHIP_VI_MODE='INSERT' ;;  # blinking beam  = insert mode
  esac
}
zle -N zle-keymap-select

function zle-line-init {
  print -n '\e[5 q'   # always start a fresh prompt line in insert/beam
  export STARSHIP_VI_MODE='INSERT'
}
zle -N zle-line-init

# Edit the current command line in $EDITOR from normal mode with `vv`
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'vv' edit-command-line

# ---------------------------------------------------------------------------
# Shared PATH/env (kept in one file so bash and zsh never drift)
# ---------------------------------------------------------------------------
[ -f "$HOME/.dotfiles/.exports" ] && . "$HOME/.dotfiles/.exports"

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
# Sourced after OMZ's plugins so ours win on any name collision.
[ -f "$HOME/.dotfiles/.aliases" ] && . "$HOME/.dotfiles/.aliases"

# ---------------------------------------------------------------------------
# Prompt
# ---------------------------------------------------------------------------
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
