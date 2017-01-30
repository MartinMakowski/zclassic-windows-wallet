#!/bin/bash

echo "ZClassic post install..."
DIR=$PWD

echo "PATH=/client:\$PATH" >> ~/.bashrc

cd /zclassic-cmds && ./install.sh

echo "rpcuser=$(head -c 6 /dev/random | base64)" >> /.zclassic/zclassic.conf
echo "rpcpassword=$(head -c 20 /dev/random | base64)" >> /.zclassic/zclassic.conf

cd "$DIR/.."
PARAMS_DIR="$APPDATA/ZcashParams"
if ! [ -f "$PARAMS_DIR/sprout-proving.key" ]
then
	if ! [ -d "$PARAMS_DIR" ]
	then
		mkdir -p "$PARAMS_DIR"
	fi
	if [ -f .zcash-params/sprout-proving.key ]
	then
		echo "Copying params to ${PARAMS_DIR}..." 
		cp -f .zcash-params/* "${PARAMS_DIR}" 
	else 
		echo
		echo "No params file. Please download wait for download params or full wallet version from https://github.com/fxminer/zclassic-windows-wallet"
	
		echo "Downloading params to ${PARAMS_DIR}..."
		PARAMS_URL=https://github.com/fxminer/zclassic-docker-params/releases/download/0.0.1/zcash-params.7z
		echo "PARAMS URL: ${PARAMS_URL}"
		curl --speed-limit 1000 --speed-time 15 --connect-timeout 5 --retry 999 --retry-delay 0 --retry-max-time 0 -fL -o params.7z "$PARAMS_URL"
		7z -scrc -y x params.7z
		mv .zcash-params/sprout-verifying.key "$PARAMS_DIR"
		mv .zcash-params/sprout-proving.key "$PARAMS_DIR"
	fi
fi
