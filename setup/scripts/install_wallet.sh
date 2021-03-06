#!/bin/bash

echo "Package zcash-swing-wallet-ui..."
DIR=$PWD

. lib/utils.sh
cd ../packages

# Prepare 
PATH=`dirname $PWD/java-*/bin/java.exe`:`dirname $PWD/apache-ant*/bin/ant.bat`:$PATH

cd zcash-swing-wallet-ui
ant -buildfile ./src/build/build.xml
verify

# Dist
CLIENT_DIR="../../../dist/zclassic/client"
rm_if_exists "${CLIENT_DIR}/ZCashSwingWalletUI.jar"
if ! [ -d "${CLIENT_DIR}" ]
then
	mkdir -p "${CLIENT_DIR}"
fi
cp -f build/jars/ZCashSwingWalletUI.jar "${CLIENT_DIR}"
verify

# Clean
rm -Rf build

# launch4j
cd "${DIR}/../packages/launch4j"
./launch4jc.exe ../../launch4j-zclassic.xml
verify

cd "${DIR}/../../dist/zclassic/client"
rm -f *.jar
