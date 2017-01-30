#!/bin/bash

# Config
CMDS_URL=https://github.com/fxminer/zclassic-cmds.git

. lib/utils.sh
echo
echo "Downloading zclassic-cmds..."
init_get
cd ../packages

# zcashd
rm_if_exists zclassic-cmds
git clone "${CMDS_URL}"
rm -Rf zclassic-cmds/.git
verify
