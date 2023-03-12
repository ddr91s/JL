#!/bin/bash

# Exit if No File is Specified
if [[ "$#"  ==  '0' ]]; then
echo  -e 'ERROR: No File Specified!' && exit 1
fi

# File to Upload
FILE="@$1"

# Find the Best server to upload
UPLOAD=$(curl -F file=${FILE}  -F "api_token=41Iqg2t8oSmVWnvYu9Mw8wIecJeyiEgPU21y7ECbFqM7E67x3mTmsaurnTaq" https://upload.embedgram.com/api/uploadapi --progress-bar)

echo " "
