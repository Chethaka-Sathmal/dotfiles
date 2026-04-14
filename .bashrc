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

# -----------------------------------------------------
# Alias by Chethaka
# -----------------------------------------------------
alias ls="eza -a --icons=always"
alias ll="eza -al --icons=always"
alias tree='eza -a --tree --icons=always'
alias cp="cp -i"
alias mv="mv -i"
alias cl=clear
alias nv=nvim
alias vim=nvim
alias ":q"=exit
alias oc=opencode
alias ff=fastfetch

# opencode
export PATH=/home/csathmal/.opencode/bin:$PATH
