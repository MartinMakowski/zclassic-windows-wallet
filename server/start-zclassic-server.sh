#!/bin/bash

echo Zclassic 
echo

DIR=$PWD

cd ../scripts 
./install_params.sh
CODE=$?
if [ $? -ne 0 ]
then
	echo "ERROR: $CODE"
	read
fi

cd "${DIR}"
echo
echo "Starting Zclassic server..."
./zcashd.exe -datadir=/.zclassic -printtoconsole -showmetrics=0 $@ 
CODE=$?
if [ $CODE -ne 0 ]
then
	echo "ERROR: $CODE"
	read
fi