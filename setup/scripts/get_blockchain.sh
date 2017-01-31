#!/bin/bash

# Config
BLOCKCHAIN_URL=https://github.com/fxminer/zclassic-blocks/releases/download/0.0.1/zclassic-blocks_42815.7z

. lib/utils.sh
echo
echo "ZClassic blockchain..."
init_get
cd ../packages

if ! [ -f zcash-blocks.7z ]
then
	if [ $(ls ../../../zclassic-blocks_*.7z | wc -l) -gt 0 ] 
	then
		echo "Copying blockchain from ./../../zcash-params.7z"
		cp -f ../../../zclassic-blocks_*.7z zclassic-blocks.7z
		verify
	else 
		echo "Downloading ${BLOCKCHAIN_URL}... (200+MB)"
		curl ${CURL_PARAMS} -o zclassic-blocks.7z "${BLOCKCHAIN_URL}"
		verify
	fi
fi

rm_if_exists zclassic-blocks 
7z -scrc -y x -ozclassic-blocks zclassic-blocks.7z
verify