#!/bin/bash

PARENT_DIR="$HOME/Coding"

# Find all .git directories up to 5 levels deep
find "$PARENT_DIR" -maxdepth 5 -type d -name ".git" | while read -r gitdir; do
  repo_dir=$(dirname "$gitdir")

  echo "Processing repo: $repo_dir"
  cd "$repo_dir" || { echo "Failed to cd into $repo_dir"; continue; }

  echo " - Setting core.autocrlf to false"
  git config core.autocrlf true || echo "   [ERROR] Failed to set core.autocrlf"

  echo " - Writing .gitattributes to disable line-ending normalization"
  echo "* -text" > .gitattributes || echo "   [ERROR] Failed to write .gitattributes"
  git add .gitattributes || echo "   [ERROR] Failed to git add .gitattributes"

  # Uncomment below lines if you want to commit automatically
  # echo " - Committing .gitattributes"
  # git commit -m "Disable line ending normalization" || echo "   [ERROR] Commit failed or nothing to commit"

  echo " - Removing cached files"
  git rm --cached -r . || echo "   [ERROR] git rm failed"

  echo " - Resetting working tree"
  git reset --hard || echo "   [ERROR] git reset failed"

  echo " - Done with $repo_dir"
  echo "----------------------"
done
