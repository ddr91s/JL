#!/bin/bash

# Exit if No File is Specified
if [[ "$#"  ==  '0' ]]; then
echo  -e 'ERROR: No File Specified!' && exit 1
fi

# File to Upload
FILE="@$1"

# Find the Best server to upload

UPLOAD=$(curl -F file=${FILE} https://api.myfile.is/upload --progress-bar)

LINK=$(echo $UPLOAD | jq -r '.data|.file|.url|.short')
fileName=$(echo $UPLOAD | jq -r '.data|.file|.metadata|.name')

echo $fileName
echo $LINK
echo " "
