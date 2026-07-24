alias ...='cd ../..'

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

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    fastfetch
end

starship init fish | source
