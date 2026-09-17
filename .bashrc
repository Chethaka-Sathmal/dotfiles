# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

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


# Change the bash prompt, push the cursor line below
# PS1="[\[\e[32m\]\u\[\e[0m\]@\[\e[34m\]\h\[\e[0m\] \W]\n\$ "

# opencode
export PATH=/home/csathmal/.opencode/bin:$PATH

#go
export PATH=$PATH:/usr/local/go/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export EDITOR=nvim

# pnpm
export PNPM_HOME="/home/csathmal/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
. "/home/csathmal/.deno/env"

# Custom config 
[ -f "$HOME/.dotfiles/.aliases" ] && . "$HOME/.dotfiles/.aliases" 

[ -f "/home/csathmal/.ghcup/env" ] && . "/home/csathmal/.ghcup/env" # ghcup-envexport PATH="$HOME/.local/bin:$PATH"
