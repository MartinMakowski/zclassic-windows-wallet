#!/bin/bash

echo "Package zcashd..."
DIR=$PWD

. lib/utils.sh
cd ../packages

rm_if_exists zclassic
7z -scrc -y -ozclassic x zclassic.zip
verify

# Dist
DIST_DIR="../../dist/zclassic"
	
cp -f zclassic/zclassic*/zcash-cli.exe "${DIST_DIR}/client"
cp -f zclassic/zclassic*/zcashd.exe "${DIST_DIR}/server"

# Clean
rm -Rf zcashd
