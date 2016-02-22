#!/bin/bash
#
# Provision a Gentoo machine.

if [[ ${EUID} != 0 ]] ; then
  echo "This script must be run as root"
  exit 1
fi

PACKAGES_FILE='packages'

echo "[+] Downloading configuration files"
# Cloning won't work until git is recompiled (later)
wget -q https://github.com/brenj/dotfiles/archive/master.zip
unzip -qq master.zip && cd dotfiles-master/gentoo

rm -rf /etc/portage/package.use

echo "[+] Installing Gentoo configuration files"
mv package.use /etc/portage/package.use
cp package.accept_keywords/* /etc/portage/package.accept_keywords

echo "[+] Updating the portage tree"
emerge-webrsync --quiet

echo "[+] Installing packages"
while read -r package; do
  echo "Emerging package ${package}"
  emerge --quiet "${package}" &>/dev/null
done <"${PACKAGES_FILE}"

echo "[+] Cleaning up"
cd
rm master.zip
rm -rf dotfiles-master
