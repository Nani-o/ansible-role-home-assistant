#!/bin/bash

cd $(dirname $0)
git init
git remote add origin $1
git fetch --all
git reset --hard origin/master
