#!/bin/bash

init_get() {
	if ! [ -d ../packages ]
	then
		mkdir -p ../packages
	fi
}

verify() {
	CODE=$?
	if [ $CODE -ne 0 ]
	then
		echo "ERROR: EXIT_CODE=${CODE}"
		exit $CODE
	fi
}

run() {
	./$1
	verify
}

rm_if_exists() {
	if [ -f $1 ]
	then
		rm -f $1
	fi
	if [ -d $1 ]
	then
		rm -Rf $1
	fi
	
}

CURL_PARAMS_NO_RESUME="--speed-limit 1000 --speed-time 15 --connect-timeout 5 --retry 999 --retry-delay 0 --retry-max-time 0 -fL"
CURL_PARAMS="${CURL_PARAMS_NO_RESUME} -C -"
