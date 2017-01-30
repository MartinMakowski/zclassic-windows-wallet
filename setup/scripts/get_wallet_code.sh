#!/bin/bash

# Config
WALLET_URL=https://github.com/fxminer/zcash-swing-wallet-ui.git

. lib/utils.sh
echo
echo "Cloning zcash-swing-wallet-ui..."
init_get
cd ../packages

# Git sources
rm_if_exists zcash-swing-wallet-ui
git clone "${WALLET_URL}"
verify
