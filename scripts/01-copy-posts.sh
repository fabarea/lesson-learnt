#!/usr/bin/env bash
set -euo pipefail

source config.sh

# Set counter variable
counter=0

# shellcheck disable=SC2231
for file in $SOURCE_PATH/*.learn.md; do
  cp "$file" "$TARGET_PATH"

  # shellcheck disable=SC2004
  counter=$(($counter + 1))
done


print "Done! Copied $counter files"

exit $?
