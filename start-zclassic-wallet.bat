@echo off

bin\bash.exe -c "if [ $(ps -W | grep zcashd | wc -l) -eq 0 ]; then ./start-zclassic-server.exe& fi; ./zclassic-wallet.exe"
