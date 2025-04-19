#!/bin/bash

# output all the installed apps to a Brewfile and replace the existing one
brew bundle dump --describe --force --file=./Brewfile

# backup raycast 
open "raycast://extensions/raycast/raycast/export-settings-data"