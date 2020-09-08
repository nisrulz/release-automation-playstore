#!/usr/bin/env bash

METADATA_DIR="fastlane/metadata"

echo "Getting metadata..."

# Delete existing metadata dir
rm -rf $METADATA_DIR
# Clone the metadata repo
git clone $ANDROID_METADATA_GIT_REPO_SSH_URL
# Sync with latest changes from master branch
cd metadata-apps && git checkout master && git pull && cd ..
# Create an empty metadata directory
mkdir $METADATA_DIR
# Move the files from cloned repo to metadata dir
mv metadata-apps/android/* $METADATA_DIR
