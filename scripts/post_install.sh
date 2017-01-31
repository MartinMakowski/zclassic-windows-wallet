#!/bin/bash

echo "ZClassic post install..."
DIR=$PWD

if ! [ -d /tmp ]
then
	mkdir /tmp
fi

echo "PATH=/client:\$PATH" >> ~/.bashrc
echo "alias ll='ls -al'" >> ~/.bashrc

cd /zclassic-cmds && ./install.sh

echo "rpcuser=$(head -c 6 /dev/random | base64)" >> /.zclassic/zclassic.conf
echo "rpcpassword=$(head -c 20 /dev/random | base64)" >> /.zclassic/zclassic.conf

cp -f /.zclassic/zclassic.conf /.zclassic/zcash.conf
cp -Rf /.zclassic ~

cd "${DIR}"
./install_params.sh
CODE=$?
if [ $? -ne 0 ]
then
	echo "ERROR: $CODE"
	read
fi
