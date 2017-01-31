#!/bin/bash

# Config
PARAMS_URL=https://github.com/fxminer/zclassic-docker-params/releases/download/0.0.1/zcash-params.7z

. lib/utils.sh
echo
echo "Params..."
init_get
cd ../packages

# zcashd
if ! [ -f params.7z ]
then
	if [ -f ../../../zcash-params.7z ] 
	then
		echo "Copying params from ./../../zcash-params.7z"
		cp -f ../../../zcash-params.7z .
	else 
		echo "Downloading ${PARAMS_URL}... (850MB)"
		curl ${CURL_PARAMS} -o zcash-params.7z "${PARAMS_URL}"
		verify
	fi
fi

rm_if_exists .zcash-params 
7z -scrc -y x zcash-params.7z
verify