#!/bin/bash

file_name() {
  search_dir="$(pwd)"
  for entry in "$search_dir"/*; do
    #    echo "$entry"
    basename "$entry" $1
  done
}
file_name "$@"
