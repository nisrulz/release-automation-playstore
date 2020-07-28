#!/usr/bin/env bash

bundle --path vendor/bundle

echo "Updating bundle"
bundle update

echo "Updating Bitrise CLI"
bitrise update

echo "Cleaning up..."
gem cleanup
