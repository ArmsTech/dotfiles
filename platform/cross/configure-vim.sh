#!/bin/bash
#
# Configure vim and NeoVim.

STARTING_DIR="$(pwd)"

cd

echo "[+] Configuring vim"
mkdir .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
vim +PluginInstall +qall &>/dev/null
cd .vim/bundle/YouCompleteMe
install.py --clang-completer --tern-completer &>/dev/null

cd

echo "[+] Configuring NeoVim"
mkdir .config && cd .config
ln -sf ~/dotfiles/.vim nvim

cd "${STARTING_DIR}"
