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

# Bash Aliases
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gu='git pull'
alias gl='git log --oneline --graph --all'
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gb='git branch'
alias gi='git init'
alias gcl='git clone'
alias gch='git checkout'
alias gm='git merge'

# Asusctl aliases
alias asusctl-p='asusctl profile set Performance'
alias asusctl-b='asusctl profile set Balanced'
alias asusctl-q='asusctl profile set Quiet'
alias asusctl-battery='asusctl battery limit'

# Supergfxctl aliases
alias gpu-d='supergfxctl -m AsusMuxDgpu'
alias gpu-i='supergfxctl -m Integrated'
alias gpu-h='supergfxctl -m Hybrid'
alias gpu-list='supergfxctl -s'
alias gpu-status='supergfxctl -g'

# Autostart
fastfetch
