alias ...='cd ../..'

alias nv='nvim'
alias v='vim'

alias la='eza -la --git'
alias tree='eza --tree -a'

alias g='git'
alias gs='g s'
alias ga='g a'
alias gc='g c'
alias gp='g p'
alias gu='g u'
alias gl='g l'
alias gd='g d'
alias gb='g b'
alias gch='g ch'
alias gm='g m'
alias gcd='cd $(git rev-parse --show-toplevel)'

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    fastfetch
end

starship init fish | source
zoxide init --cmd cd fish | source

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

set -gx EDITOR nvim
