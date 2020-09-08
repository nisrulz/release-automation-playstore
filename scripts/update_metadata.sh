#!/bin/bash

echo "Starting up: Update Metadata for Playstore..."

# Install dependencies
bundle install

# Get latest metadata from repo
./scripts/get_metadata.sh

# Create the distribution key json file from the ENV
echo ${ANDROID_SERVICE_ACC_KEY} > api-android-service-acc-key.json

# Execute update_metadata lane
bundle exec fastlane android update_metadata
