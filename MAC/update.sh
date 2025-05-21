#! /bin/bash

./sync.sh

# restow
cd ~/.configfiles && stow -R .

echo "All Configs Updated!"