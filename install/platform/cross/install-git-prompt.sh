#!/bin/bash
#
# Install git-prompt.

RAW_URL="https://raw.githubusercontent.com"
STARTING_DIR="$(pwd)"

wget -O .git-prompt.sh -q \
"${RAW_URL}"/git/git/master/contrib/completion/git-prompt.sh

cd "${STARTING_DIR}"
