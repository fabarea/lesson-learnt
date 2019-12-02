#!/usr/bin/env bash
set -euo pipefail

source scripts/config.sh

cd "$WORKING_DIRECTORY"

print "Building..."
mkdocs build

print "Pushing to gh-pages..."
mkdocs gh-deploy

exit $?