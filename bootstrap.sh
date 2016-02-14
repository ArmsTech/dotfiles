#!/bin/bash

PACKAGES_FILE='packages'
RAW_URL="https://raw.githubusercontent.com"

# Remove gentoo config files to be replaced
sudo rm -rf /etc/portage/package.use

echo "[+] Setting Gentoo configuration files"
wget -q "${RAW_URL}"/brenj/dotfiles/master/gentoo/package.use
sudo mv package.use /etc/portage/package.use
sudo chmod 644 /etc/portage/package.use

echo "[+] Updating the portage tree"
sudo emerge-webrsync

echo "[+] Installing packages"
wget -q "${RAW_URL}"/brenj/dotfiles/master/gentoo/packages
while read -r package; do
  echo "Emerging package ${package}"
  sudo emerge "${package}" &>/dev/null
done <"${PACKAGES_FILE}"

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
. ~/.bashrc
nvm install node && nvm current >.nvmrc

echo "[+] Configuring vim"
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "[+] Cleaning up"
rm packages
