#!/usr/bin/env bash

for f in `ls -A | grep -ve Brewfile.sh -e Preferences -e install.sh -e .git`
do
  ln -hs "$PWD/$f" "$HOME/$f"
done

# TODO: Figure out how to make something like this work:
# for f in `ls Preferences`
# do
#   ln "$PWD/Preferences/$f" "$HOME/Library/Preferences/$f"
# done

apm install --compatible --packages-file .atom/packages.txt
