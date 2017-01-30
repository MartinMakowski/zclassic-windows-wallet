#!/bin/bash

echo "Package zcashd..."
DIR=$PWD

. lib/utils.sh
cd ../packages

rm_if_exists zcashd
7z -scrc -y -ozcashd x zcashd.zip
verify

# Dist
DIST_DIR="../../dist/zclassic"
	
cp -f zcashd/zcash-cli.exe "${DIST_DIR}/client"
cp -f zcashd/zcashd.exe "${DIST_DIR}/server"

# Clean
rm -Rf zcashd
