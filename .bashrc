# ~/.bashrc

CYAN="\[\e[01;36m\]"
GREEN="\[\e[01;32m\]"
PINK="\[\e[01;35m\]"
WHITE="\[\e[0m\]"

PS1="\$? [ ${GREEN}\u${WHITE}@${GREEN}\h${WHITE} ] ${CYAN}\w${PINK}\$(get_git_branch)${WHITE}\n\$> "

get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ ( \1 )/'
}

if [[ $- != *i* ]] ; then
  # Shell is non-interactive. Exit.
  return
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Disable completion when the input buffer is empty.
shopt -s no_empty_cmd_completion

# Enable history appending instead of overwriting when exiting.
shopt -s histappend
