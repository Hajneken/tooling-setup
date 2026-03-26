#! /bin/bash

# script synchronizes contents of existing .configfiles directory to the repository as a backup
rsync -av --delete ~/.configfiles/ ./.configfiles/ \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --exclude='.config/raycast' \
  --exclude='.config/containers/' \
  --exclude='.config/containers'


