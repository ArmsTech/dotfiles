#!/bin/bash
#
# Bootstrap a development environment.

if [ "${PWD}" != "${HOME}" ]; then
  echo "Must be run from home directory"
  exit 1
fi

RAW_URL="https://raw.githubusercontent.com"

echo "[+] Cloning dotfiles"
git clone https://github.com/brenj/dotfiles.git

echo "[+] Linking configuration files"
ln -sf dotfiles/.bashrc .bashrc
ln -sf dotfiles/.bash_aliases .bash_aliases
ln -sf dotfiles/.bash_profile .bash_profile
ln -sf dotfiles/.gvimrc .gvimrc
ln -sf dotfiles/.tmux.conf .tmux.conf
ln -sf dotfiles/.vim .vim
ln -sf dotfiles/.vimrc .vimrc
ln -sf dotfiles/.xmonad .xmonad

# Source bashrc
. .bashrc

# Get script for git prompt
wget -O .git-prompt.sh -q \
"${RAW_URL}"/git/git/master/contrib/completion/git-prompt.sh

echo "[+] Installing node"
wget -q -O - ${RAW_URL}/creationix/nvm/v0.30.2/install.sh |bash
. .nvm/nvm.sh
nvm install node &>/dev/null && nvm current >.nvmrc

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
cd
