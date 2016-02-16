#!/bin/bash
#
# Provision a Gentoo machine.

if [[ ${EUID} != 0 ]] ; then
  echo "This script must be run as root"
  exit 1
fi

PACKAGES_FILE='packages'
RAW_URL="https://raw.githubusercontent.com"

rm -rf /etc/portage/package.use

echo "[+] Setting Gentoo configuration files"
wget -q "${RAW_URL}"/brenj/dotfiles/master/gentoo/package.use
mv package.use /etc/portage/package.use
chmod 644 /etc/portage/package.use

echo "[+] Updating the portage tree"
emerge-webrsync --quiet

echo "[+] Installing packages"
wget -q "${RAW_URL}"/brenj/dotfiles/master/gentoo/packages
while read -r package; do
  echo "Emerging package ${package}"
  emerge --quiet "${package}" &>/dev/null
done <"${PACKAGES_FILE}"

echo "[+] Cleaning up"
rm packages
