# ~/.bashrc

if [[ $- != *i* ]] ; then
  # Shell is non-interactive. Exit.
  return
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [[ ${EUID} == 0 ]] ; then
  PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
  . ~/.git-prompt.sh
  PS1='[\033[01;32m\]\u@\h\[\033[01;34m\] \w$(__git_ps1 " (%s)")\[\033[00m\]]\$]]]'
fi

# Disable completion when the input buffer is empty.
shopt -s no_empty_cmd_completion

# Enable history appending instead of overwriting when exiting.
shopt -s histappend
