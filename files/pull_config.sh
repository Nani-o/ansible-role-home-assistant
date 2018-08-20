#!/bin/bash

[[ -z "$1" ]] && echo "usage: $0 GIT_URL" && exit 1

cd $(dirname $0)

[[ ! -d .git ]] && git init

ORIGIN=$(git remote -v | grep 'origin' | grep '(fetch)' | awk '{print $2}')
[[ "$ORIGIN" != $1 ]] && git remote add -f origin $1

FETCH=$(git remote update origin)
[[ "$FETCH" != "Fetching origin" ]] && git reset --hard origin/master

exit 0
