#!/usr/bin/env bash

for f in `ls -A home`
do
  ln -ns "$PWD/home/$f" "$HOME/$f"
done

# TODO: Figure out how to make something like this work:
# for f in `ls Preferences`
# do
#   ln "$PWD/Preferences/$f" "$HOME/Library/Preferences/$f"
# done

# apm install --compatible --packages-file .atom/packages.txt
