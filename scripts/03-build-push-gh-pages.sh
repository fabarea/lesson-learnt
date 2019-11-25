#!/usr/bin/env bash
set -euo pipefail

source config.sh

cd "$TARGET_PATH"

print "Building..."
mkdocs build

print "Pushing to gh-pages..."
mkdocs gh-deploy

exit $?