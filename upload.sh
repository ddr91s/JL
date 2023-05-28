#!/bin/bash

# Exit if No File is Specified
if [[ "$#"  ==  '0' ]]; then
echo  -e 'ERROR: No File Specified!' && exit 1
fi

# File to Upload
FILE="@$1"

# Find the Best server to upload
UPLOAD=$(curl -F file=${FILE} https://store5.gofile.io/uploadFile --max-time 1800 --retry 1 --retry-delay 0 --progress-bar)

LINK=$(echo $UPLOAD | jq -r '.data|.downloadPage')
fileName=$(echo $UPLOAD | jq -r '.data|.fileName')
# Print the link!
echo $fileName
echo $LINK
echo " "
