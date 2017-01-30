#!/bin/bash

echo "Package zclassic-cmds..."
DIR=$PWD

. lib/utils.sh
cd ../packages

# Dist
DIST_DIR="../../dist/zclassic"
	
rm_if_exists "${DIST_DIR}/zclassic-cmds"
cp -Rf zclassic-cmds "${DIST_DIR}"
verify