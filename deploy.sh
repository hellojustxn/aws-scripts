#!/bin/bash

if [ $# != 2 ]; then echo "Usage: ./deploy.sh Descriptive comment here"; fi
git add *
git commit -m "$1"
git status
git push origin master
