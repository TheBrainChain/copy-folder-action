#!/bin/sh -l

SOURCE_FOLDER="$1"
OUTPUT_FOLDER="$2"
GITHUB_USERNAME="$3"
GITHUB_REPO="$4"
USER_EMAIL="$5"

CLONE_DIR=$(mktemp -d)

# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
git clone "https://$API_TOKEN_GITHUB@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git" "$CLONE_DIR"

cp -r "$SOURCE_FOLDER" "$CLONE_DIR"/"$OUTPUT_FOLDER"

cd "$CLONE_DIR"

git add .
git commit --message "Update from https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA)"
git push origin master