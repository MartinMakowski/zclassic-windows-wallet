#!/bin/bash

# Config
JAVA_URL=https://github.com/ojdkbuild/ojdkbuild/releases/download/1.8.0.111-3/java-1.8.0-openjdk-1.8.0.111-3.b15.ojdkbuild.windows.x86_64.zip
JAVA_SHA_URL=https://raw.githubusercontent.com/ojdkbuild/ojdkbuild/master/resources/checksums/java-1.8.0-openjdk-1.8.0.111-3.b15.ojdkbuild.windows.x86_64.zip.sha256

. lib/utils.sh
init_get
cd ../packages

echo
echo "Downloading Open JDK... (Community builds using source code from OpenJDK project) https://github.com/ojdkbuild/ojdkbuild"
echo
echo "Downloading: ${JAVA_SHA_URL}"
rm_if_exists java.zip.sha256
curl ${CURL_PARAMS} -# -o java.zip.sha256 "${JAVA_SHA_URL}" 
echo "$(awk '{print $1}' java.zip.sha256) java.zip" > java.zip.sha256
echo
echo "Downloading: ${JAVA_URL}"
rm_if_exists java.zip
curl ${CURL_PARAMS} -o java.zip "${JAVA_URL}" 

sha256sum.exe -c java.zip.sha256
verify

