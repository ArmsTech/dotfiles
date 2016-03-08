# Declare bash aliases
# vi: set filetype=sh :

# copy-paste
alias c='xclip -selection clipboard &>/dev/null'
alias p='xclip -o -selection clipboard'
alias s='tmux save-buffer - |c'

# git
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias go='git checkout'
alias gs='git status'
alias gu='git reset --soft HEAD~1'

# history
alias h='history'
alias hg='history |grep'

alias ..='cd ..'
alias g='gvim'
alias l='ls -lhA'
alias v='vim'

alias mkdir='mkdir -pv'
alias ps="ps -ef"
