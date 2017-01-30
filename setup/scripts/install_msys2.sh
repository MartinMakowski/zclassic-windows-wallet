#!/bin/bash

DIR=$PWD

# Config
MSYS_DIR="${DIR}/../packages/msys2"

. lib/utils.sh
echo "Package MSYS2..."

# Prepare 
cd "$MSYS_DIR"

7z x -scrc -y msys2.tar 
verify
7z x -scrc -y -ogit git.exe 
verify

# Git bash
if ! [ -d msys32/bin ]
then
	mkdir -p msys32/bin
fi
cp git/bin/bash.exe msys32/bin

# Cleanup
cd "${MSYS_DIR}/msys32/usr/share"

if ! [ -d locale ]
then
	echo "ERROR: locale not found"
	exit 1
fi

DIRS=`ls locale | grep -v en`
cd locale
rm -Rf $DIRS

cd ..
rm -Rf man doc zoneinfo info
cd ..
rm -Rf bin/msys-icudata*.*

# Dist
DIST_DIR="${DIR}/../../dist/zclassic"
if [ -d "${DIST_DIR}" ]
then
	rm -Rf "${DIST_DIR}"
fi
mkdir -p "${DIST_DIR}"
mv ${MSYS_DIR}/msys32/* "${DIST_DIR}"
verify

# Clean
rm -Rf "${MSYS_DIR}/msys32"
rm -Rf "${MSYS_DIR}/git"
 

