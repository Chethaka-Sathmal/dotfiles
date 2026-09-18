# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Shared PATH/env setup (also sourced by zsh): ~/.local/bin:~/bin, EDITOR,
# opencode, go, nvm, pnpm, deno, ghcup. Single source of truth in .exports.
[ -f "$HOME/.dotfiles/.exports" ] && . "$HOME/.dotfiles/.exports"

# bash-only: nvm's bash-completion script (zsh has no equivalent to load)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Custom config
[ -f "$HOME/.dotfiles/.aliases" ] && . "$HOME/.dotfiles/.aliases"

# Prompt
command -v starship >/dev/null 2>&1 && eval "$(starship init bash)"
