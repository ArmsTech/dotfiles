#!/bin/bash
#
# Provision a Gentoo machine.

if [[ ${EUID} != 0 ]] ; then
  echo "This script must be run as root"
  exit 1
fi

PACKAGES_FILE='dotfiles/gentoo/packages'

echo "[+] Cloning dotfiles"
git clone https://github.com/brenj/dotfiles.git

rm -rf /etc/portage/package.use

echo "[+] Setting Gentoo configuration files"
mv dotfiles/gentoo/package.use /etc/portage/package.use
cp dotfiles/gentoo/package.accept_keywords/* /etc/portage/package.accept_keywords

echo "[+] Updating the portage tree"
emerge-webrsync --quiet

echo "[+] Installing packages"
while read -r package; do
  echo "Emerging package ${package}"
  emerge --quiet "${package}" &>/dev/null
done <"${PACKAGES_FILE}"

echo "[+] Cleaning up"
rm -rf dotfiles
