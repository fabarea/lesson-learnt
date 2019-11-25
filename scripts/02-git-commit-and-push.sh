#!/usr/bin/env bash
set -euo pipefail

source config.sh

cd "$TARGET_PATH"

git add .
git commit -m "Update content $(getCurrentDate)"
git push

exit $?