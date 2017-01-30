#!/bin/bash

# Config
URL=http://repo.msys2.org/distrib/i686/msys2-base-i686-20161025.tar.xz
GIT=https://github.com/git-for-windows/git/releases/download/v2.11.0.windows.3/PortableGit-2.11.0.3-64-bit.7z.exe

. lib/utils.sh
echo
echo "Downloading MSYS2"
init_get
cd ../packages

if ! [ -d msys2 ]
then
	mkdir msys2
fi
cd msys2
echo
echo "Downloading: ${URL}"
rm_if_exists msys2.tar.xz
curl ${CURL_PARAMS} -o msys2.tar.xz "${URL}"
7z x -scrc -y msys2.tar.xz
verify
rm -f msys2.tar.xz

echo
echo "Downloading: ${GIT}"
rm_if_exists git.exe
curl ${CURL_PARAMS} -o git.exe ${GIT}
verify
if ! [ -d git ]
then
	mkdir git
fi



