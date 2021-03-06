#!/bin/bash

DIR=$PWD

# Config
MSYS_DIR="${DIR}/../packages/msys2"

. lib/utils.sh
echo "Package MSYS2..."

# Prepare 
prepare() {
	cd "$MSYS_DIR"

	if [ -d "${MSYS_DIR}/msys32" ]
	then
		rm -Rf "${MSYS_DIR}/msys32"
	fi
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
	cp -Rf git/mingw64/* msys32/mingw64
}
prepare

# Cleanup
cleanup() {
	rm -Rf "${MSYS_DIR}/msys32/mingw64/share/doc"
	cd "${MSYS_DIR}/msys32/usr/share"
	if [ $# -eq 0 ]
	then
		DIRS=`ls locale | grep -v en`
		cd locale
	rm -Rf $DIRS
	fi
	cd ..
	rm -Rf man doc zoneinfo info
	rm -Rf man doc zoneinfo info
	cd ..
	rm -Rf bin/msys-icudata*.*
}
cleanup

# Permissions
echo
echo "Changing permissions..."
chmod -R a+rw "${MSYS_DIR}/msys32"

# Pre package
echo
echo "Pre package" 
cd "$DIR"
echo "${MSYS_DIR}/msys32/scripts"
mkdir -p "${MSYS_DIR}/msys32/scripts"
cp ./msys2_prepackage.sh "${MSYS_DIR}/msys32/scripts"
cd "${MSYS_DIR}/msys32/bin"

# Update MSYS2
# First update hangs on tty upgrade
$COMSPEC /c "bash.exe --login -c 'pacman --noconfirm -Syu'"
$COMSPEC /c "bash.exe --login -c '/scripts/msys2_prepackage.sh'"

rm -Rf "${MSYS_DIR}/msys32/scripts" "${MSYS_DIR}/msys32/home"

# Dist
dist() {
	DIST_DIR="${DIR}/../../dist/zclassic"
	if [ -d "${DIST_DIR}" ]
	then
		rm -Rf "${DIST_DIR}"
	fi
	mkdir -p "${DIST_DIR}"
	mv ${MSYS_DIR}/msys32/* "${DIST_DIR}"
	verify
	mkdir -p "${DIST_DIR}/tmp"

	# Clean
	rm -Rf "${MSYS_DIR}/msys32"
	rm -Rf "${MSYS_DIR}/git"
}
dist