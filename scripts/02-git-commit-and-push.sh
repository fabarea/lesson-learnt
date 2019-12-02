#!/usr/bin/env bash
set -euo pipefail

source scripts/config.sh

cd "$WORKING_DIRECTORY"

git add .
git commit -m "Update content $(getCurrentDate)"
git push

exit $?