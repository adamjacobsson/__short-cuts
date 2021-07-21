#!/bin/zsh

git remote update > /dev/null

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    vared -p "adamame is behind, do you wish to pull latest? [y/n]: " -c yn
    if [ "$yn" = "y" ]; then
        git pull
    fi
fi
