#!/usr/bin/env bash

SCRIPTS="$( cd "$(dirname "$0")" ; pwd -P )"

# shellcheck disable=SC2034
WORKING_DIRECTORY="$SCRIPTS/.."

# if [ -f "$SOURCE_PATH" ]; then
#   echo "I could not find the source directory $SOURCE_PATH"
#   exit 1
# fi

if [ -f "$WORKING_DIRECTORY" ]; then
  echo "I could not find the source directory $SOURCE_PATH"
  exit 1
fi

# Source helper functions
source "$SCRIPTS/helpers.sh"