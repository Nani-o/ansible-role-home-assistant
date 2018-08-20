#!/bin/bash

[[ -z "$1" ]] && echo "usage: $0 GIT_URL" && exit 1

cd $(dirname $0)

[[ ! -d .git ]] && git init

ORIGIN=$(git remote -v | grep 'origin' | grep '(fetch)' | awk '{print $2}')
[[ "$ORIGIN" != $1 ]] && git remote remove origin && git remote add -f origin $1 && git reset --hard origin/master

BEFORE=$(git log | head -1)
git pull origin master
AFTER=$(git log | head -1)
[[ "$BEFORE" != "$AFTER" ]] && sudo systemctl restart homeassistant

exit 0
