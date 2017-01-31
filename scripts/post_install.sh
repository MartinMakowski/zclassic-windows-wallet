#!/bin/bash

echo "ZClassic post install..."
DIR=$PWD

echo "PATH=/client:\$PATH" >> ~/.bashrc

cd /zclassic-cmds && ./install.sh

echo "rpcuser=$(head -c 6 /dev/random | base64)" >> /.zclassic/zclassic.conf
echo "rpcpassword=$(head -c 20 /dev/random | base64)" >> /.zclassic/zclassic.conf

cp -Rf /.zclassic ~

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
		echo
		echo "No params file." 
		echo "Please download wait for download params"
		echo "or"
		echo "download full wallet version from https://github.com/fxminer/zclassic-windows-wallet"
	
		echo "Downloading params to ${PARAMS_DIR}..."
		PARAMS_URL=https://github.com/fxminer/zclassic-docker-params/releases/download/0.0.1/zcash-params.7z
		echo "PARAMS URL: ${PARAMS_URL}"
		curl --speed-limit 1000 --speed-time 15 --connect-timeout 5 --retry 999 --retry-delay 0 --retry-max-time 0 -fL -o params.7z "$PARAMS_URL"
		if [ $? -ne 0 ]
		then
			echo
			echo "ERROR: No params file"
			echo "    Please download https://github.com/fxminer/zclassic-docker-params/releases/download/0.0.1/zcash-params.7z"
			echo "    and extract files to ${PARAMS_DIR}"
			echo "    or"
			echo "    Download full wallet version 700MB+ from https://github.com/fxminer/zclassic-windows-wallet/releases"
			read
		fi
		7z -scrc -y x params.7z
		mv .zcash-params/sprout-verifying.key "$PARAMS_DIR"
		mv .zcash-params/sprout-proving.key "$PARAMS_DIR"
	fi
fi
