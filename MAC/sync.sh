#! /bin/bash

# This script synchronizes the contents of the .configfiles directory with the user's home directory.
rsync -av --delete \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --exclude='.config/raycast' \
  --exclude='.config/containers/' \
  --exclude='.config/containers' \
  ./.configfiles/ ~/.configfiles/