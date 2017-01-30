#!/bin/bash

# Config
INNO_URL=http://www.jrsoftware.org/download.php/is.exe
INNO_UNPACKER_URL=https://netcologne.dl.sourceforge.net/project/innounp/innounp/innounp%200.46/innounp046.rar

. lib/utils.sh
init_get
cd ../packages

echo
echo "Downloading Inno Setup http://www.jrsoftware.org/isdl.php#stable..."
rm_if_exists inno.exe
echo "Downloading ${INNO_URL}..."
curl ${CURL_PARAMS_NO_RESUME} -o innosetup.exe "${INNO_URL}"
verify

echo
echo "Downloading Inno Setup Unpacker from https://sourceforge.net/projects/innounp..."
rm_if_exists inno.exe
echo "Downloading ${INNO_UNPACKER_URL}..."
curl ${CURL_PARAMS_NO_RESUME} -o innounp.rar "${INNO_UNPACKER_URL}"
verify

rm_if_exists innounp
mkdir -p innounp
unrar x -y innounp.rar innounp
verify

rm_if_exists inno
innounp/innounp.exe -e -by -dinno innosetup.exe