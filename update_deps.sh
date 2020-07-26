#!/usr/bin/env bash

bundle --path vendor/bundle

echo "Updating bundle"
bundle update

echo "Cleaning up..."
gem cleanup
