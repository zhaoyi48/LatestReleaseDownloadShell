#!/bin/sh

download_latest_release() {
    URL=https://api.github.com/repos/${PROJECT}/releases/latest
    VERSION=$(curl --silent "${URL}" | jq -r '.tag_name')
    echo "$1 LATEST VERSION: $VERSION"
    DOWNLOAD_URL=$(curl --silent "${URL}" | jq -r '.assets[].browser_download_url'|grep $2)
    echo "DOWNLOAD:$DOWNLOAD_URL"
    wget -O $FILE_NAME $DOWNLOAD_URL
}

PROJECT=$1
FILE_PATTERN=$2
FILE_NAME=$3
download_latest_release $PROJECT $FILE_PATTERN $FILE_NAME