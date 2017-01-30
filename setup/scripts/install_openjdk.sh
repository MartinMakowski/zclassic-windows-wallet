#!/bin/bash

echo "Package OpenJDK..."
DIR=$PWD

. lib/utils.sh
cd ../packages

# Prepare 
if [ -d java-* ]
then
	rm -Rf java-*
fi
rm_if_exists ../../dist/zclassic/jre
7z -scrc -y x java.zip
verify

# Dist
DIST_DIR="${DIR}/../../dist/zclassic"
if [ -d "${DIST_DIR}/jre" ]
then
	rm -Rf "${DIST_DIR}/jre"
fi
mkdir -p "${DIST_DIR}/jre"
cp -R java-*/jre "${DIST_DIR}"
verify

# Clean
#rm -Rf java-*