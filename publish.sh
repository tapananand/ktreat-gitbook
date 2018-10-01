#!/bin/bash
git add .
message="Changes"
if [ $# -ge 1 ]
then
    message=$1
fi

git commit -m "$message"
git push origin master

exit 0