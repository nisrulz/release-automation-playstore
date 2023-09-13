#!/usr/bin/env bash

bundle update --bundler

bundle config set path 'vendor/bundle'

echo "Updating bundle"
bundle update

echo "Updating Bitrise CLI"
bitrise update

echo "Cleaning up..."
gem cleanup
