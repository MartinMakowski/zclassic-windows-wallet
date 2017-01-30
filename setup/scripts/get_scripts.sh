#!/bin/bash

echo "Get scripts dependencies..."
DIR=$PWD
B2E_URL=http://www.f2ko.de/downloads/Bat_To_Exe_Converter.zip

. lib/utils.sh
init_get
cd ../packages

# B2E
rm_if_exists b2e.zip
echo
echo "Downloading ${B2E_URL}..."
curl ${CURL_PARAMS} -o b2e.zip "${B2E_URL}"
verify
