#!/bin/bash

# Config
ANT_URL=http://ftp.piotrkosoft.net/pub/mirrors/ftp.apache.org//ant/binaries/apache-ant-1.10.0-bin.zip
LAUNCH4J_URL=https://freefr.dl.sourceforge.net/project/launch4j/launch4j-3/3.9/launch4j-3.9-win32.exe

. lib/utils.sh
init_get
cd ../packages

# Ant
rm_if_exists ant.zip
echo "Downloading ${ANT_URL}..."
curl ${CURL_PARAMS} -o ant.zip "${ANT_URL}"  
verify
rm_if_exists apache-ant*
7z -scrc -y x ant.zip
verify

# Launch4j
rm_if_exists launch4j
echo "Downloading ${LAUNCH4J_URL}..."
curl -fL -o launch4j.zip "${LAUNCH4J_URL}"  
verify
rm_if_exists launch4j
7z x -scrc -y -olaunch4j launch4j.zip  
verify