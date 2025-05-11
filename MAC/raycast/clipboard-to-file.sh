#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clipboard to File
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Takes a copied content and pipes it to VS Code
# @raycast.author Hynek Zemanec

#!/bin/bash

# Create a temp file with
TEMP_FILE=$(mktemp /tmp/clipToFile_XXXXXX)

# Write clipboard contents to the temp file
pbpaste > "$TEMP_FILE"

# Open the temp file in VS Code
code "$TEMP_FILE"
