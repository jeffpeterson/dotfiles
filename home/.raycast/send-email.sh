#!/bin/zsh

# Send an email
#
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Send Email
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 📬
# @raycast.packageName Sendstack
# @raycast.currentDirectoryPath ~
# @raycast.argument1 { "type": "text", "placeholder": "to recipient", "optional": true }
#
# Documentation:
# @raycast.description Send an email.
# @raycast.author Jeff Peterson

if [[ -z "$1" ]]
then
  TO="@me"
else
  TO="$1"
fi

echo "Sending..."
pbpaste | send --to="$TO" "From Raycast"
