#!/bin/bash

# Config
ZCASHD_URL=https://github.com/z-classic/zclassic/releases/download/v1.0.5a/zclassic-Windows-NoGUI-v1.0.5.zip

. lib/utils.sh
echo
echo "Downloading zcashd..."
init_get
cd ../packages

# zcashd
rm_if_exists zclassic.zip
echo "Downloading ${ZCASHD_URL}..."
curl ${CURL_PARAMS} -o zclassic.zip "${ZCASHD_URL}"
verify
