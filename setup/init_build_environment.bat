@echo off

set msys_dir=c:\msys64

IF NOT EXIST %msys_dir% echo ERROR: Install MSYS2 i686 to %msys_dir% from https://msys2.github.io && pause && exit

xcopy /y scripts\init.sh %msys_dir%

c:
cd %msys_dir%
usr\bin\bash --login -c "cd ../.. && ./init.sh"

mkdir %msys_dir%\bin
xcopy /y home\git\bin\bash.exe %msys_dir%\bin

del /q %msys_dir%\init.sh

bin\bash -c 'rm -Rf home/git'