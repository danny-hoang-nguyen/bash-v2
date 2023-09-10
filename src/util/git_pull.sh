#!/bin/bash
# copy this script to you source folder which contains a lot of small git repositories
# it will do: fetch, switch to branch master and pull
# NOTE: remember to stash your WIP beforehand using `git stash`
# NOTE: if your critical branch is not master, please modify `git checkout master` to `git checkout main` etc.
# NOTE: you need to add your public key to github first, otherwise this script won't work

update() {
  search_dir="$(pwd)"
  for entry in "$search_dir"/*; do
    echo "Processing : $entry"
    cd "$entry" || exit
    if git tag >/dev/null 2>&1; then
      git fetch && git stash && git checkout master && git pull origin
    else
      echo "$entry is not git, skipping it now."
    fi
    echo "+++++++++++++++++++++++"
  done
}
update "$@"
