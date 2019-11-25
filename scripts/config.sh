#!/usr/bin/env bash

# shellcheck disable=SC2034
# SOURCE_PATH=""
TARGET_PATH=".."

# if [ -f "$SOURCE_PATH" ]; then
#   echo "I could not find the source directory $SOURCE_PATH"
#   exit 1
# fi

if [ -f "$TARGET_PATH" ]; then
  echo "I could not find the source directory $SOURCE_PATH"
  exit 1
fi

# Source helper functions
source helpers.sh