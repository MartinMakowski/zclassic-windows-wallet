#!/bin/bash

PATH=/client:/mingw64/bin:/mingw32/bin:$PATH

pacman --noconfirm -Syuu
pacman --noconfirm -Sy p7zip mingw-w64-i686-go

export GOPATH=/mingw32
export GOROOT=/mingw32/lib/go
go get github.com/whyrusleeping/zmsg

pacman --noconfirm -Rscnd mingw-w64-i686-go
pacman --noconfirm -Sc