#!/bin/bash

PACKAGES_FILE='packages'
RAW_URL="https://raw.githubusercontent.com/brenj/dotfiles/master/gentoo"

# Remove gentoo config files to be replaced
sudo rm -rf /etc/portage/package.use

echo "[+] Setting Gentoo configuration files"
wget "${RAW_URL}"/package.use &>/dev/null
sudo mv package.use /etc/portage/package.use
chmod 644 /etc/portage/package.use

echo "[+] Updating the portage tree"
sudo emerge-webrsync

echo "[+] Installing packages"
wget "${RAW_URL}"/packages &>/dev/null
while read -r package; do
  echo "Emerging package $package"
  sudo emerge $package &>/dev/null
done <"${PACKAGES_FILE}"

echo "[+] Cloning repositories"
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

echo "[+] Cleaning up"
rm packages
