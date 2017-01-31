#!/bin/bash

. lib/utils.sh

echo "Create ZClassic blockchain distribution package..."

run get_blockchain.sh
run install_innosetup_blockchain.sh
