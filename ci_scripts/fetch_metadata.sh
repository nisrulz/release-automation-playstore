#!/bin/bash

echo "Starting up: Update Metadata for Playstore..."

# Create the distribution key json file from the ENV
echo ${ANDROID_SERVICE_ACC_KEY} > ./fastlane/api-android-service-acc-key.json

# Execute update_metadata lane
bundle exec fastlane android fetch_metadata
