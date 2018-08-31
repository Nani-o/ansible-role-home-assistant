#!/bin/bash

[[ -z "$1" ]] && echo "usage: $0 GIT_URL" && exit 1
GIT_URL="$1"

cd $(dirname $0)

[[ ! -d .git ]] && git init
COMMIT_BEFORE=$(git log 2>&1 | head -1)

ORIGIN=$(git remote -v | grep 'origin' | grep '(fetch)' | awk '{print $2}')
if [[ "$ORIGIN" != "$GIT_URL" ]]
then
    [[ ! -z "$ORIGIN" ]] && git remote remove origin
    git remote add -f origin "$GIT_URL"
    git reset --hard origin/master
fi

git pull origin master

COMMIT_AFTER=$(git log | head -1)
[[ "$COMMIT_BEFORE" != "$COMMIT_AFTER" ]] && sudo systemctl restart homeassistant

[[ ! -f gilt.yml ]] && exit 0
GILT_BEFORE=$(find custom_components/ -type f | xargs -L 1 -P 5 -I {} md5sum {} | sort)
gilt overlay
GILT_AFTER=$(find custom_components/ -type f | xargs -L 1 -P 5 -I {} md5sum {} | sort)
[[ "$GILT_BEFORE" != "$GILT_AFTER" ]] && sudo systemctl restart homeassistant

exit 0
