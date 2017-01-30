#!/bin/bash

echo "Package Inno Setup..."
DIR=$PWD

. lib/utils.sh
cd ..

# Make
rm_if_exists installer
packages/inno/ISCC.exe zclassic-windows-wallet.iss 
verify

