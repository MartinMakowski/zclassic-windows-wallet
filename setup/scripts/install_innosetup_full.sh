#!/bin/bash

echo "Package Inno Setup..."

. lib/utils.sh
cd ..

# Make
rm_if_exists installer/*full*
packages/inno/ISCC.exe zclassic-windows-wallet-full.iss 
verify

