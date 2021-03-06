#!/bin/bash

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

# Build the project.
hugo -s ./

# Copy over the 404 file so Github sees it.
cp public/404/index.html public/404.html

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
git subtree push --prefix=public public master
