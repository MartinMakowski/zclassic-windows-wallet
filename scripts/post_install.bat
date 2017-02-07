@echo off

if not exist "tmp" mkdir tmp

attrib -s -h /s /d .

bin\bash --login -c "echo"
bin\bash --login -c "cd /scripts && ./post_install.sh"

attrib -s -h /s /d .
