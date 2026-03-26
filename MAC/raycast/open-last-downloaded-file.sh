#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Last Downloaded File
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Hynek Zemanec


open $HOME/Downloads/$(ls -t $HOME/Downloads | head -1)