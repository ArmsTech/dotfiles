# Declare bash aliases
# vi: set filetype=sh :

alias ..='cd ..'
alias h='history'
alias l='ls -lhA'

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias go='git checkout'
alias gp='git pull origin'
alias gs='git status'
alias gu='git reset --soft HEAD~1'

alias pb='pbcopy'

alias cat='bat -p --paging=never'
alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias mkdir='mkdir -pv'
