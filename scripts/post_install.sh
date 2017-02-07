#!/bin/bash

echo "ZClassic post install..."
DIR=$PWD

if ! [ -d /tmp ]
then
	mkdir /tmp
fi

if [ -f ~/.bashrc ]
then
	mv ~/.bashrc ~/.bashrc.$(date +%s).bkp
fi

echo "PATH=/client:/mingw64/bin:/mingw32/bin:\$PATH" > ~/.bashrc
echo "alias ll='ls -al'" >> ~/.bashrc

cd /zclassic-cmds && ./install.sh

echo "rpcuser=$(head -c 6 /dev/random | base64)" >> /.zclassic/zclassic.conf
echo "rpcpassword=$(head -c 20 /dev/random | base64)" >> /.zclassic/zclassic.conf

cp -f /.zclassic/zclassic.conf /.zclassic/zcash.conf
cp -Rf /.zclassic ~

if ! [ -d ~/.zcash ]
then
	ln -s /.zclassic ~/.zcash
else
	cp -f /.zclassic/zclassic.conf ~/.zcash/zcash.conf
fi

cd "${DIR}"
./install_params.sh
CODE=$?
if [ $? -ne 0 ]
then
	echo "ERROR: $CODE"
	read
fi
