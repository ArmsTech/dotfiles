#!/bin/bash
#
# Bootstrap a development environment.

RAW_URL="https://raw.githubusercontent.com"

echo "[+] Cloning dotfiles"
git clone https://github.com/brenj/dotfiles.git

echo "[+] Linking configuration files"
ln -s dotfiles/.bashrc .bashrc
ln -s dotfiles/.bash_aliases .bash_aliases
ln -s dotfiles/.bash_profile .bash_profile
ln -s dotfiles/.gvimrc .gvimrc
ln -s dotfiles/.tmux.conf .tmux.conf
ln -s dotfiles/.vim .vim
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.xmonad .xmonad

# Get script for git prompt
wget -O .git-prompt.sh -q "${RAW_URL}"/git/git/master/contrib/completion/git-prompt.sh

echo "[+] Installing node"
wget -q -O - ${RAW_URL}/creationix/nvm/v0.30.2/install.sh |bash
. ~/.nvm/nvm.sh
nvm install node &>/dev/null && nvm current >.nvmrc

echo "[+] Configuring vim"
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall &>/dev/null
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer &>/dev/null
cd
