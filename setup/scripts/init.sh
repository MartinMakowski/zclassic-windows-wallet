#!/bin/bash

echo "Installing build tools..."

. lib/utils.sh

if ! [ -d /c/msys64 ]
then
	echo "ERROR: Install MSYS2 i686 to c:\msys64 from https://msys2.github.io/"
	exit 1
fi

pacman --noconfirm -Syu 
pacman --noconfirm -Sy p7zip unrar python2
verify
