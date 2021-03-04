#!/bin/bash

if [ $# != 1 ]; then echo "Usage: ./deploy.sh 'Descriptive comment here'" && exit 1; fi
git add *
git commit -m "$1"
git status
git push origin main
