#!/bin/bash

compile() {
	rm_if_exists $2
	./Bat_To_Exe_Converter_\(x64\).exe -bat $1 -save $2 -icon ../../../images/zcl-logo.ico -overwrite -x64 -upx
	verify
}

echo "Package zcash-swing-wallet-ui..."
DIR=$PWD

. lib/utils.sh
cd ../..

DIST_DIR=dist/zclassic

rm_if_exists "${DIST_DIR}/client"
cp -fR client "${DIST_DIR}"
rm_if_exists "${DIST_DIR}/.zclassic"
cp -fR .zclassic "${DIST_DIR}"
rm_if_exists "${DIST_DIR}/server"
cp -fR server "${DIST_DIR}"
rm_if_exists "${DIST_DIR}/scripts"
cp -fR scripts "${DIST_DIR}"

# Update nodes
cd "${DIR}"
./update_nodes.sh >> "../../${DIST_DIR}/.zclassic/zclassic.conf"

# Convert batch files to exe
cd "${DIR}/../packages"
rm_if_exists b2e
7z -scrc -y -ob2e x b2e.zip
verify

cd b2e/Portable
compile ../../../../start-zclassic-cli.bat ../../../../dist/zclassic/start-zclassic-cli.exe
compile ../../../../start-zclassic-server.bat ../../../../dist/zclassic/start-zclassic-server.exe
compile ../../../../start-zclassic-wallet.bat ../../../../dist/zclassic/start-zclassic-wallet.exe 

cd ../..
rm -Rf b2e