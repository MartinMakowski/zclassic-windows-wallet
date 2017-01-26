#!/bin/bash

echo Zclassic 
echo

PARAMS_DIR="$APPDATA/ZcashParams"
if ! [ -f "$PARAMS_DIR/sprout-proving.key" ]
then
	if ! [ -d "$PARAMS_DIR" ]
	then
		mkdir -p "$PARAMS_DIR"
	fi
	echo "Copying params to ${PARAMS_DIR}..." 
	cp -f .zcash-params/* "${PARAMS_DIR}" 
fi

echo
echo "Starting Zclassic server..."
./zcashd.exe -datadir=../.zclassic -printtoconsole -showmetrics=0 $@ 
