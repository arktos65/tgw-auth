#!/usr/bin/env bash

# install-hooks.sh
#
# This script installs git hooks into the .git directory of this project to
# automate various operations such as linting the code before a commit, etc.

echo "...Installing git hooks"

echo ".....Adding pre-commit hook"
cp hooks/pre-commit.rb .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "...Done"
exit 1
