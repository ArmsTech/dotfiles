# ~/.bashrc

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
