#!/bin/bash
#
# Provision an OS X machine.

if [[ ${EUID} != 0 ]] ; then
  echo "This script must be run as root"
  exit 1
fi

FORMULAE_FILE='formulae'

xcode-select --install &>/dev/null

echo "[+] Installing formula"
while read -r formula; do
  echo "Brewing formula ${formula}"
  brew install "${formula}" &>/dev/null
done <"${FORMULAE_FILE}"
