#!/bin/bash

echo "Installing build tools..."

. lib/utils.sh

GIT=https://github.com/git-for-windows/git/releases/download/v2.11.0.windows.3/PortableGit-2.11.0.3-64-bit.7z.exe
if ! [ -d /c/msys64 ]
then
	echo "ERROR: Install MSYS2 i686 to c:\msys64 from https://msys2.github.io/"
	exit 1
fi

pacman --noconfirm -Syu 
pacman --noconfirm -Sy p7zip unrar python2
verify

if ! [ -d /home/git ]
then
	mkdir /home/git
fi
cd /home/git
curl -fL -o git.exe ${GIT}
7z -scrc -y x git.exe -y
verify