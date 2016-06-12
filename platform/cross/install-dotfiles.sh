#!/bin/bash
#
# Install dotfiles.

STARTING_DIR="$(pwd)"

cd

if [ -d "dotfiles" ]; then
  echo "[-] Removing existing dotfiles directory"
  rm -rf dotfiles
fi

echo "[+] Cloning dotfiles"
git clone https://github.com/brenj/dotfiles.git

echo "[+] Linking dotfiles"
ln -sf dotfiles/.bashrc .bashrc
ln -sf dotfiles/.bash_aliases .bash_aliases
ln -sf dotfiles/.bash_profile .bash_profile
ln -sf dotfiles/.gvimrc .gvimrc
ln -sf dotfiles/.tmux.conf .tmux.conf
ln -sf dotfiles/.vim .vim
ln -sf dotfiles/.vimrc .vimrc
ln -sf dotfiles/.xmonad .xmonad

. .bashrc

cd "${STARTING_DIR}"
