#!/bin/bash

# this script will help you collect files with input extension in current location
# sh find_file_with_extension.sh .sh

file_name() {
  search_dir="$(pwd)"
  for entry in "$search_dir"/*; do
    #    echo "$entry"
    basename "$entry" $1
  done
}
file_name "$@"
