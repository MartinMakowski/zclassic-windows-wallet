#!/bin/bash

echo
echo "Downloading ZClassic packages"

. lib/utils.sh

init_get

run get_msys2.sh
run get_openjdk.sh
run get_scripts.sh
run get_wallet.sh
run get_wallet_code.sh
run get_zcashd.sh
run get_innosetup.sh
run get_cmds.sh

