alias ...='cd ../..'

alias la='eza -la --git'
alias tree='eza --tree -a'

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

if status is-interactive
# Commands to run in interactive sessions can go here
	set fish_greeting
    fastfetch
end

starship init fish | source
