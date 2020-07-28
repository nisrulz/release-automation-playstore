#!/usr/bin/env bash

# This bash script creates ENV vars for local/CI build setup

# Prequisite: 
# Install jq: brew install jq

# Usage:
#   ./createEnvVars.sh api-android-service-acc-key.json


TEMP_FILE="temp.json"
function processAPIKeyJSON(){
    FILE=$1
    if [ -f "$FILE" ]; then
        jq -c . "$FILE" >$TEMP_FILE
    else
        echo ""
        echo "!!!!! NO API KEY JSON FILE PROVIDED. ABORTING !!!!!"
        echo ""
        echo "You need to provide api-key.json file as an argument to this script"
        echo ""
        echo "Example:"
        echo ""
        echo "     ./createEnvVars.sh api-android-service-acc-key.json"
        echo ""
        exit
    fi
}

echo "================================================================" 
echo ""
echo -n "Android package name: "
read packageName
echo ""
echo -n "Android metadata git repo SSH url: "
read metadataGitUrl
echo ""
echo -n "Create ENV vars for local builds (y/n)? "
read answer

processAPIKeyJSON $1

if [ "$answer" != "${answer#[Yy]}" ] ;thencl
    # Local ENV
    BITRISE_SECRETS_FILE=".bitrise.secrets.yml"
    echo "envs:" > $BITRISE_SECRETS_FILE
    echo "- ANDROID_PACKAGE_NAME: $packageName" >> $BITRISE_SECRETS_FILE
    echo "- ANDROID_METADATA_GIT_REPO_SSH_URL: $metadataGitUrl" >> $BITRISE_SECRETS_FILE
    echo "- ANDROID_SERVICE_ACC_KEY: '$(cat $TEMP_FILE)'" >> $BITRISE_SECRETS_FILE
    echo "" 
    echo "================================================================" 
    echo "$BITRISE_SECRETS_FILE created with ENV vars. This file should not be shared/added to git." 
    echo "" 
    echo "Done." 
else
    # CI ENV
    echo "================================================================" 
    echo "Create Secret ENV vars in Bitrise CI with Key-Value pair" 
    echo "" 
    echo "      ANDROID_PACKAGE_NAME: $packageName"
    echo "" 
    echo "      ANDROID_METADATA_GIT_REPO_SSH_URL: $metadataGitUrl"
    echo "" 
    echo "      ANDROID_SERVICE_ACC_KEY: $(cat $TEMP_FILE)"
    echo "" 
fi
rm $TEMP_FILE

