#!/bin/zsh

cd "$(dirname "$0")"
git remote update > /dev/null 2>&1

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    :
elif [ $LOCAL = $BASE ]; then
    vared -p "adamame is behind, do you wish to pull latest? [y/n]: " -c yn
    if [ "$yn" = "y" ]; then
        git pull
        git show -s --format=%s
    fi
fi

cd ~
