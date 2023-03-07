#!/bin/bash

# Exit if No File is Specified
if [[ "$#"  ==  '0' ]]; then
echo  -e 'ERROR: No File Specified!' && exit 1
fi

# File to Upload
FILE="@$1"

# Find the Best server to upload
SERVER=$(curl -s https://apiv2.gofile.io/getServer | jq  -r '.data|.server')

UPLOAD=$(curl -F file=${FILE} https://${SERVER}.gofile.io/uploadFile --max-time 1320 --retry 1 --retry-delay 0 --progress-bar)

LINK=$(echo $UPLOAD | jq -r '.data|.downloadPage')
fileName=$(echo $UPLOAD | jq -r '.data|.fileName')
# Print the link!
echo $fileName
echo $LINK
echo " "
