#! /bin/bash
# This script sets up the environment for the MAC project.

# check if brew is installed 
if ! command -v brew &> /dev/null
then
    echo "Homebrew could not be found. Plase install Homebrew first."
    exit 1
fi

# install apps from Brewfile
if [ -f Brewfile ]; then
    echo "Installing apps from Brewfile..."
    brew bundle
else
    echo "Brewfile not found. Please make sure it exists in the current directory."
    exit 1
fi

# check if stow is installed
if ! command -v stow &> /dev/null
then
    echo "Stow could not be found. Installing Stow..."
    brew install stow
fi

# sync contents of .configfiles dir with ~/.configfiles dir (create it if it doesn't exist)
mkdir -p ~/.configfiles
rsync -av --exclude='.git' --exclude='.DS_Store' .configfiles/ ~/.configfiles/

# create symlinks for all files in ~/.configfiles
cd ~/.configfiles && stow .



