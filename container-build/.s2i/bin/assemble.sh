#!/bin/bash

set -e

source ${HTTPD_CONTAINER_SCRIPTS_PATH}/common.sh

echo "---> Enabling s2i support in httpd24 image"

config_s2i

######## CUSTOMIZATION STARTS HERE ############

echo "---> Installing application source"
cp -Rf /tmp/src/*.html ./

DATE=`date "+%Y-%b-%d"`

echo "---> Creating info page"
echo "Page built on $DATE" >> ./info.html
echo "Proudly served by Apache HTTP Server version $HTTPD_VERSION" >> ./info.html

######## CUSTOMIZATION ENDS HERE ############

if [ -d ./httpd-cfg ]; then
  echo "---> Copying httpd configuration files..."
  if [ "$(ls -A ./httpd-cfg/*.conf)" ]; then
    cp -v ./httpd-cfg/*.conf "${HTTPD_CONFIGURATION_PATH}"
    rm -rf ./httpd-cfg
  fi
else
  if [ -d ./cfg ]; then
    echo "---> Copying httpd configuration files from deprecated './cfg' directory, use './httpd-cfg' instead..."
    if [ "$(ls -A ./cfg/*.conf)" ]; then
      cp -v ./cfg/*.conf "${HTTPD_CONFIGURATION_PATH}"
      rm -rf ./cfg
    fi
  fi
fi

# Fix source directory permissions
fix-permissions ./
