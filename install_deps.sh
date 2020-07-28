#!/usr/bin/env bash

brew update

# Fastlane (https://docs.fastlane.tools/)
brew install fastlane

# Bitrise CLI (https://devcenter.bitrise.io/bitrise-cli/index/)
brew install bitrise
# Make sure all deps for Bitrise CLI are installed
bitrise setup
