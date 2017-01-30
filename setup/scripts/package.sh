#!/bin/bash

. lib/utils.sh

echo "Create ZClassic distribution package..."

run clean.sh
run get.sh
run install.sh

# Create zip package
cd ../