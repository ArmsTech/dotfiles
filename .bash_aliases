# Declare bash aliases
# vi: set filetype=sh :
alias c='xclip -selection clipboard &>/dev/null'
alias p='xclip -o -selection clipboard'
alias s='tmux save-buffer - |c'

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias go='git checkout'
alias gs='git status'
alias gu='git reset --soft HEAD~1'
