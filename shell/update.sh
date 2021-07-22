#!/bin/zsh

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
git_dir="$(dirname "$dir")"
git -C $git_dir remote update > /dev/null 2>&1

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git -C $git_dir rev-parse @)
REMOTE=$(git -C $git_dir rev-parse "$UPSTREAM")
BASE=$(git -C $git_dir merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    :
elif [ $LOCAL = $BASE ]; then
    vared -p "adamame is behind, do you wish to pull latest? [y/n]: " -c yn
    if [ "$yn" = "y" ]; then
        git -C $git_dir pull
        git -C $git_dir show -s --format=%s
    fi
fi
