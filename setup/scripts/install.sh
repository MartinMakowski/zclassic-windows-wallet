#!/bin/bash

echo "Installing ZClassic"

. lib/utils.sh

rm -Rf "../../dist/zclassic"

run install_msys2.sh
run install_openjdk.sh
run install_scripts.sh
run install_wallet.sh
run install_zcashd.sh
run install_cmds.sh

# Create setup file
run install_innosetup.sh
