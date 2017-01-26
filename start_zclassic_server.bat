@echo off
@set PATH=bin;c:\Program Files\Git\bin;%PATH%

bash -c "cd server && ./start-zclassic-server.sh"