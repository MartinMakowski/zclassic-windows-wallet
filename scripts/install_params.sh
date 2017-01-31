#!/bin/bash

cd ..
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
		echo "Please wait for download params"
		echo "or"
		echo "download full wallet version from https://github.com/fxminer/zclassic-windows-wallet"
	    echo
		pacman --noconfirm -Sy p7zip
		echo "Downloading params to ${PARAMS_DIR}... Be patient. The size of params is about 850MB."
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
			exit 1
		fi
		7z -scrc -y x params.7z
		mv .zcash-params/sprout-verifying.key "$PARAMS_DIR"
		mv .zcash-params/sprout-proving.key "$PARAMS_DIR"
		exit $?
	fi
fi
