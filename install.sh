#!/usr/bin/env bash

install_all() {
  install_home home
  # install_home `osname`
}

install_home() {
  for f in `ls -A $1`
  do
    ln -ns "$PWD/$1/$f" "$HOME/$f"
  done
}


osname() {
  uname -a | cut -d " " -f 1 | tr '[:upper:]' '[:lower:]'
}

install_all


# list() {
#    find `pwd -P`/$1 -maxdepth 1 -mindepth 1
# }


# TODO: Figure out how to make something like this work:
# for f in `ls Preferences`
# do
#   ln "$PWD/Preferences/$f" "$HOME/Library/Preferences/$f"
# done

# apm install --compatible --packages-file .atom/packages.txt
