#!/bin/bash
set -o errexit

: "${GHOST_INSTALL:?GHOST_INSTALL is not set}"
: "${GHOST_CONTENT:?GHOST_CONTENT is not set}"

baseDir="${GHOST_INSTALL}/content.orig"

for src in "$baseDir"/*/ "$baseDir"/themes/*; do
  src="${src%/}"
  target="${GHOST_CONTENT}/${src#$baseDir/}"
  mkdir -p "$(dirname "$target")"
  if [ ! -e "$target" ]; then
    tar -cC "$(dirname "$src")" "$(basename "$src")" | tar -xC "$(dirname "$target")"
  fi
done

# update the URL in config.production.json
node updateConfig.js

# start Ghost
exec node current/index.js
