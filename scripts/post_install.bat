@echo off

if not exist "tmp" mkdir tmp

bin\bash --login -c "echo"
bin\bash --login -c "cd /scripts && ./post_install.sh"


