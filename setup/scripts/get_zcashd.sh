#!/bin/bash

# Config
ZCASHD_URL=https://zcash.dl.mercerweiss.com/zclassic-v1.0.5.zip

. lib/utils.sh
echo
echo "Downloading zcashd..."
init_get
cd ../packages

# zcashd
rm_if_exists zcashd.zip
echo "Downloading ${ZCASHD_URL}..."
curl ${CURL_PARAMS} -o zcashd.zip "${ZCASHD_URL}"
verify
